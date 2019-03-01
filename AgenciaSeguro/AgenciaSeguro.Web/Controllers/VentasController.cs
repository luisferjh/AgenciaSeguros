using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AgenciaSeguro.Datos;
using AgenciaSeguro.Entidades;
using AgenciaSeguro.Web.Models.Venta;

namespace AgenciaSeguro.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VentasController : ControllerBase
    {
        private readonly DbContextAgenciaSeguro _context;

        public VentasController(DbContextAgenciaSeguro context)
        {
            _context = context;
        }

        // GET: api/Ventas/Listar
        [HttpGet("[action]")]
        public async Task<IEnumerable<VentaViewModel>> Listar()
        {
            var venta = await _context.Ventas
                .Include(c => c.Cliente)
                .Include(a => a.Asesor)
                .Include(c => c.Compañia)
                .OrderByDescending(v => v.IdVenta)
                .ToListAsync();

            return venta.Select(v => new VentaViewModel
            {
                IdVenta = v.IdVenta,
                IdCliente = v.IdCliente,
                Cliente = v.Cliente.Nombre,            
                IdAsesorVenta = v.IdAsesorVenta,
                AsesorVenta = v.Asesor.Nombres + " " + v.Asesor.Apellidos,
                IdCompañia = v.IdCompañia,
                Compañia = v.Compañia.Nombre,
                NumComprobante = v.NumComprobante,
                Fecha = v.Fecha,
                Total = v.Total,
                Estado = v.Estado               
            });
        }


        // GET: api/Ventas/ListarFiltro/texto
        [HttpGet("[action]/{texto}")]
        public async Task<IEnumerable<VentaViewModel>> ListarFiltro([FromRoute] string texto)
        {
            var venta = await _context.Ventas
                .Where(v => v.NumComprobante.Contains(texto))
                .OrderByDescending(v => v.IdVenta)
                .ToListAsync();

            return venta.Select(v => new VentaViewModel
            {
                IdVenta = v.IdVenta,
                IdCliente = v.IdCliente,
                IdAsesorVenta = v.IdAsesorVenta,
                IdCompañia = v.IdCompañia,
                NumComprobante = v.NumComprobante,
                Fecha = v.Fecha,
                Total = v.Total,
                Estado = v.Estado
            });
        }

        // GET: api/Ventas/ListarDetalles
        [HttpGet("[action]/{IdVenta}")]
        public async Task<IEnumerable<DetalleViewModel>> ListarDetalles([FromRoute] int IdVenta)
        {
            var detalle = await _context.DetallesVentas
               .Include(p => p.Producto)
               .Where(d => d.IdVenta == IdVenta)               
               .ToListAsync();

            return detalle.Select(v => new DetalleViewModel
            {
                IdProducto = v.IdProducto,
                Producto = v.Producto.Nombre,
                Precio = v.Precio,
                Descuento = v.Descuento,
                
            });
        }

        // POST: api/Ventas/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var fechaHora = DateTime.Now;

            Venta venta = new Venta
            {
                IdVenta = model.IdVenta,
                IdCliente = model.IdCliente,
                IdAsesorVenta = model.IdAsesorVenta,
                IdCompañia = model.IdCompañia,
                NumComprobante = model.NumComprobante,
                Fecha = fechaHora,
                Total = model.Total,
                Estado = "Aceptado"
            };

           
            try
            {
                _context.Ventas.Add(venta);
                await _context.SaveChangesAsync();

                var id = venta.IdVenta;
                foreach (var det in model.Detalles)
                {
                    DetalleVenta detalle = new DetalleVenta
                    {
                        IdVenta = id,
                        IdProducto = det.IdProducto,
                        Precio = det.Precio,
                        Descuento = det.Descuento
                    };
                    _context.DetallesVentas.Add(detalle);
                }
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                return BadRequest();

            }

            return Ok();
        }

        private bool VentaExists(int id)
        {
            return _context.Ventas.Any(e => e.IdVenta == id);
        }
    }
}