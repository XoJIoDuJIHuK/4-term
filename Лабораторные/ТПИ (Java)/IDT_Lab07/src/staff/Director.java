package staff;

import company.Company;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
import staff.engineers.Engineer;
import staff.engineers.SysAdmin;
import staff.engineers.developers.Junior;
import staff.engineers.developers.Middle;
import staff.engineers.developers.Senior;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

interface IDirector
{
    public int CountEmployees();
    public List<Engineer> Sort(String property) throws Exception;
    public List<Engineer> PrintEngineersBySkill(Skills skill);
}

public class Director extends Staff implements IDirector {
    static {
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }
    private static final Logger LOG = Logger.getLogger(Director.class);
    public Company company;

    public Director(Company company)
    {
        super();
        this.company = company;
    }

    public int CountEmployees() {
        int amountOfSysAdmins = 0;
        int amountOfJuniors = 0;
        int amountOfMiddles = 0;
        int amountOfSeniors = 0;
        for (int i = 0; i < company.getEngineers().size(); i++)
        {
            if (company.getEngineers().get(i) instanceof Junior) amountOfJuniors++;
            if (company.getEngineers().get(i) instanceof Middle) amountOfMiddles++;
            if (company.getEngineers().get(i) instanceof Senior) amountOfSeniors++;
            if (company.getEngineers().get(i) instanceof SysAdmin) amountOfSysAdmins++;
        }
        System.out.printf("Juniors: %d, Middles: %d, Seniors: %d, System administrators: %d%n",
                amountOfJuniors, amountOfMiddles, amountOfSeniors, amountOfSysAdmins);
        return amountOfJuniors + amountOfSeniors + amountOfMiddles + amountOfSysAdmins;
    }

    public List<Engineer> Sort(String property) throws Exception {
        switch (property)
        {
            case "salary":
            {
                company.getEngineers().sort(new Comparator<Engineer>() {
                    @Override
                    public int compare(Engineer lhs, Engineer rhs) {
                        // -1 - less than, 1 - greater than, 0 - equal, all inversed for descending
                        return -Double.compare(rhs.salary, lhs.salary);
                    }
                });
                company.PrintEngineers();
                return company.getEngineers();
            }
            case "skill":
            {
                System.out.println("not implemented");
            }
            default:
            {
                String error = "unexpected parameter at sort";
                LOG.error(error);
                throw new Exception(error);
            }
        }
    }

    public List<Engineer> PrintEngineersBySkill(Skills skill) {
        List<Engineer> ret = new ArrayList<Engineer>();
        for (Engineer e : company.getEngineers())
        {
            if (e.skill == skill)
            {
                System.out.println(e);
                ret.add(e);
            }
        }
        return ret;
    }
}
