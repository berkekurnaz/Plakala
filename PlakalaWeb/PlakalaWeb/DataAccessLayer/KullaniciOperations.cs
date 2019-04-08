using LiteDB;
using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer
{
    public class KullaniciOperations
    {

        /* Butun Kayitlari Getirmek Icin */
        public List<Kullanici> GetAllItems()
        {
            var list = new List<Kullanici>();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Kullanici>("Kullanicilar");
                foreach (var item in items.FindAll())
                {
                    list.Add(item);
                }
            }
            return list;
        }

        /* Tek Bir Kayit Getirmek Icin */
        public Kullanici GetItemById(int id)
        {
            var result = new Kullanici();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Kullanici>("Kullanicilar");
                result = items.Find(x => x.Id == id).FirstOrDefault();
            }
            return result;
        }

        /* Yeni Bir Kayit Eklemek Icin */
        public void AddItem(Kullanici entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Kullanici>("Kullanicilar");
                items.Insert(entity);
            }
        }

        /* Bir Kayit Guncellemek Icin */
        public void UpdateItem(Kullanici entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Kullanici>("Kullanicilar");
                items.Update(entity);
            }
        }

        /* Bir Kayit Silmek Icin */
        public void DeleteItem(int id)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Kullanici>("Kullanicilar");
                items.Delete(id);
            }
        }

        /* Sisteme Giris Yapmak Icin */
        public Kullanici Login(Kullanici entity)
        {
            var result = new Kullanici();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Kullanici>("Kullanicilar");
                result = items.Find(x => x.KullaniciAdi == entity.KullaniciAdi && x.Sifre == entity.Sifre).FirstOrDefault();
            }
            return result;
        }

    }
}
