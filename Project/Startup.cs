
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Project
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddAuthentication()
                 .AddFacebook(facebookOptions =>
                 {
                     // Đọc cấu hình
                     IConfigurationSection facebookAuthNSection = Configuration.GetSection("Authentication:Facebook");
                     facebookOptions.AppId = facebookAuthNSection["AppId"];
                     facebookOptions.AppSecret = facebookAuthNSection["AppSecret"];
                     // Thiết lập đường dẫn Facebook chuyển hướng đến
                     facebookOptions.CallbackPath = "/sigin-facbook";
                 });
             
        }
    }
}
