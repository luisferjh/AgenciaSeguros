using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Cliente
{
    public class ClienteViewModel
    {
        public int IdCliente { get; set; }    
        public string TipoCliente { get; set; }
        public string Nombre { get; set; }      
        public string TipoDocumento { get; set; }      
        public string NumDocumento { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
    }
}
