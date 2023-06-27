using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Lab9_EF
{
    public static class Lab9
    {
        public static void CreateModels()
        {
            using (FitnessContext db = new FitnessContext())
            {
                // создание и добавление моделей
                Plan p1 = new Plan { Name = "PowerLifting" };
                Plan p2 = new Plan { Name = "BodyBuilding" };
                db.Plans.Add(p1);
                db.Plans.Add(p2);
                db.SaveChanges();
                Client cl1 = new Client { Name = "Danila", Age = 19, Plan = p1 };
                Client cl2 = new Client { Name = "Nikita", Age = 20, Plan = p2 };
                Client cl3 = new Client { Name = "Artyom", Age = 21, Plan = p2 };
                db.Clients.AddRange(new List<Client> { cl1, cl2, cl3 });
                db.SaveChanges();
            }
        }

        public static void PrintInfo() 
        {
            using(FitnessContext db = new FitnessContext())
            {
               
                var plans = db.Plans.ToList();
                foreach (var plan in plans)
                {
                    Console.WriteLine(plan.Name);

                    foreach (var client in plan.Clients)
                    {
                        Console.WriteLine(client.Name + " " + client.Age);
                    }

                    Console.WriteLine();
                }
            }
        }

        //public static void C(string name, int age)
        //{
        //    using (FitnessContext db = new FitnessContext())
        //    {
        //        Client cl = new Client { Name = name, Age = age };
        //        db.Clients.Add(cl);
        //        db.SaveChanges();
        //    }
        //}
        public static void C(string name, int age,int planId )
        {
            using (FitnessContext db = new FitnessContext())
            {
                Client cl = new Client { Name = name, Age = age, PlanId=planId };
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
            using (FitnessContext db = new FitnessContext())
            {
                Client cl = db.Clients.Find(id);

                if(cl != null)
                {
                    cl.PlanId = 1;

                    
                    db.SaveChanges();
                } 
            }
        }

        public static void D(int id)
        {
            using (FitnessContext db = new FitnessContext())
            {
                Client cl = db.Clients.FindAsync(id).Result;

                if (cl != null)
                {
                    db.Clients.Remove(cl);

                    db.SaveChanges();
                }
            }
        }

        public static void Sort(bool age = false)
        {
            using (FitnessContext db = new FitnessContext())
            {
                //если false то только по имени
                if (age == false)
                {
                    var clients = db.Clients.OrderBy(x => x.Name);

                    foreach(var client in clients)
                        Console.WriteLine("{0} {1}", client.Name, client.Age);
                }
                //если true то еще и по возрасту
                else
                {
                    var clients = db.Clients.OrderBy(x => x.Name).ThenBy(x=>x.Age);

                    foreach (var client in clients)
                        Console.WriteLine("{0} {1}", client.Name, client.Age);
                }

                db.SaveChangesAsync();
            }
        }

        public static void Search(string name, int age = 0)
        {
            using (FitnessContext db = new FitnessContext())
            {
                if (age == 0)
                {
                    var clients = db.Clients.Where(x => x.Name == name);

                    foreach (var client in clients)
                        Console.WriteLine("{0} {1}", client.Name, client.Age);
                }
                else
                {
                    var clients = db.Clients.Where(x => x.Name == name).Where(x => x.Age == age);

                    foreach (var client in clients)
                        Console.WriteLine("Id:{0} {1} {2}", client.Id, client.Name, client.Age);
                }

                db.SaveChangesAsync();
            }
        }

        public static void Transact()
        {
            using (FitnessContext db = new FitnessContext())
            {
                db.Database.Log = Console.Write;

                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Database.ExecuteSqlCommand(@"UPDATE Clients SET Name = 'Oleg' WHERE Name = 'Nikita'");
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                    }
                }
            }
        }
    }
}
