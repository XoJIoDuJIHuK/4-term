//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lab9_EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class workout_plans
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public workout_plans()
        {
            this.client_plans = new HashSet<client_plans>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public System.DateTime created_at { get; set; }
        public string author { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<client_plans> client_plans { get; set; }
    }
}
