using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Framework.NetCore.FXYClass
{
    public class ThreadSafe
    {
        /// <summary>
        /// Instantiate list
        /// </summary>
        private static List<int> TestList { get; set; }

        #region public
        /// <summary>
        /// Check that the multithreaded operation of List is secure 
        /// </summary>
        public bool CheckThreadSafeOfListAdd()
        {
            TestList = new List<int>();
            int threadCount = 2;
            int threadCircleCount = 5;
            bool isAllAdded = false;

            try
            {
                List<Task> taskList = new List<Task>();
                for (int i = 0; i < threadCount; i++)
                {
                    var task = Task.Factory.StartNew(() =>
                    {
                        AddProducts(threadCircleCount);
                    });
                    taskList.Add(task);
                }

                Task.WaitAll(taskList.ToArray());
            }
            catch (System.Exception)
            {
                isAllAdded = false;
                throw;
            }

            int hasAddCount = TestList.Count;
            isAllAdded = hasAddCount == threadCount * threadCircleCount;

            return isAllAdded;
        }
        #endregion

        #region private
        /// <summary>
        /// Add data to list
        /// </summary>
        /// <param name="count"></param>
        private static void AddProducts(int count)
        {
            Parallel.For(0, count, (i) =>
            {
                TestList.Add(i);
            });
        }
        #endregion
    }
}
