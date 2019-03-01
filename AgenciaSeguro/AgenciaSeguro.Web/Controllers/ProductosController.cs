using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AgenciaSeguro.Datos;
using AgenciaSeguro.Entidades;
using AgenciaSeguro.Web.Models.Producto;

namespace AgenciaSeguro.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        private readonly DbContextAgenciaSeguro _context;

        public ProductosController(DbContextAgenciaSeguro context)
        {
            _context = context;
        }

        // GET: api/Productos/Listar
        [HttpGet("[action]")]
        public async Task<IEnumerable<ProductoViewModel>> Listar()
        {
            var producto = await _context.Productos.Include(a => a.Categoria).ToListAsync();
            return producto.Select(p => new ProductoViewModel
            {
                IdProducto = p.IdProducto,
                IdCategoria = p.IdCategoria,
                Categoria = p.Categoria.Nombre,
                Nombre = p.Nombre,                
                Descripcion = p.Descripcion,
                Cobertura = p.Cobertura,
                Exclusion = p.Exclusion,
                DocExpedicion = p.DocExpedicion,                
                PrecioVenta = p.PrecioVenta
            });
        }

        // GET: api/Productos/Mostrar/5
        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> Mostrar([FromRoute] int id)
        {
            var producto = await _context.Productos.Include(p => p.Categoria)
                .SingleOrDefaultAsync(p => p.IdProducto == id);

            if (producto == null)
            {
                return NotFound();
            }

            return Ok(new ProductoViewModel
            {
                IdProducto = producto.IdProducto,
                IdCategoria = producto.IdCategoria,
                Categoria = producto.Categoria.Nombre,
                Nombre = producto.Nombre,
                Descripcion = producto.Descripcion,
                Cobertura = producto.Cobertura,
                Exclusion = producto.Exclusion,
                DocExpedicion = producto.DocExpedicion,
                PrecioVenta = producto.PrecioVenta
            });
        }

        // PUT: api/Productos/Actualizar/
        [HttpPut("[action]")]
        public async Task<IActionResult> Actualizar([FromBody] ActualizarViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (model.IdProducto < 0)
            {
                return BadRequest();
            }

            var producto = await _context.Productos.FirstOrDefaultAsync(p => p.IdProducto == model.IdProducto);

            if (producto == null)
            {
                return NotFound();
            }

            producto.Nombre = model.Nombre;
            producto.Descripcion = model.Descripcion;
            producto.Cobertura = model.Cobertura;
            producto.Exclusion = model.Exclusion;
            producto.DocExpedicion = model.DocExpedicion;
            producto.PrecioVenta = model.PrecioVenta;

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

        // POST: api/Productos/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            Producto producto = new Producto
            {
                IdCategoria = model.IdCategoria,
                Nombre = model.Nombre,
                Descripcion = model.Descripcion,               
                Cobertura = model.Cobertura,
                Exclusion = model.Exclusion,
                DocExpedicion = model.DocExpedicion,
                PrecioVenta = model.PrecioVenta
        };

            _context.Productos.Add(producto);
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

        private bool ProductoExists(int id)
        {
            return _context.Productos.Any(e => e.IdCategoria == id);
        }
    }
}