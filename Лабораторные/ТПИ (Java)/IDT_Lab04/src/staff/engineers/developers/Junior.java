package staff.engineers.developers;

import staff.Skills;
import staff.engineers.Engineer;

import java.io.Serializable;

public class Junior extends Engineer implements Comparable<Junior>{
    public Junior(int salary, Skills skill)
    {
        this.salary = salary;
        this.skill = skill;
    }

    @Override
    public int compareTo(Junior o) {
        return Double.compare(this.salary, o.salary);
    }
}
