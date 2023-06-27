using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab8_SQL
{
    public class Plans
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Clients> Clients { get; set; }
    }
}
