using FXY_NetCore_DbContext;
using FXY_NetCore_DbEntity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace FXY_NetCore_Console
{
    class Program
    {
        private static DbContextOptions dbContextOptions;
        private static string mysqlConStr = "Server=47.106.241.221;Port=3306;Database=test;User=root;Password=root;sslmode=none;";
        static void Main(string[] args)
        {
            dbContextOptions = new DbContextOptionsBuilder().UseMySql(mysqlConStr).Options;
            DefaultMySqlContext context = new DefaultMySqlContext(dbContextOptions);

            using (context)
            {
                context.Database.Migrate();
                //var studentList = context.Students.ToList();
            }


            Console.WriteLine("Hello World!");
        }
    }
}
