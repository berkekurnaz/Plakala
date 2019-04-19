using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.Models
{
    public class Kullanici
    {
        public int Id { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }

        public Kullanici()
        {

        }

        public Kullanici(string kullaniciAdi, string sifre)
        {
            this.KullaniciAdi = kullaniciAdi;
            this.Sifre = sifre;
        }

    }
}
