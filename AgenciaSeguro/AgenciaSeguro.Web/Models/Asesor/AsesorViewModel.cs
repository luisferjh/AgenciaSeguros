using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AgenciaSeguro.Web.Models.Asesor
{
    public class AsesorViewModel
    {
        public int IdAsesorVenta { get; set; }
        public string Nombres { get; set; } 
        public string Apellidos { get; set; }
        public string NumDocumento { get; set; }
    }
}
