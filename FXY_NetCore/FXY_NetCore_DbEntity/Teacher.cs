using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FXY_NetCore_DbEntity
{
    public class Teacher
    {
        [Key]
        public string UUID { get; set; }
        public string Name { get; set; }
        public string BirthPlace { get; set; }
    }
}
