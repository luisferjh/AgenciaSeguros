using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AgenciaSeguro.Datos;
using AgenciaSeguro.Entidades;
using AgenciaSeguro.Web.Models.Asesor;

namespace AgenciaSeguro.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AsesorVentasController : ControllerBase
    {
        private readonly DbContextAgenciaSeguro _context;

        public AsesorVentasController(DbContextAgenciaSeguro context)
        {
            _context = context;
        }


        // GET: api/AsesorVentas/Listar
        [HttpGet("[action]")]
        public async Task<IEnumerable<AsesorViewModel>> Listar()
        {
            var asesor = await _context.Asesores.ToListAsync();
            return asesor.Select(a => new AsesorViewModel
            {
                IdAsesorVenta = a.IdAsesorVenta,             
                Nombres = a.Nombres,   
                Apellidos = a.Apellidos,
                NumDocumento = a.NumDocumento                          
            });
        }

        // GET: api/AsesorVentas/Select
        [HttpGet("[action]")]
        public async Task<IEnumerable<SelectViewModel>> Select()
        {
            var asesor = await _context.Asesores.ToListAsync();
            return asesor.Select(a => new SelectViewModel
            {
                IdAsesorVenta = a.IdAsesorVenta,
                Nombres = a.Nombres
                //Apellidos = a.Apellidos
            });
        }

        // POST: api/AsesorVentas/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
           

            AsesorVenta asesor = new AsesorVenta
            {
                Nombres = model.Nombres,
                Apellidos = model.Apellidos,
                NumDocumento = model.NumDocumento

            };

            _context.Asesores.Add(asesor);
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
        
        // PUT: api/AsesorVentas/Actualizar/
        [HttpPut("[action]")]
        public async Task<IActionResult> Actualizar([FromBody] ActualizarViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (model.IdAsesorVenta <= 0)
            {
                return BadRequest();
            }

            var asesor = await _context.Asesores.FirstOrDefaultAsync(a => a.IdAsesorVenta == model.IdAsesorVenta);

            if (asesor == null)
            {
                return NotFound();
            }
            asesor.Nombres = model.Nombres;
            asesor.Apellidos = model.Apellidos;
            asesor.NumDocumento = model.NumDocumento;

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

        private bool AsesorVentaExists(int id)
        {
            return _context.Asesores.Any(e => e.IdAsesorVenta == id);
        }
    }
}