using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Collections.Concurrent;
using System.Linq;

namespace Framework.NetCore.Console
{
    class Program
    {
        private static List<Product> ProductList { get; set; }
        private static Dictionary<string,Product> ProductDictionary { get; set; }
        private static BlockingCollection<Product> ProductBlockList { get; set; }
        private static ConcurrentDictionary<string, Product> ProducutConcurrentDictionary { get; set; }
        static void Main(string[] args)
        {
            ProductList = new List<Product>();
            ProductDictionary = new Dictionary<string, Product>();
            ProductBlockList = new BlockingCollection<Product>();
            ProducutConcurrentDictionary = new ConcurrentDictionary<string, Product>();

            int taskCount = 2;
            int circleCount = 1000;
            List<Task> taskList = new List<Task>();
            for(int i = 0; i < taskCount; i++)
            {
                Task task= Task.Factory.StartNew(() =>
                {
                    AddProducts(circleCount);
                });
                taskList.Add(task);
            }    
            Task.WaitAll(taskList.ToArray());

            int listCount = ProductList.Count;
            int dictionaryCount = ProductDictionary.Count;
            int blockListCount = ProductBlockList.Count;
            int ConcurrentDictionaryCount = ProducutConcurrentDictionary.Count;

            System.Console.ReadLine();
        }
        static void AddProducts(int count)
        {
            Parallel.For(0, count, (i) =>
            {
                Product product = new Product
                {
                    Name = "name" + i,
                    Category = "Category" + i,
                    SellPrice = i
                };
                ProductList.Add(product);
                ProductDictionary.Add(Guid.NewGuid().ToString(), product);
                ProductBlockList.Add(product);
                ProducutConcurrentDictionary.TryAdd(Guid.NewGuid().ToString(), product);
            });

        }
    }
    class Product
    {
        public string Name { get; set; }
        public string Category { get; set; }
        public int SellPrice { get; set; }
    }
}
