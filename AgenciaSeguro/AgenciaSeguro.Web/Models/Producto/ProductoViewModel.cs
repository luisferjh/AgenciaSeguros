using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Producto
{
    public class ProductoViewModel
    {
        public int IdProducto { get; set; }     
        public int IdCategoria { get; set; }
        public string Categoria { get; set; }      
        public string Nombre { get; set; }
        public string Descripcion { get; set; }       
        public string Cobertura { get; set; }   
        public string Exclusion { get; set; }      
        public string DocExpedicion { get; set; }
       
        public decimal PrecioVenta { get; set; }
    }
}
