package staff;

import company.Company;
import staff.engineers.Engineer;
import staff.engineers.SysAdmin;
import staff.engineers.developers.Junior;
import staff.engineers.developers.Middle;
import staff.engineers.developers.Senior;
import java.util.Comparator;

interface IDirector
{
    public void CountEmployees();
    public void Sort(String property) throws Exception;
    public void PrintEngineersBySkill(Skills skill);
}

public class Director extends Staff implements IDirector {
    public Company company;

    public Director(Company company)
    {
        this.company = company;
    }

    public void CountEmployees()
    {
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
    }

    public void Sort(String property) throws Exception {
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
                break;
            }
            case "skill":
            {
                System.out.println("not implemented");
            }
            default:
            {
                String error = "unexpected parameter at sort";
                throw new Exception(error);
            }
        }
        company.PrintEngineers();
    }

    public void PrintEngineersBySkill(Skills skill)
    {
        for (Engineer e : company.getEngineers())
        {
            if (e.skill == skill) System.out.println(e);
        }
    }
}
