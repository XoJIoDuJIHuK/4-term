using Lab8_SQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab9_EF.Unit_of_Work
{
    public class UnitOfWork : IDisposable
    {
        private FC db = new FC();
        private ClientRepository clientRepository;
        private PlanRepository planRepository;

        public ClientRepository Clients
        {
            get
            {
                if (clientRepository == null)
                    clientRepository = new ClientRepository(db);
                return clientRepository;
            }
        }

        public PlanRepository Orders
        {
            get
            {
                if (planRepository == null)
                    planRepository = new PlanRepository(db);
                return planRepository;
            }
        }

        public void Save()
        {
            db.SaveChanges();
        }

        private bool disposed = false;

        public virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    db.Dispose();
                }
                this.disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
