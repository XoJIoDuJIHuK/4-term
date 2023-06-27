package staff;

public abstract class Staff {
    public Skills skill;
    public double salary;
    public String toString()
    {
        return String.format("%s %s %s$", this.getClass(), skill, salary);
    }
}