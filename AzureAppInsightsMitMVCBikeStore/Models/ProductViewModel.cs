using System.ComponentModel;

namespace AzureAppInsightsMitMVCBikeStore.Models
{
    public class ProductViewModel
    {
        public int Id { get; set; }
        public Product Product { get; set; }

        [DisplayName("Kategorie")]
        public Category Category { get; set; }
        [DisplayName("Hersteller")]
        public Brand Brand { get; set; }
        [DisplayName("Lagerbestand")]
        public int TotalQuantity { get; set; }
    }
}
