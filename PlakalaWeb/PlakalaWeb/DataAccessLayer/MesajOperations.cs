using LiteDB;
using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer
{
    public class MesajOperations
    {

        /* Butun Kayitlari Getirmek Icin */
        public List<Mesaj> GetAllItems()
        {
            var list = new List<Mesaj>();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Mesaj>("Mesajlar");
                foreach (var item in items.FindAll())
                {
                    list.Add(item);
                }
            }
            return list;
        }

        /* Tek Bir Kayit Getirmek Icin */
        public Mesaj GetItemById(int id)
        {
            var result = new Mesaj();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Mesaj>("Mesajlar");
                result = items.Find(x => x.Id == id).FirstOrDefault();
            }
            return result;
        }

        /* Yeni Bir Kayit Eklemek Icin */
        public void AddItem(Mesaj entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Mesaj>("Mesajlar");
                items.Insert(entity);
            }
        }

        /* Bir Kayit Guncellemek Icin */
        public void UpdateItem(Mesaj entity)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Mesaj>("Mesajlar");
                items.Update(entity);
            }
        }

        /* Bir Kayit Silmek Icin */
        public void DeleteItem(int id)
        {
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Mesaj>("Mesajlar");
                items.Delete(id);
            }
        }

    }
}
