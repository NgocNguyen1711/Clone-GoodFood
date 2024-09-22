using GoodFoodAPI.Domains.Entities;
using Nest;

namespace GoodFoodAPI.Helpers
{
    public static class ElasticSearchExtensions
    {
        public static void AddElasticSearch(this IServiceCollection services, IConfiguration configuration)
        {
            var url = configuration["ELKConfiguration:url"];
            ConnectionSettings settings = new ConnectionSettings(new Uri(url)).PrettyJson();

            AddDefaultMappings(settings);

            var client = new ElasticClient(settings);

            services.AddSingleton<IElasticClient>(client);

            CreateIndex(client);
        }

        private static void AddDefaultMappings(ConnectionSettings settings)
        {
            settings
                .DefaultMappingFor<NguoiDung>(m => m
                    .Ignore(p => p.TenDangNhap)
                    .Ignore(p => p.MatKhau)
                    .Ignore(p => p.Salt)
                    .Ignore(p => p.BaiViets)
                    .Ignore(p => p.BinhLuans)
                    .Ignore(p => p.CuocTroChuyenIdNguoiDung1Navigations)
                    .Ignore(p => p.CuocTroChuyenIdNguoiDung2Navigations)
                    .Ignore(p => p.DanhSachYeuThiches)
                    .Ignore(p => p.DuLieuDeXuats)
                    .Ignore(p => p.IdHinhAnhNavigation)
                    .Ignore(p => p.QuanAns)
                    .Ignore(p => p.ThongBaos)
                    .Ignore(p => p.IdBaiVietsLike)
                    .Ignore(p => p.IdNguoiDungDuocTheoDois)
                    .Ignore(p => p.IdNguoiDungTheoDois)
                );
            settings
                .DefaultMappingFor<BaiViet>(m => m
                    .Ignore(p => p.BaiVietCoMonAns)
                    .Ignore(p => p.BaoCaos)
                    .Ignore(p => p.BinhLuans)
                    .Ignore(p => p.IdHinhAnhQuanAnNavigation)
                    .Ignore(p => p.IdNguoiDungNavigation)
                    .Ignore(p => p.IdQuanAnNavigation)
                    .Ignore(p => p.IdDanhSaches)
                    .Ignore(p => p.IdNguoiDungsLike)
                );
            settings
                .DefaultMappingFor<QuanAn>(m => m
                    .Ignore(p => p.BaiViets)
                    .Ignore(p => p.IdDiaChiNavigation)
                    .Ignore(p => p.IdHinhAnhNavigation)
                    .Ignore(p => p.IdNguoiSoHuuNavigation)
                    .Ignore(p => p.MonAns)
                    .Ignore(p => p.IdDanhSaches)
                    .Ignore(p => p.IdTheLoais)
                );
            settings
                .DefaultMappingFor<MonAn>(m => m
                    .Ignore(p => p.BaiVietCoMonAns)
                    .Ignore(p => p.IdHinhAnhNavigation)
                    .Ignore(p => p.IdQuanAnNavigation)
                );
        }

        private static void CreateIndex(ElasticClient client)
        {
            client.Indices.Create("user", index => index.Map<NguoiDung>(x => x.AutoMap()));
            client.Indices.Create("post", index => index.Map<BaiViet>(x => x.AutoMap()));
            client.Indices.Create("dish", index => index.Map<MonAn>(x => x.AutoMap()));
            client.Indices.Create("restaurant", index => index.Map<QuanAn>(x => x.AutoMap()));
        }
    }
}
