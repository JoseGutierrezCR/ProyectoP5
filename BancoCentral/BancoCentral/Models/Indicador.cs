//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Indicador
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Indicador()
        {
            this.ClienteIndicador = new HashSet<ClienteIndicador>();
        }
    
        public int idIndicador { get; set; }
        public string indicador1 { get; set; }
        public string grafico { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClienteIndicador> ClienteIndicador { get; set; }
    }
}
