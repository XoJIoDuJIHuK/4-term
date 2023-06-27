﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Lab8_SQL
{
    public class Clients
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string date_of_birth { get; set; }

        public int? PlanId { get; set; }

        public virtual Plans Plan { get; set; }
    }
}
