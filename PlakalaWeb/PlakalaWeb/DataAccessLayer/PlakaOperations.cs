using LiteDB;
using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer
{
    public class PlakaOperations
    {

        /* Butun Kayitlari Getirmek Icin */
        public List<Plaka> GetAllItems()
        {
            var list = new List<Plaka>();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Plaka>("Plakalar");
                foreach (var item in items.FindAll())
                {
                    list.Add(item);
                }
            }
            return list;
        }

        /* Tek Bir Kayit Getirmek Icin */
        public Plaka GetItemById(int id)
        {
            var result = new Plaka();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Plaka>("Plakalar");
                result = items.Find(x => x.Id == id).FirstOrDefault();
            }
            return result;
        }

        /* Tek Bir Kayit Getirmek Icin */
        public Plaka GetItemByName(string txt)
        {
            var result = new Plaka();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Plaka>("Plakalar");
                result = items.Find(x => x.PlakaAd == txt).FirstOrDefault();
            }
            return result;
        }

        /* Yeni Bir Kayit Eklemek Icin */
        public void AddItem(Plaka entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Plaka>("Plakalar");
                items.Insert(entity);
            }
        }

        /* Bir Kayit Guncellemek Icin */
        public void UpdateItem(Plaka entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Plaka>("Plakalar");
                items.Update(entity);
            }
        }

        /* Bir Kayit Silmek Icin */
        public void DeleteItem(int id)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Plaka>("Plakalar");
                items.Delete(id);
            }
        }

    }
}
