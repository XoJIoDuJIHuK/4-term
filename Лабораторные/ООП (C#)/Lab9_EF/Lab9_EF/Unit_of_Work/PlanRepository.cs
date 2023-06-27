using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab9_EF.Unit_of_Work
{
    public class PlanRepository
    {
        private FitnessContext db;

        public PlanRepository(FitnessContext context)
        {
            this.db = context;
        }        
    }
}
