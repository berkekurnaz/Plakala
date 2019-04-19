using System;
using System.Collections.Generic;
using System.IO;
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
    public class YonetimYorumController : Controller
    {

        YorumOperations yorumOperations = new YorumOperations();

        public IActionResult Index()
        {
            return View(yorumOperations.GetAllItems());
        }

        public IActionResult Incele(int id)
        {
            var item = yorumOperations.GetItemById(id);
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
        public async Task<IActionResult> Ekle(Yorum entity, IFormFile Image)
        {
            var myEntity = new Yorum();

            if (Image != null)
            {
                string newImage = Guid.NewGuid().ToString() + Image.FileName;

                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\img\\plakalar", newImage);

                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await Image.CopyToAsync(stream);
                }

                myEntity.Resim = newImage;
            }
            else
            {
                myEntity.Resim = "bosdeger";
            }

            myEntity.PlakaYorum = entity.PlakaYorum;
            myEntity.Plaka = entity.Plaka;
            myEntity.EklenmeTarihi = DateTime.Now.ToShortDateString();

            yorumOperations.AddItem(myEntity);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = yorumOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            var item = yorumOperations.GetItemById(id);
            if (item == null)
            {
                return RedirectToAction("Index");
            }
            if (item.Resim != "bosdeger")
            {
                if (System.IO.File.Exists(Directory.GetCurrentDirectory() + "\\wwwroot\\img\\plakalar\\" + item.Resim))
                {
                    System.IO.File.Delete(Directory.GetCurrentDirectory() + "\\wwwroot\\img\\plakalar\\" + item.Resim);
                }
            }
            yorumOperations.DeleteItem(id);
            return RedirectToAction("Index");
        }

    }
}