using AgenciaSeguro.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace AgenciaSeguro.Datos.Mapping.Ventas
{
    public class CompañiaMap : IEntityTypeConfiguration<Compañia>
    {
        public void Configure(EntityTypeBuilder<Compañia> builder)
        {
            builder.ToTable("CompañiaAseguradora")
                .HasKey(p => p.IdCompañia);
        }
    }
}
