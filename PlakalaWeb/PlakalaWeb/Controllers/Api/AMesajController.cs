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
    [Route("api/AMesaj")]
    public class AMesajController : Controller
    {

        MesajOperations mesajOperations = new MesajOperations();

        [HttpPost]
        public IActionResult Post([FromBody]Mesaj newMesaj)
        {
            if (newMesaj == null)
            {
                return BadRequest();
            }
            mesajOperations.AddItem(newMesaj);
            return CreatedAtRoute("GetProduct", new { id = newMesaj.Id }, newMesaj);
        }

    }
}