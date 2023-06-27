using Lab8_SQL;
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
        private FC db;

        public PlanRepository(FC context)
        {
            this.db = context;
        }        
    }
}
