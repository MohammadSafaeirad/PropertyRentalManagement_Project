//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FinalProject_PropertyManagement.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        public int MessageID { get; set; }
        public Nullable<int> ManagerID { get; set; }
        public Nullable<int> TenantID { get; set; }
        public string MessageBody { get; set; }
        public Nullable<System.DateTime> DateSent { get; set; }
        public string Sender { get; set; }
    
        public virtual PropertyManager PropertyManager { get; set; }
        public virtual Tenant Tenant { get; set; }
    }
}
