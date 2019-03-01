using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace AgenciaSeguro.Web.Models.Venta
{
    public class DetalleViewModel
    {
        [Required]
        public int IdProducto { get; set; }
        public string Producto { get; set; }
        [Required]
        public decimal Precio { get; set; }
        [Required]
        public decimal Descuento { get; set; }
    }
}
