using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer.Abstract
{
    interface IYorumOperations
    {
        List<Yorum> GetAllItems();
        List<Yorum> GetAllItems(string plaka);
        Yorum GetItemById(int id);
        void AddItem(Yorum entity);
        void UpdateItem(Yorum entity);
        void DeleteItem(int id);
    }
}
