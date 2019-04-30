using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PlakalaWeb.DataAccessLayer;
using PlakalaWeb.Models;
using ReflectionIT.Mvc.Paging;

namespace PlakalaWeb.Controllers.Site
{
    public class AnasayfaController : Controller
    {

        MesajOperations mesajOperations = new MesajOperations();
        YorumOperations yorumOperations = new YorumOperations();

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(Mesaj mesaj)
        {
            if (ModelState.IsValid)
            {
                mesaj.EklenmeTarihi = DateTime.Now.ToShortDateString();
                mesajOperations.AddItem(mesaj);
                return RedirectToAction("Index");
            }
            return View();
        }

        public IActionResult Plaka()
        {
            return View();
        }

        public IActionResult Listele(string plaka, int sayfa=1)
        {
            var list = yorumOperations.GetAllItems(plaka);
            var model = PagingList.Create(list, 10, sayfa);
            ViewBag.PlakaAdi = plaka;
            ViewBag.PlakaSayisi = list.Count;
            return View(model);
        }

        public IActionResult Yorum(int id)
        {
            var yorum = yorumOperations.GetItemById(id);
            if (yorum == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.YorumPlaka = yorum.Plaka;
            return View(yorum);
        }

    }
}