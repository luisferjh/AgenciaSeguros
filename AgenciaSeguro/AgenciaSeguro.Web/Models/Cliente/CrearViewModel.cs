using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Cliente
{
    public class CrearViewModel
    {      
        [Required]
        public string TipoCliente { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 15, ErrorMessage = "El nombre no debe de tener más de 100 caracteres, ni menos de 15 caracteres.")]
        public string Nombre { get; set; }
        [Required]
        public string TipoDocumento { get; set; }
        [Required]
        public string NumDocumento { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
    }
}
