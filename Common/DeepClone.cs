using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Xml.Serialization;

namespace Framework.NetCore.FXYClass
{
    /// <summary>
    /// a class that use to deep clone instance.
    /// </summary>
    public class DeepClone
    {
        /// <summary>
        /// a dictionary to save the hashcode of the instance which has been used。
        /// </summary>
        private static Dictionary<int, string> _objectHashCodeDic { get; set; }

        /// <summary>
        /// the constructor of this class,It must be built-in so that the dictionary can be emptied.
        /// </summary>
        public DeepClone()
        {
            //Clear the dictionary when create new instance.
            _objectHashCodeDic = new Dictionary<int, string>();
        }

        /// <summary>
        /// provide a method to deep clone with reflection.
        /// </summary>
        /// <typeparam name="T">the type of the instance which you want to deep clone</typeparam>
        /// <param name="model">the instance which you want to deep clone</param>
        /// <returns></returns>
        public T CloneByRelaction<T>(T model) where T : class
        {
            try
            {
                Type type = model.GetType();

                int hashCode = model.GetHashCode();
                string name = type.FullName;

                if (_objectHashCodeDic.ContainsKey(hashCode))
                {
                    string exsitName = _objectHashCodeDic[hashCode];
                    throw new Exception("There are mutual references between instances " + exsitName + " and,and deep replication of instances can not be completed.");
                }
                else
                {
                    _objectHashCodeDic.Add(hashCode, name);
                }

                PropertyInfo[] properties = type.GetProperties();
                dynamic[] parameters = new dynamic[properties.Length];

                for (int i = 0; i < properties.Length; i++)
                {
                    object value = properties[i].GetValue(model);
                    Type propertyType = properties[i].PropertyType;
                    if (!propertyType.IsPrimitive && propertyType != typeof(string) && propertyType != typeof(object) && value != null)
                    {
                        value = CloneByRelaction(value);
                    }
                    parameters[i] = value;
                }
                return (T)Activator.CreateInstance(type, parameters);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        /// <summary>
        ///  provide a method to deep clone with JsonConvert.
        /// </summary>
        /// <typeparam name="T">the type of the instance which you want to deep clone</typeparam>
        /// <param name="model">the instance which you want to deep clone</param>
        /// <returns></returns>
        public T CloneByJsonConvert<T>(T model) where T : class
        {
            try
            {
                string str = JsonConvert.SerializeObject(model);
                return (T)JsonConvert.DeserializeObject(str);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        /// <summary>
        /// provide a method to deep clone with XmlSerialize.
        /// </summary>
        /// <typeparam name="T">the type of the instance which you want to deep clone</typeparam>
        /// <param name="model">the instance which you want to deep clone</param>
        /// <returns></returns>
        public T CloneByXmlSerialize<T>(T model) where T : class
        {
            object retval;
            using (MemoryStream ms = new MemoryStream())
            {
                XmlSerializer xml = new XmlSerializer(typeof(List<T>));
                xml.Serialize(ms, model);
                ms.Seek(0, SeekOrigin.Begin);
                retval = xml.Deserialize(ms);
                ms.Close();
            }
            return (T)retval;
        }


        public T CloneByExpression<T>(Expression<Action<T>> model) where T : class
        {
            try
            {
                return null;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void GetExpression<T>(T model) where T : class
        {

        }
    }
}
