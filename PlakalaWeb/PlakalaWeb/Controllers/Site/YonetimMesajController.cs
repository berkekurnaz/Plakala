using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PlakalaWeb.DataAccessLayer;
using PlakalaWeb.Filter;
using PlakalaWeb.Models;

namespace PlakalaWeb.Controllers.Site
{
    [AuthFilter]
    public class YonetimMesajController : Controller
    {

        MesajOperations mesajOperations = new MesajOperations();

        public IActionResult Index()
        {
            return View(mesajOperations.GetAllItems());
        }

        public IActionResult Incele(int id)
        {
            var item = mesajOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        public IActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Ekle(Mesaj entity)
        {
            if (ModelState.IsValid)
            {
                entity.EklenmeTarihi = DateTime.Now.ToShortDateString();
                mesajOperations.AddItem(entity);
                return RedirectToAction("Index");
            }
            return View(entity);
        }

        public IActionResult Guncelle(int id)
        {
            var item = mesajOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Guncelle(int id, Mesaj newEntity)
        {
            var entity = mesajOperations.GetItemById(id);

            entity.AdSoyad = newEntity.AdSoyad;
            entity.MailAdresi = newEntity.MailAdresi;
            entity.Baslik = newEntity.Baslik;
            entity.Icerik = newEntity.Icerik;
            mesajOperations.UpdateItem(entity);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = mesajOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            mesajOperations.DeleteItem(id);
            return RedirectToAction("Index");
        }

    }
}