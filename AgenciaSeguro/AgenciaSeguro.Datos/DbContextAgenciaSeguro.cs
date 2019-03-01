using AgenciaSeguro.Datos.Mapping.Agencia;
using AgenciaSeguro.Datos.Mapping.Ventas;
using AgenciaSeguro.Entidades;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace AgenciaSeguro.Datos
{
    public class DbContextAgenciaSeguro : DbContext
    {
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Producto> Productos { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<AsesorVenta> Asesores { get; set; }
        public DbSet<Compañia> Compañias { get; set; }
        public DbSet<Venta> Ventas { get; set; }
        public DbSet<DetalleVenta> DetallesVentas { get; set; }

        public DbContextAgenciaSeguro(DbContextOptions<DbContextAgenciaSeguro> options)
            : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new CategoriaMap());
            modelBuilder.ApplyConfiguration(new ProductoMap());
            modelBuilder.ApplyConfiguration(new ClienteMap());
            modelBuilder.ApplyConfiguration(new AsesorVentaMap());
            modelBuilder.ApplyConfiguration(new CompañiaMap());
            modelBuilder.ApplyConfiguration(new VentaMap());
            modelBuilder.ApplyConfiguration(new DetalleVentaMap());
        }
    }
}