using Lab9_EF.Repository;
using Lab9_EF.Unit_of_Work;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Cache;
using System.Runtime.Remoting.Contexts;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Lab9_EF
{
    internal class Program
    {
        //Lab_9

        //static void Main(string[] args)
        //{
        //    using (FitnessContext db = new FitnessContext())
        //    {
        //        try
        //        {
        //            //Lab9.CreateModels();

        //            //Lab9.C("Oleg", 30,2);
        //            //Lab9.R();
        //            //Lab9.U(8); 
        //            Lab9.D(6);

        //            //Lab9.Sort(true);

        //            //Lab9.Search("Nikita", 20);
        //            //Lab9.Transact();
        //        }
        //        catch (Exception e)
        //        {
        //            Console.WriteLine(e);
        //        }

        //        Console.WriteLine("ok!");
        //        Console.ReadKey();

        //        //// вывод 
        //        //foreach (Client pl in db.Clients.Include(p => p.Plan))
        //        //    Console.WriteLine("{0} - {1}", pl.Name, pl.Plan != null ? pl.Plan.Name : "");
        //        //Console.WriteLine();
        //        //foreach (Plan t in db.  Plans.Include(t => t.Players))
        //        //{
        //        //    Console.WriteLine("Команда: {0}", t.Name);
        //        //    foreach (Client pl in t.Clients)
        //        //    {
        //        //        Console.WriteLine("{0} - {1}", pl.Name, pl.Age);
        //        //    }
        //        //    Console.WriteLine();
        //        //}
        //    }

        //}

        private static UnitOfWork context;

        //Lab_10
        static void Main(string[] args)
        {
            //#region Repository
            //EFGenericRepository<Client> clientRepo = new EFGenericRepository<Client>(new FitnessContext());

            //IEnumerable<Client> clients = clientRepo.GetWithInclude(p => p.Plan);
            ////IEnumerable<Client> clients = clientRepo.GetWithInclude(x => x.Plan.Name.StartsWith("S"), p => p.Company);
            //foreach (Client p in clients)
            //{
            //    Console.WriteLine($"{p.Name} ({p.Plan.Name}) - {p.Age}");
            //}
            //#endregion

            #region  Proper Unit of Work
            context = new UnitOfWork();

            //Client cl = new Client { Name = "qoyuiewhsfhbdvn", Age = 19, PlanId = 1 };
            //context.Clients.AddClient(cl);
            //var temp = context.Clients.FindById(cl.Id);
            //Console.WriteLine($"First: {temp.Id}");

            //return;


            using (FitnessContext db = new FitnessContext())
            {
                var cl1 = new Client { Name = "hbgvfc", Age = 18, PlanId = 2 };
                db.Clients.Add(cl1);

                var temp1 = context.Clients.FindByName(cl1.Name);
                Console.WriteLine($"Second: {temp1.Id}");
                db.SaveChanges();
            }

            #endregion

            Console.ReadLine();
        }
    }
}
