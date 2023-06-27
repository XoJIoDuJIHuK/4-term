using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab9_EF
{
    public class FitnessContext : DbContext
    {
        //public FitnessContext() : base("FitnessContext") { }
        public DbSet<Client> Clients { get; set; }
        public DbSet<Plan> Plans { get; set; }
    }
}

