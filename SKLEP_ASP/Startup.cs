using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SKLEP_ASP.Startup))]
namespace SKLEP_ASP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
