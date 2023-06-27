using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oop_04
{
    public enum Actions
    {
        Add,
        Delete,
        EditFlower
    }
    public class MementoAction
    {
        public Actions type;
        public Flower state;
        public Flower? changedObject = null;

        public MementoAction() { }
        public MementoAction(Actions type, Flower state, Flower? changedObject)
        {
            this.type = type;
            this.state = state;
            this.changedObject = changedObject;
        }
    }
}
