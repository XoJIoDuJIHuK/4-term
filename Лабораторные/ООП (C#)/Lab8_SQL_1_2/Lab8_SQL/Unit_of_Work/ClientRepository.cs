using Lab8_SQL;
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
        private FC db;

        public ClientRepository(FC context)
        {
            this.db = context;
        }

        public bool AddClient(Clients clients)
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
        public Clients FindById(int id)
        {
            return db.Clients.SingleOrDefault(o=>o.Id == id);
        }
    }
}
