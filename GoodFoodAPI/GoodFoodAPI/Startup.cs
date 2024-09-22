using Autofac;
using Autofac.Extensions.DependencyInjection;
using AutoMapper;
using FirebaseAdmin;
using GoodFoodAPI.Configurations;
using GoodFoodAPI.Database;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using GoodFoodAPI.Repositories.Implements;
using GoodFoodAPI.Services;
using GoodFoodAPI.Services.Implements;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

namespace GoodFoodAPI
{
    public class StartUp
    {
        public IConfiguration Configuration { get; }

        public ILifetimeScope AutofacContainer { get; private set; }

        public StartUp(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddSingleton(FirebaseApp.Create());

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Configuration["Jwt:Issuer"],
                    ValidAudience = Configuration["Jwt:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]!))
                };
            });

            services.AddAuthorization();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "GoodFoodAPI", Version = "v1" });
            });

            services.AddDbContext<GoodFoodContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("GoodFoodConnection"));
            });

            services.AddCors(options =>
            {
                options.AddPolicy(name: "_AllowSpecificOrigins", builder =>
                {
                    builder.WithOrigins("http://localhost:4200")
                    .AllowAnyMethod()
                    .AllowAnyHeader();
                });
            });
        }

        public void ConfigureContainer(ContainerBuilder builder)
        {
            // Services Register
            builder.RegisterType<ThongBaoService>()
                   .As<IThongBaoService>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<BaiVietService>()
                   .As<IBaiVietService>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<MonAnService>()
                   .As<IMonAnService>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<BinhLuanService>()
                   .As<IBinhLuanService>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<TheLoaiService>()
                   .As<ITheLoaiService>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<ImageHelper>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<QuanAnService>()
                   .As<IQuanAnService>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<NguoiDungService>()
                   .As<INguoiDungService>()
                   .InstancePerLifetimeScope();

            // Repositories 
            builder.RegisterType<MonAnRepository>()
                   .As<IMonAnRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<ConversationRepository>()
                   .As<IConversationRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<ChatRepository>()
                   .As<IChatRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<DeviceTokenRepository>()
                   .As<IDeviceTokenRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<ThongBaoRepository>()
                   .As<IThongBaoRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<DanhSachYeuThichRepository>()
                   .As<IDanhSachYeuThichRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<DuLieuDeXuatRepository>()
                   .As<IDuLieuDeXuatRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<BaiVietRepository>()
                   .As<IBaiVietRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<TheLoaiRepository>()
                   .As<ITheLoaiRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<HinhAnhRepository>()
                   .As<IHinhAnhRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<NguoiDungRepository>()
                   .As<INguoiDungRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<BinhLuanRepository>()
                   .As<IBinhLuanRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<QuanAnRepository>()
                   .As<IQuanAnRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterType<DiaChiRepository>()
                   .As<IDiaChiRepository>()
                   .InstancePerLifetimeScope();

            builder.RegisterInstance(MapperFactory.GetMapper())
                   .As<IMapper>()
                   .SingleInstance();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            this.AutofacContainer = app.ApplicationServices.GetAutofacRoot();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "GoodFoodAPI v1");
                });
            }

            app.UseCors(x =>
            {
                x.AllowAnyOrigin()
                .AllowAnyHeader()
                .AllowAnyMethod();
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
