using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Venta
{
    public class CrearViewModel
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
        public decimal Total { get; set; }
        [Required]
        public string Estado { get; set; }
        //Propieades detalle
        [Required]
        public List<DetalleViewModel> Detalles { get; set; }
      
    }
}
