using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models
{
    public class ActualizarViewModel
    {
        [Required]
        public int IdCategoria { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 10, ErrorMessage = "El nombre no debe de tener más de 50 caracteres, ni menos de 10 caracteres.")]
        public string Nombre { get; set; }
        [StringLength(256)]
        public string Descripcion { get; set; }
    }
}
