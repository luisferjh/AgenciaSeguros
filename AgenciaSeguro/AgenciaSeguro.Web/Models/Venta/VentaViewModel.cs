using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Venta
{
    public class VentaViewModel
    {
        public int IdVenta { get; set; }
        public int IdCliente { get; set; }
        public string Cliente { get; set; }
        public int IdAsesorVenta { get; set; }
        public string AsesorVenta { get; set; }
        public int IdCompañia { get; set; }
        public string Compañia { get; set; }
        public string NumComprobante { get; set; }    
        public DateTime Fecha { get; set; }      
        public decimal Total { get; set; }    
        public string Estado { get; set; }

        
    }
}
