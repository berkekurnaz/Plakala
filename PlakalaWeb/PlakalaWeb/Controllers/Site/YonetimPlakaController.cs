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
    public class YonetimPlakaController : Controller
    {

        PlakaOperations plakaOperations = new PlakaOperations();

        public IActionResult Index()
        {
            return View(plakaOperations.GetAllItems());
        }

        public IActionResult Incele(int id)
        {
            var item = plakaOperations.GetItemById(id);
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
        public IActionResult Ekle(Plaka entity)
        {
            if (ModelState.IsValid)
            {
                plakaOperations.AddItem(entity);
                return RedirectToAction("Index");
            }
            return View(entity);
        }

        public IActionResult Guncelle(int id)
        {
            var item = plakaOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Guncelle(int id, Plaka newEntity)
        {
            var entity = plakaOperations.GetItemById(id);

            entity.PlakaAd = newEntity.PlakaAd;
            entity.EklenmeTarihi = newEntity.EklenmeTarihi;
            plakaOperations.UpdateItem(entity);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = plakaOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            plakaOperations.DeleteItem(id);
            return RedirectToAction("Index");
        }

    }
}