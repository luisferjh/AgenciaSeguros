using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace AgenciaSeguro.Entidades
{
    public class Venta
    {
        public int IdVenta { get; set; }
        [Required]
        public int IdCliente { get; set; }
        [Required]
        public int IdAsesorVenta { get; set; }
        [Required]
        public int IdCompañia { get; set; }
        [Required]
        public string NumComprobante { get; set; }
        [Required]
        public DateTime Fecha { get; set; }
        [Required]
        public decimal Total { get; set; }
        [Required]
        public string Estado { get; set; }

        public ICollection<DetalleVenta> Detalles { get; set; }
        public Cliente Cliente { get; set; }
        public AsesorVenta Asesor { get; set; }
        public Compañia Compañia { get; set; }
    }
}
