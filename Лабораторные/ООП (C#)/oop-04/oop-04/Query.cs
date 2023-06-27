using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oop_04
{
    public class Query
    {
        public enum Mode
        {
            Categories,
            PriceRange,
            Tags
        }
        public string enginePower;
        public string amount;
        public int lowerLimit;
        public int upperLimit;
        public Mode mode;
        public List<string> tags;
        public Query(string enginePower, string amount, int lowerLimit, int upperLimit, 
            Mode mode, List<string> tags)
        {
            this.enginePower = enginePower;
            this.amount = amount;
            this.lowerLimit = lowerLimit;
            this.upperLimit = upperLimit;
            this.mode = mode;
            this.tags = tags;
        }
    }
}
