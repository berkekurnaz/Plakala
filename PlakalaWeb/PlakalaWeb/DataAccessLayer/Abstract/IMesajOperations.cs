using PlakalaWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlakalaWeb.DataAccessLayer.Abstract
{
    public interface IMesajOperations
    {
        List<Mesaj> GetAllItems();
        Mesaj GetItemById(int id);
        void AddItem(Mesaj entity);
        void UpdateItem(Mesaj entity);
        void DeleteItem(int id);
    }
}
