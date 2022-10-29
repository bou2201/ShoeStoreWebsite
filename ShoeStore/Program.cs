using System.Text.Json.Serialization;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using ShoeStore.DataAccess;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.DbInitializer;
using ShoeStore.DataAccess.Repository;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Infrastructure;
using ShoeStore.Ultitity;
using Stripe;

var builder = WebApplication.CreateBuilder(args);
// var connectionString = builder.Configuration.GetConnectionString("DataContextConnection") ?? throw new InvalidOperationException("Connection string 'DataContextConnection' not found.");

builder.Services.AddControllers()
    .AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
builder.Services.AddControllersWithViews();

// builder.Services.AddDbContext<DataContext>(options =>
//     options.UseSqlServer(builder.Configuration["ConnectionStrings:ProductConnection"]
//         ,
//         o => o.UseQuerySplittingBehavior(QuerySplittingBehavior.SplitQuery)
//     ));

builder.Services.AddDbContext<DataContext>(options =>
    options.UseSqlServer(builder.Configuration["ConnectionStrings:ProductConnection_Local"],
        o => o.UseQuerySplittingBehavior(QuerySplittingBehavior.SplitQuery)
    ));

builder.Services.Configure<StripeSettings>(builder.Configuration.GetSection("Stripe"));

builder.Services.AddIdentity<IdentityUser, IdentityRole>(
        // options => options.SignIn.RequireConfirmedAccount = true
    )
    .AddDefaultTokenProviders()
    .AddEntityFrameworkStores<DataContext>();
builder.Services.AddSingleton<IEmailSender, EmailSender>();

builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IDbInitializer, DbInitializer>();

builder.Services.AddRazorPages();
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = $"/Identity/Account/Login";
    options.LogoutPath = $"/Identity/Account/Logout";
    options.AccessDeniedPath = $"/Identity/Account/AccessDenied";
});
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession();

builder.Services.AddScoped<Cart>(sp => SessionCart.GetCart(sp));
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

// WebApplication
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
;
app.UseAuthorization();

app.UseSession();


StripeConfiguration.ApiKey = builder.Configuration.GetSection("Stripe:SecretKey").Get<string>();
SeedDatabase();

// app.MapControllerRoute("brand", "{brand}",
//     new {controller = "Products", action = "Index", page = 1});
//
// app.MapControllerRoute("pagination", "Products/Page{page}",
//     new { controller = "Products", action = "Index" });

app.MapRazorPages();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// app.MapControllers();

var context = app.Services.CreateScope().ServiceProvider
    .GetRequiredService<DataContext>();

// SeedData.SeedDatabase(context);

app.Run();


void SeedDatabase()
{
    using var scope = app.Services.CreateScope();
    var dbInitializer = scope.ServiceProvider.GetRequiredService<IDbInitializer>();
    dbInitializer.Initialize();
}