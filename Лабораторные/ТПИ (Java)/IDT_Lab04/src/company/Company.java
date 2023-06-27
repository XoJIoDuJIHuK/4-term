package company;

import staff.Director;
import staff.engineers.Engineer;
import staff.engineers.SysAdmin;
import staff.engineers.developers.Junior;
import staff.engineers.developers.Middle;
import staff.engineers.developers.Senior;

import staff.Skills;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Company {
    private List<Engineer> engineers;
    public List<Engineer> getEngineers() { return engineers; }
    public Director director;
    public void PrintEngineers()
    {
        for (Engineer engineer : engineers) {
            System.out.println(engineer);
        }
    }
    public Company()
    {

        engineers = new ArrayList<>();
        director = new Director(this);
        Random random = new Random();
        int amountOfJuniors = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfJuniors; i++)
        {
            engineers.add(new Junior(random.nextInt(200) + 100, Skills.values()[random.nextInt(7)]));
        }
        int amountOfMiddles = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfMiddles; i++)
        {
            engineers.add(new Middle(random.nextInt(500) + 800, Skills.values()[random.nextInt(7)]));
        }
        int amountOfSeniors = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfSeniors; i++)
        {
            engineers.add(new Senior(random.nextInt(2000) + 3000, Skills.values()[random.nextInt(7)]));
        }
        int amountOfSysAdmins = random.nextInt(20) + 1;
        for (int i = 0; i < amountOfSysAdmins; i++)
        {
            engineers.add(new SysAdmin(random.nextInt(50) + 500, Skills.values()[random.nextInt(7)]));
        }
    }
}
