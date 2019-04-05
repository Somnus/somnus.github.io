using FXY_NetCore_DbEntity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using Pomelo.EntityFrameworkCore.MySql.Internal;
using System;

namespace FXY_NetCore_DbContext
{
    public class DefaultMySqlContext : DbContext
    {
        public DefaultMySqlContext(DbContextOptions<DefaultMySqlContext> options) : base(options)
        {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder dbContextOptionsBuilder)
        {
            dbContextOptionsBuilder
                .UseMySql("Server=47.106.241.221;Port=3306;Database=test;User=root;Password=root;sslmode=none;")
                .ReplaceService<MyMigrationsSqlGenerator, MyMigrationsSqlGenerator>();
        }

        public DbSet<Student> Students { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
    }

    public class MyMigrationsSqlGenerator : MySqlMigrationsSqlGenerator
    {
        public MyMigrationsSqlGenerator(MigrationsSqlGeneratorDependencies dependencies,
            IMigrationsAnnotationProvider migrationsAnnotations,
            MySqlOptions options)
            : base(dependencies, migrationsAnnotations, options)
        {
        }



        protected override void ColumnDefinition(
                    AddColumnOperation operation,
                    IModel model,
                    MigrationCommandListBuilder builder)
        {
            base.ColumnDefinition(operation, model, builder);
            builder.Append(" COMMENT 'NIHAO' ");
        }




        //protected override void ColumnDefinition(
        //    string schema,
        //    string table,
        //    string name,
        //    Type clrType,
        //    string type,
        //    bool? unicode,
        //    int? maxLength,
        //    bool? fixedLength,
        //    bool rowVersion,
        //    bool nullable,
        //    object defaultValue,
        //    string defaultValueSql,
        //    string computedColumnSql,
        //    bool identity,
        //    IAnnotatable annotatable,
        //    IModel model,
        //    MigrationCommandListBuilder builder)
        //{
        //    base.ColumnDefinition(schema, table, name, clrType, type, unicode, maxLength, fixedLength, rowVersion, nullable, defaultValue, defaultValueSql, computedColumnSql, identity, annotatable, model, builder);
        //    builder.Append(" ");
        //    builder.Append("hello");
        //    builder.Append(" ");
        //    builder.AppendLine(Dependencies.SqlGenerationHelper.StatementTerminator);
        //    builder.EndCommand();
        //}
    }
}
