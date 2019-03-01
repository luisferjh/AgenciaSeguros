using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace AgenciaSeguro.Entidades
{
    public class DetalleVenta
    {
        public int IdDetalleVenta { get; set; }
        [Required]
        public int IdVenta { get; set; }
        [Required]
        public int IdProducto { get; set; }  
        [Required]
        public decimal Precio { get; set; }
        [Required]
        public decimal Descuento { get; set; }

        public Venta Venta { get; set; }
        public Producto Producto { get; set; }

    }
}
