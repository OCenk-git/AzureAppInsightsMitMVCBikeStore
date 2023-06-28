using AzureAppInsightsMitMVCBikeStore.Models;
using Microsoft.EntityFrameworkCore;

namespace AzureAppInsightsMitMVCBikeStore
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            // Code Anpassung wegen AI
            builder.Services.AddApplicationInsightsTelemetry();

            builder.Services.AddDbContext<BikeStoresContext>(options => options.UseLazyLoadingProxies().
            UseSqlServer(builder.Configuration.GetConnectionString("MeineDatenbank")));
            //Kommentartest


            var app = builder.Build();

                        // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Products/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Products}/{action=Index}/{id?}");

            app.Run();
        }
    }
}