using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Asesor
{
    public class ActualizarViewModel
    {
        public int IdAsesorVenta { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "los nombres no debe de tener más de 100 caracteres, ni menos de 5 caracteres.")]
        public string Nombres { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "los apellidos no debe de tener más de 100 caracteres, ni menos de 5 caracteres.")]
        public string Apellidos { get; set; }
        [Required]
        public string NumDocumento { get; set; }
    }
}
