using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PlakalaWeb.DataAccessLayer;
using PlakalaWeb.Models;

namespace PlakalaWeb.Controllers.Api
{
    [Produces("application/json")]
    [Route("api/AYorum")]
    public class AYorumController : Controller
    {

        /* Butun Yorumların Listesi    : www.plakala.berkekurnaz.com/api/AYorum */
        /* Berlirli Bir Plaka Ait Yorumlar : www.plakala.berkekurnaz.com/api/AYorum?plaka={plaka} */

        YorumOperations yorumOperations = new YorumOperations();

        /*
        [HttpGet]
        public IEnumerable<Yorum> Get()
        {
            var query = yorumOperations.GetAllItems().OrderByDescending(x => x.Id);
            return query;
        }
        */

        [HttpGet("{id}", Name = "GetList")]
        public IActionResult Get(int id)
        {
            var query = yorumOperations.GetItemById(id);
            if (query == null)
            {
                return NotFound();
            }
            return new ObjectResult(query);
        }

        public IActionResult Get(string plaka)
        {
            var query = yorumOperations.GetAllItems(plaka).Where(x => x.Plaka == plaka);
            if (query == null)
            {
                return NotFound();
            }
            return new ObjectResult(query);
        }

        [HttpPost]
        public void Post(Yorum yorum)
        {
            yorumOperations.AddItem(yorum);
        }

    }
}