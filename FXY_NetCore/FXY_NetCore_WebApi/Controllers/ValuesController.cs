using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FXY_NetCore_DbContext;
using FXY_NetCore_DbEntity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FXY_NetCore_WebApi.Controllers
{
    [Route("api/[controller]/[action]")]
    public class ValuesController : Controller
    {
        protected DefaultMySqlContext Db { get; set; }
        public ValuesController(DefaultMySqlContext defaultMySqlContext)
        {
            Db = defaultMySqlContext;
        }
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            //var studentList = new List<Student>();
            //for (int i = 0; i < 100000; i++)
            //{
            //    studentList.Add(new Student() { UUID = Guid.NewGuid().ToString(), BirthPlace = "yun", Name = "fxy" });
            //}
            //Db.Students.AddRange(studentList);
            //Db.SaveChanges();


            var studentList1 = Db.Set<Student>().Take(100).ToList();
            //var studentList2 = Db.Set<Student>().AsNoTracking().Take(100).ToList();
            //Add~EntityState=Added,
            //string uuid = Guid.NewGuid().ToString();

            //Student student = new Student() { UUID = uuid, BirthPlace = "yun", Name = "fxy" };
            //EntityState state0 = Db.Entry(student).State;

            //Db.Add(student);
            //EntityState state1 = Db.Entry(student).State;

            //Db.SaveChanges();
            //EntityState state2 = Db.Entry(student).State;

            //student.BirthPlace = "sss";
            //EntityState state3= Db.Entry(student).State;

            //Db.SaveChanges();
            //EntityState state4= Db.Entry(student).State;

            //Db.Students.Remove(student);
            //EntityState state5 = Db.Entry(student).State;

            //Db.SaveChanges();
            //EntityState state6 = Db.Entry(student).State;


            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
