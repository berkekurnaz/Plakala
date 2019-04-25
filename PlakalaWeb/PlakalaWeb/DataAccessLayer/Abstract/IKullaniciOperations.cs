using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer.Abstract
{
    public interface IKullaniciOperations
    {
        List<Kullanici> GetAllItems();
        Kullanici GetItemById(int id);
        void AddItem(Kullanici entity);
        void UpdateItem(Kullanici entity);
        void DeleteItem(int id);
        Kullanici Login(Kullanici entity);
    }
}
