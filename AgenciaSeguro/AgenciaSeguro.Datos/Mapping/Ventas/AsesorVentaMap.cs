using AgenciaSeguro.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace AgenciaSeguro.Datos.Mapping.Ventas
{
    public class AsesorVentaMap : IEntityTypeConfiguration<AsesorVenta>
    {
        public void Configure(EntityTypeBuilder<AsesorVenta> builder)
        {
            builder.ToTable("AsesorVENTA")
                .HasKey(p => p.IdAsesorVenta);
        }
    }
}
