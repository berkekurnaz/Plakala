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
    public class YonetimController : Controller
    {

        YorumOperations yorumOperations = new YorumOperations();
        KullaniciOperations kullaniciOperations = new KullaniciOperations();
        MesajOperations mesajOperations = new MesajOperations();

        [AuthFilter]
        public IActionResult Index()
        {
            ViewBag.YorumSayisi = yorumOperations.GetAllItems().Count;
            ViewBag.KullaniciSayisi = kullaniciOperations.GetAllItems().Count;
            ViewBag.MesajSayisi = mesajOperations.GetAllItems().Count;
            return View();
        }

        public IActionResult Giris()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Giris(Kullanici entity)
        {
            var newEntity = kullaniciOperations.Login(entity);
            if (newEntity != null)
            {
                HttpContext.Session.SetString("SessionUsername", newEntity.KullaniciAdi);
                return RedirectToAction("Index", "Yonetim");
            }
            return View(entity);
        }

        public IActionResult Cikis()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Anasayfa");
        }

    }
}