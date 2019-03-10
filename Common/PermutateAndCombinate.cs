using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml.Serialization;

namespace Framework.NetCore.FXYClass
{
    /// <summary>
    /// 排列组合帮助类
    /// </summary>
    public class PermutateAndCombinate<T>
    {
        private List<List<T>> PermutationResult { get; set; }
        private DeepClone DeepClone { get; set; }

        /// <summary>
        /// 获取指定集合的全排列
        /// </summary>
        /// <param name="lsArray"></param>
        /// <returns></returns>
        public List<List<T>> GetPermutation(List<T> lsArray)
        {
            DeepClone = new DeepClone();
            PermutationResult = new List<List<T>>();
            A(lsArray, 0, lsArray.Count);
            return PermutationResult;
        }

        /// <summary>
        /// 对数组进行全排列
        /// </summary>
        /// <param name="lsArray">要进行全排列的数组</param>
        /// <param name="begin">进行全排列的开始下标</param>
        /// <param name="end">进行全排列的结束下标</param>
        private void A(List<T> lsArray, int begin, int end)
        {
            if (begin == end)
            {
                var list = DeepClone.CloneByJsonConvert(lsArray);
                PermutationResult.Add(list);
            }
            for (int i = begin; i < end; i++)
            {
                Swap(lsArray, begin, i);
                A(lsArray, begin + 1, end);
                Swap(lsArray, begin, i);
            }
        }

        /// <summary>
        /// 交换数组中的下标为x,y的值
        /// </summary>
        /// <param name="lsArray">该数组</param>
        /// <param name="x"></param>
        /// <param name="y"></param>
        private void Swap(List<T> lsArray, int x, int y)
        {
            T t = lsArray[x];
            lsArray[x] = lsArray[y];
            lsArray[y] = t;
        }
    }
}
