using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PlakalaWeb.DataAccessLayer;
using PlakalaWeb.Models;

namespace PlakalaWeb.Controllers.Site
{
    public class AnasayfaController : Controller
    {

        MesajOperations mesajOperations = new MesajOperations();

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

    }
}