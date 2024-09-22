using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class BaoCao
{
    public int Id { get; set; }

    public string LoaiBaoCao { get; set; } = null!;

    public int IdBaiViet { get; set; }

    public virtual BaiViet IdBaiVietNavigation { get; set; } = null!;
}
