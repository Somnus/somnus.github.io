using FXY_NetCore_WebApi;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using System;
using Xunit;
using System.Threading.Tasks;

namespace FXY_NetCore_WebApi_XUnitTest
{
    public class UnitTest1 : IClassFixture<TestServerFixture>
    {
        private readonly TestServerFixture server;
        public UnitTest1(TestServerFixture testServerFixture)
        {
            server = testServerFixture;
        }

        [Fact]
        public async Task Test1Async()
        {
            var response = await server.Client.GetAsync("/api/values/get");
            var content = await response.Content.ReadAsStringAsync();
            Assert.StartsWith("[", content);

        }

        [Fact]
        public async Task Test2Async()
        {
            var builder = WebHost.CreateDefaultBuilder().UseEnvironment("Development").UseStartup<Startup>();
            using (var server = new TestServer(builder))
            {
                var httpClient = server.CreateClient();
                var response = await httpClient.GetAsync("/api/values/get");
                var content = await response.Content.ReadAsStringAsync();
                Assert.StartsWith("[", content);
            }
        }
    }
}
