using PlakalaWeb.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.Models
{
    public class Mesaj : IEntity
    {
        public int Id { get; set; }
        public string AdSoyad { get; set; }
        public string MailAdresi { get; set; }
        public string Baslik { get; set; }
        public string Icerik { get; set; }
        public string EklenmeTarihi { get; set; }
    }
}
