using AgenciaSeguro.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace AgenciaSeguro.Datos.Mapping.Ventas
{
    public class VentaMap : IEntityTypeConfiguration<Venta>
    {
        public void Configure(EntityTypeBuilder<Venta> builder)
        {
            builder.ToTable("Venta")
                .HasKey(v => v.IdVenta);
            builder.HasOne(v => v.Cliente)
                .WithMany(c => c.Ventas)
                .HasForeignKey(v => v.IdCliente);
            builder.HasOne(v => v.Asesor)
                .WithMany(a => a.Ventas)
                .HasForeignKey(v => v.IdAsesorVenta);
            builder.HasOne(v => v.Compañia)
                .WithMany(a => a.Ventas)
                .HasForeignKey(v => v.IdCompañia);
        }
    }
}
