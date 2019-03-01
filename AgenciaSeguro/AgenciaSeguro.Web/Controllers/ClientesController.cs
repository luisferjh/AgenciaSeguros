using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AgenciaSeguro.Datos;
using AgenciaSeguro.Entidades;
using AgenciaSeguro.Web.Models.Cliente;


namespace AgenciaSeguro.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private readonly DbContextAgenciaSeguro _context;

        public ClientesController(DbContextAgenciaSeguro context)
        {
            _context = context;
        }

        // GET: api/Clientes/Listar
        [HttpGet("[action]")]
        public async Task<IEnumerable<ClienteViewModel>> Listar()
        {
            var cliente = await _context.Clientes.ToListAsync();
            return cliente.Select(c => new ClienteViewModel
            {
                IdCliente = c.IdCliente,
                TipoCliente = c.TipoCliente,
                Nombre = c.Nombre,
                TipoDocumento = c.TipoDocumento,
                NumDocumento = c.NumDocumento,
                FechaNacimiento = c.FechaNacimiento,
                Direccion = c.Direccion,
                Telefono = c.Telefono,
                Email = c.Email
            });
        }

        // GET: api/Clientes/Select
        [HttpGet("[action]")]
        public async Task<IEnumerable<SelectViewModel>> Select()
        {
            var cliente = await _context.Clientes.ToListAsync();
            return cliente.Select(c => new SelectViewModel
            {
                IdCliente = c.IdCliente,
                Nombre = c.Nombre,
            });
        }

        // POST: api/Clientes/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var email = model.Email.ToLower();

            if (await _context.Clientes.AnyAsync(c => c.Email == email))
            {
                return BadRequest("El email ya existe");
            }

            Cliente cliente = new Cliente
            {
                TipoCliente = model.TipoCliente,
                Nombre = model.Nombre,
                TipoDocumento = model.TipoDocumento,
                NumDocumento = model.NumDocumento,
                FechaNacimiento = model.FechaNacimiento,
                Direccion = model.Direccion,
                Telefono = model.Telefono,
                Email = model.Email
            };

            _context.Clientes.Add(cliente);
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

        // PUT: api/Cliente/Actualizar/
        [HttpPut("[action]")]
        public async Task<IActionResult> Actualizar([FromBody] ActualizarViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (model.IdCliente <=  0)
            {
                return BadRequest();
            }

            var cliente = await _context.Clientes.FirstOrDefaultAsync(c => c.IdCliente == model.IdCliente);

            if (cliente == null)
            {
                return NotFound();
            }

            cliente.TipoCliente = model.TipoCliente;
            cliente.Nombre = model.Nombre;
            cliente.TipoDocumento = model.TipoDocumento;
            cliente.NumDocumento = model.NumDocumento;
            cliente.FechaNacimiento = model.FechaNacimiento;
            cliente.Direccion = model.Direccion;
            cliente.Telefono = model.Telefono;
            cliente.Email = model.Email.ToLower();

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

        private bool ClienteExists(int id)
        {
            return _context.Clientes.Any(e => e.IdCliente == id);
        }
    }
}