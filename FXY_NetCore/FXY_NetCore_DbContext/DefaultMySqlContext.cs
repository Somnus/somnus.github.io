using FXY_NetCore_DbEntity;
using Microsoft.EntityFrameworkCore;

namespace FXY_NetCore_DbContext
{
    public class DefaultMySqlContext : DbContext
    {
        public DefaultMySqlContext(DbContextOptions<DefaultMySqlContext> options) : base(options)
        {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder dbContextOptionsBuilder)
        {
            dbContextOptionsBuilder.UseMySql("Server=127.0.0.1;Port=3306;Database=test;User=root;Password=root;sslmode=none;");
        }

        public DbSet<Student> Students { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
    }
}
