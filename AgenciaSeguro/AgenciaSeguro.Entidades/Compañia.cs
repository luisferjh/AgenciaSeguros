using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace AgenciaSeguro.Entidades
{
    public class Compañia
    {
        public int IdCompañia { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "El nombre no debe de tener más de 100 caracteres, ni menos de 5 caracteres.")]
        public string Nombre { get; set; }
        [Required]
        public string Descripcion { get; set; }

        public ICollection<Venta> Ventas { get; set; }
    }
}
