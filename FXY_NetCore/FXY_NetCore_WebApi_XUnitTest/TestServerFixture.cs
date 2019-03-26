using FXY_NetCore_WebApi;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;

namespace FXY_NetCore_WebApi_XUnitTest
{
    public class TestServerFixture : IDisposable
    {
        private readonly TestServer _testServer;
        public readonly HttpClient Client;
        public TestServerFixture()
        {
            var builder = WebHost.CreateDefaultBuilder()
                .UseEnvironment("Development").UseStartup<Startup>();
            _testServer = new TestServer(builder);
            Client = _testServer.CreateClient();
        }

        public void Dispose()
        {
            Client.Dispose();
            _testServer.Dispose();
        }
    }
}
