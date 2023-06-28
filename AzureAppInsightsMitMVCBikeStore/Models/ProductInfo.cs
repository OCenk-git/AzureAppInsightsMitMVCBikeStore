using System;
using System.Collections.Generic;

namespace AzureAppInsightsMitMVCBikeStore.Models
{
    public partial class ProductInfo
    {
        public string ProductInfoId { get; set; }  
        public string ProductName { get; set; } = null!;
        public string BrandName { get; set; } = null!;
        public decimal ListPrice { get; set; }
    }
}
