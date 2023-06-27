using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Lab9_EF.Unit_of_Work
{
    public class ClientRepository
    {
        private FitnessContext db;

        public ClientRepository(FitnessContext context)
        {
            this.db = context;
        }

        public bool AddClient(Client clients)
        {
            try
            {
                db.Clients.Add(clients);
                db.SaveChanges();
                return true;
            }
            catch
            {

                return false;
            }
            
        }
        public Client FindById(int id)
        {
            return db.Clients.SingleOrDefault(o=>o.Id == id);
        }
        public Client FindByName(string name)
        {
            return db.Clients.SingleOrDefault(c=>c.Name == name);
        }
    }
}
