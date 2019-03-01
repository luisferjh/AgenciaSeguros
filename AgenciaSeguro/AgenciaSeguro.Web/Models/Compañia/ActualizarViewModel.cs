using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Compañia
{
    public class ActualizarViewModel
    {
        public int IdCompañia { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "El nombre no debe de tener más de 100 caracteres, ni menos de 55 caracteres.")]
        public string Nombre { get; set; }
        [Required]
        public string Descripcion { get; set; }
    }
}
