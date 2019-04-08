using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.Models
{
    public class Yorum
    {
        public int Id { get; set; }
        public string PlakaYorum { get; set; }
        public string Resim { get; set; }
        public string EklenmeTarihi { get; set; }
        public int PlakaId { get; set; }
    }
}
