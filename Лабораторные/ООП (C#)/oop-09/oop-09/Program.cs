using Microsoft.EntityFrameworkCore;

class Client
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int Age { get; set; }
    public int PlanId { get; set; }
}

class Plan
{
    public int Id { get; set; }
    public string Name { get; set; }
}

class FitnessDBContext : DbContext
{
    public DbSet<Client> Clients => Set<Client>();
    public DbSet<Plan> Plans => Set<Plan>();
    public FitnessDBContext() => Database.EnsureCreated();

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            //sensitive information lmao
            //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
            optionsBuilder.UseSqlServer("server=XOJIODUJIHUK\\MSQL_SERVER_V1;" +
            "Trusted_Connection=Yes;" +
            "DataBase=fitness_center;" +
            "Encrypt=False");
        }
    }
}

class Program
{
    public static void Main(string[] args)
    {
        try
        {
            using (FitnessDBContext db = new())
            {
                foreach (var c in db.Clients.ToList())
                {
                    Console.WriteLine(c.Name);
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return;

        while (true)
        {
            
        }
    }
}