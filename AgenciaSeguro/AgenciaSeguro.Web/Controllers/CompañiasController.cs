using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AgenciaSeguro.Datos;
using AgenciaSeguro.Entidades;
using AgenciaSeguro.Web.Models.Compañia;

namespace AgenciaSeguro.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompañiasController : ControllerBase
    {
        private readonly DbContextAgenciaSeguro _context;

        public CompañiasController(DbContextAgenciaSeguro context)
        {
            _context = context;
        }

        // GET: api/Compañias/Listar
        [HttpGet("[action]")]
        public async Task<IEnumerable<CompañiaViewModel>> Listar()
        {
            var compañia = await _context.Compañias.ToListAsync();
            return compañia.Select(c => new CompañiaViewModel
            {
                IdCompañia = c.IdCompañia,
                Nombre = c.Nombre,              
                Descripcion = c.Descripcion 
            });
        }

        // GET: api/Compañias/Select
        [HttpGet("[action]")]
        public async Task<IEnumerable<SelectViewModel>> Select()
        {
            var compañia = await _context.Compañias.ToListAsync();
            return compañia.Select(c => new SelectViewModel
            {
                IdCompañia = c.IdCompañia,
                Nombre = c.Nombre
            });
        }

        // POST: api/Compañias/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            Compañia compañia = new Compañia
            {
                IdCompañia = model.IdCompañia,
                Nombre = model.Nombre,
                Descripcion = model.Descripcion

            };

            _context.Compañias.Add(compañia);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                return BadRequest();

            }

            return Ok();
        }

        // PUT: api/Compañias/Actualizar/
        [HttpPut("[action]")]
        public async Task<IActionResult> Actualizar([FromBody] ActualizarViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (model.IdCompañia <= 0)
            {
                return BadRequest();
            }

            var compañia = await _context.Compañias.FirstOrDefaultAsync(c => c.IdCompañia == model.IdCompañia);

            if (compañia == null)
            {
                return NotFound();
            }

            compañia.IdCompañia = model.IdCompañia;
            compañia.Nombre = model.Nombre;
            compañia.Descripcion = model.Descripcion;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                //Guardar Excepcion
                return BadRequest();
            }

            return Ok();
        }

        private bool CompañiaExists(int id)
        {
            return _context.Compañias.Any(e => e.IdCompañia == id);
        }
    }
}