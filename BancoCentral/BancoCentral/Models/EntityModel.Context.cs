﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BancoCentral.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BancoCentralEntities1 : DbContext
    {
        public BancoCentralEntities1()
            : base("name=BancoCentralEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Auditoria> Auditoria { get; set; }
        public virtual DbSet<Canton> Canton { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<ClienteIndicador> ClienteIndicador { get; set; }
        public virtual DbSet<Distrito> Distrito { get; set; }
        public virtual DbSet<Indicador> Indicador { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
    }
}
