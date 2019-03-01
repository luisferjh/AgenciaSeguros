using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace AgenciaSeguro.Entidades
{
    public class Producto
    {
        public int IdProducto { get; set; }
        [Required]
        public int IdCategoria { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 10, ErrorMessage = "El nombre no debe de tener más de 50 caracteres, ni menos de 10 caracteres.")]
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        [Required]
        public string Cobertura { get; set; }
        [Required]
        public string Exclusion { get; set; }
        [Required]
        public string DocExpedicion { get; set; }
        [Required]
        public decimal PrecioVenta { get; set; }


        public Categoria Categoria { get; set; }
        public ICollection<DetalleVenta> Ventas { get; set; }

    }
}
