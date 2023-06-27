using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab8_SQL
{
    public static class Lab9
    {
        public static void CreateModels()
        {
            using (FC db = new FC())
            {
                // создание и добавление моделей
                Plans p1 = new Plans { Name = "PowerLifting" };
                Plans p2 = new Plans { Name = "BodyBuilding" };
                db.Plans.Add(p1);
                db.Plans.Add(p2);
                db.SaveChanges();
                //Clients cl1 = new Clients { Name = "Danila", date_of_birth = "19", Plan = p1 };
                //Clients cl2 = new Clients { Name = "Nikita", date_of_birth = "25", Plan = p2 };
                //Clients cl3 = new Clients { Name = "Sanya", date_of_birth = "32", Plan = p2 };
                //db.Clients.AddRange(new List<Clients> { cl1, cl2, cl3 });
                db.SaveChanges();
                db.SaveChanges();
            }
        }

        public static void PrintInfo()
        {
            using (FC db = new FC())
            {
                //хорошо понял пример Eager Loading
                //var clients = db.Clients.Include("Plan").ToList();

                //foreach (Client p in clients)
                //{
                //    Console.WriteLine(p.Plan.Name);
                //}

                //var plans = db.Plans.Include("Clients").ToList();

                var plans = db.Plans.ToList();
                foreach (var plan in plans)
                {
                    Console.WriteLine(plan.Name);

                    foreach (var client in plan.Clients)
                    {
                        Console.WriteLine(client.Name + " " + client.date_of_birth);
                    }

                    Console.WriteLine();
                }
            }
        }

        public static void C(string name, string date_of_birth)
        {
            using (FC db = new FC())
            {
                Clients cl = new Clients { Name = name, date_of_birth = date_of_birth };
                db.Clients.Add(cl);
                db.SaveChanges();
            }
        }

        public static void R()
        {
            PrintInfo();
        }

        public static void U(int id)
        {
            using (FC db = new FC())
            {
                Clients cl = db.Clients.Find(id);

                if (cl != null)
                {
                    cl.PlanId = 6;

                    db.SaveChanges();
                }
            }
        }

        public static void D(int id)
        {
            using (FC db = new FC())
            {
                Clients cl = db.Clients.FindAsync(id).Result;

                if (cl != null)
                {
                    db.Clients.Remove(cl);

                    db.SaveChanges();
                }
            }
        }

        public static void Sort(bool age = false)
        {
            using (FC db = new FC())
            {
                if (age == false)
                {
                    var clients = db.Clients.OrderBy(x => x.Name);

                    foreach (var client in clients)
                        Console.WriteLine("{0} {1}", client.Name, client.date_of_birth);
                }
                else
                {
                    var clients = db.Clients.OrderBy(x => x.Name).ThenBy(x => x.date_of_birth);

                    foreach (var client in clients)
                        Console.WriteLine("{0} {1}", client.Name, client.date_of_birth);
                }

                db.SaveChangesAsync();
            }
        }

        public static void Search(string name, string date_of_birth = "0")
        {
            using (FC db = new FC())
            {
                if (date_of_birth == "0")
                {
                    var clients = db.Clients.Where(x => x.Name == name);

                    foreach (var client in clients)
                        Console.WriteLine("{0} {1}", client.Name, client.date_of_birth);
                }
                else
                {
                    var clients = db.Clients.Where(x => x.Name == name).Where(x => x.date_of_birth == date_of_birth);

                    foreach (var client in clients)
                        Console.WriteLine("Id:{0} {1} {2}", client.Id, client.Name, client.date_of_birth);
                }

                db.SaveChangesAsync();
            }
        }

        //public static void Transact()
        //{
        //    using (FC db = new FC())
        //    {

        //    }
        //}
    }
}
