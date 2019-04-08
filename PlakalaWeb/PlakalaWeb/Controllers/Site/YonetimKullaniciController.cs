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
    public class YonetimKullaniciController : Controller
    {

        KullaniciOperations kullaniciOperations = new KullaniciOperations();

        public IActionResult Index()
        {
            return View(kullaniciOperations.GetAllItems());
        }

        public IActionResult Incele(int id)
        {
            var item = kullaniciOperations.GetItemById(id);
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
        public IActionResult Ekle(Kullanici entity)
        {
            if (ModelState.IsValid)
            {
                kullaniciOperations.AddItem(entity);
                return RedirectToAction("Index");
            }
            return View(entity);
        }

        public IActionResult Guncelle(int id)
        {
            var item = kullaniciOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Guncelle(int id, Kullanici newEntity)
        {
            var entity = kullaniciOperations.GetItemById(id);

            entity.KullaniciAdi = newEntity.KullaniciAdi;
            entity.Sifre = newEntity.Sifre;
            kullaniciOperations.UpdateItem(entity);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = kullaniciOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            kullaniciOperations.DeleteItem(id);
            return RedirectToAction("Index");
        }

    }
}