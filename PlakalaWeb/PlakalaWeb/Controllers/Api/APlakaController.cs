using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PlakalaWeb.DataAccessLayer;
using PlakalaWeb.Models;

namespace PlakalaWeb.Controllers.Api
{
    [Produces("application/json")]
    [Route("api/APlaka")]
    public class APlakaController : Controller
    {

        /* Butun Plakaların Listesi    : www.plakala.berkekurnaz.com/api/APlaka   */
        /* Berlirli Bir Plaka Getirmek : www.plakala.berkekurnaz.com/api/APlaka/10A001 */

        PlakaOperations plakaOperations = new PlakaOperations();

        [HttpGet]
        public IEnumerable<Plaka> Get()
        {
            var query = plakaOperations.GetAllItems().OrderByDescending(x => x.Id);
            return query;
        }

        [HttpGet("{txt}")]
        public IActionResult Get(string txt)
        {
            var query = plakaOperations.GetItemByName(txt);
            if (query == null)
            {
                return NotFound();
            }
            return new ObjectResult(query);
        }

        [HttpPost]
        public IActionResult Post([FromBody]Plaka newPlaka)
        {
            if (newPlaka == null)
            {
                return BadRequest();
            }
            plakaOperations.AddItem(newPlaka);
            return CreatedAtRoute("GetProduct", new { id = newPlaka.Id }, newPlaka);
        }

    }
}