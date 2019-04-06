using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Conventions.Internal;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using Microsoft.EntityFrameworkCore.TestUtilities;
using Microsoft.Extensions.DependencyInjection;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;
using Pomelo.EntityFrameworkCore.MySql.Storage.Internal;
using Xunit;

namespace FXY_NetCore_WebApi_XUnitTest
{
    public class MyMigrationSqlGeneratorMySqlTest : MigrationSqlGeneratorTestBase
    {
        public MyMigrationSqlGeneratorMySqlTest()
          : base(MySqlTestHelpers.Instance)
        {
        }

        [Fact]
        public virtual void It_lifts_foreign_key_additions()
        {
            Generate(
               new CreateTableOperation
               {
                   Name = "Pie",
                   Columns =
                   {
                        new AddColumnOperation
                        {
                            ClrType = typeof(int),
                            Name = "FlavorId",
                            ColumnType = "INT"
                        }
                   }
               }, new AddForeignKeyOperation
               {
                   Table = "Pie",
                   PrincipalTable = "Flavor",
                   Columns = new[] { "FlavorId" },
                   PrincipalColumns = new[] { "Id" }
               });

            Assert.Equal(
               @"CREATE TABLE `Pie` (
    `FlavorId` INT NOT NULL" + EOL +
               ");" + EOL +
               EOL +
               @"ALTER TABLE `Pie` ADD FOREIGN KEY (`FlavorId`) REFERENCES `Flavor` (`Id`);" + EOL
               ,
               Sql,
               ignoreLineEndingDifferences: true);
        }

        [Fact]
        public virtual void It_lifts_foreign_key_additions1()
        {
            Generate(
               new AddColumnOperation
               {
                   Name="ninhao",
                   ColumnType="string"
               });

            Assert.Equal(
               @"CREATE TABLE `Pie` (
    `FlavorId` INT NOT NULL" + EOL +
               ");" + EOL +
               EOL +
               @"ALTER TABLE `Pie` ADD FOREIGN KEY (`FlavorId`) REFERENCES `Flavor` (`Id`);" + EOL
               ,
               Sql,
               ignoreLineEndingDifferences: true);
        }
    }















    public class MySqlTestHelpers : TestHelpers
    {
        protected MySqlTestHelpers()
        {
        }

        public static MySqlTestHelpers Instance { get; } = new MySqlTestHelpers();

        public override IServiceCollection AddProviderServices(IServiceCollection services)
            => services.AddEntityFrameworkMySql();

        protected override void UseProviderOptions(DbContextOptionsBuilder optionsBuilder)
            => optionsBuilder.UseMySql("Database=DummyDatabase");

        public IServiceProvider CreateContextServices(Version version, ServerType type)
            => ((IInfrastructure<IServiceProvider>)new DbContext(CreateOptions(version, type))).Instance;

        public IServiceProvider CreateContextServices(CharSetBehavior charSetBehavior, CharSet ansiCharSet, CharSet unicodeCharSet)
            => ((IInfrastructure<IServiceProvider>)new DbContext(CreateOptions(charSetBehavior, ansiCharSet, unicodeCharSet))).Instance;

        public ModelBuilder CreateConventionBuilder(IServiceProvider contextServices)
        {
            var conventionSetBuilder = new CompositeConventionSetBuilder(
                contextServices.GetRequiredService<IEnumerable<IConventionSetBuilder>>().ToList());
            var conventionSet = contextServices.GetRequiredService<ICoreConventionSetBuilder>().CreateConventionSet();
            conventionSet = conventionSetBuilder.AddConventions(conventionSet);
            return new ModelBuilder(conventionSet);
        }

        public DbContextOptions CreateOptions(Version version, ServerType type)
        {
            var optionsBuilder = new DbContextOptionsBuilder();
            optionsBuilder.UseMySql("Database=DummyDatabase", b => b.ServerVersion(version, type));

            return optionsBuilder.Options;
        }

        public DbContextOptions CreateOptions(CharSetBehavior charSetBehavior, CharSet ansiCharSet, CharSet unicodeCharSet)
        {
            var optionsBuilder = new DbContextOptionsBuilder();
            optionsBuilder.UseMySql("Database=DummyDatabase", b => b.CharSetBehavior(charSetBehavior).AnsiCharSet(ansiCharSet).UnicodeCharSet(unicodeCharSet));

            return optionsBuilder.Options;
        }
    }
}
