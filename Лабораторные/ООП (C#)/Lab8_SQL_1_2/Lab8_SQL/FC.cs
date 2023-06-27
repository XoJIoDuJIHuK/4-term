using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Numerics;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace Lab8_SQL
{
    public class FC : DbContext
    {
        public DbSet<Clients> Clients { get; set; }
        public DbSet<Plans> Plans { get; set; }
    }

}
