package company;

import main.Main;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
import staff.Director;
import staff.Skills;
import staff.engineers.Engineer;
import staff.engineers.SysAdmin;
import staff.engineers.developers.Junior;
import staff.engineers.developers.Middle;
import staff.engineers.developers.Senior;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Company {
    static {
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }
    private static final Logger LOG = Logger.getLogger(Company.class);
    public List<Engineer> engineers;
    public List<Engineer> getEngineers() { return engineers; }
    public Director director;
    public void PrintEngineers()
    {
        for (Engineer engineer : engineers) {
            System.out.println(engineer);
        }
    }
    public void PrintSerializableStuff()
    {
        for (Engineer e : engineers)
        {
            System.out.println(e.skill.toString() + " " + e.salary);
        }
    }
    public void Add(Engineer j) {
        engineers.add(j);
    }
    public Company(int amount)
    {
        engineers = new ArrayList<>();
        director = new Director(this);
    }
    public Company()
    {
        engineers = new ArrayList<>();
        director = new Director(this);
        Random random = new Random();
        int amountOfJuniors = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfJuniors; i++)
        {
            engineers.add(new Junior(Skills.values()[random.nextInt(7)].toString(), random.nextInt(200) + 100));
            LOG.info("Added junior");
        }
        int amountOfMiddles = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfMiddles; i++)
        {
            engineers.add(new Middle(Skills.values()[random.nextInt(7)].toString(), random.nextInt(500) + 800));
            LOG.info("Added middle");
        }
        int amountOfSeniors = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfSeniors; i++)
        {
            engineers.add(new Senior(Skills.values()[random.nextInt(7)].toString(), random.nextInt(2000) + 3000));
            LOG.info("Added senior");
        }
        int amountOfSysAdmins = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfSysAdmins; i++)
        {
            engineers.add(new SysAdmin(Skills.values()[random.nextInt(7)].toString(), random.nextInt(50) + 500));
            LOG.info("Added sysadmin");
        }
    }
}
