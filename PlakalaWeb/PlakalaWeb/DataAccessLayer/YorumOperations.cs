using LiteDB;
using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer
{
    public class YorumOperations
    {

        /* Butun Kayitlari Getirmek Icin */
        public List<Yorum> GetAllItems()
        {
            var list = new List<Yorum>();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yorum>("Yorumlar");
                foreach (var item in items.FindAll())
                {
                    list.Add(item);
                }
            }
            return list;
        }

        /* Belirli Bir Plakaya Ait Butun Kayitlari Getirmek Icin */
        public List<Yorum> GetAllItems(string plaka)
        {
            var list = new List<Yorum>();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yorum>("Yorumlar").Find(x => x.Plaka == plaka).ToList();
                foreach (var item in items)
                {
                    list.Add(item);
                }
            }
            return list;
        }

        /* Tek Bir Kayit Getirmek Icin */
        public Yorum GetItemById(int id)
        {
            var result = new Yorum();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yorum>("Yorumlar");
                result = items.Find(x => x.Id == id).FirstOrDefault();
            }
            return result;
        }

        /* Yeni Bir Kayit Eklemek Icin */
        public void AddItem(Yorum entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yorum>("Yorumlar");
                items.Insert(entity);
            }
        }

        /* Bir Kayit Guncellemek Icin */
        public void UpdateItem(Yorum entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yorum>("Yorumlar");
                items.Update(entity);
            }
        }

        /* Bir Kayit Silmek Icin */
        public void DeleteItem(int id)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yorum>("Yorumlar");
                items.Delete(id);
            }
        }

    }
}
