package staff;

import main.Main;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

public abstract class Staff {
    static{
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }
    private static final Logger LOG = Logger.getLogger(Staff.class);
    public Skills skill;
    public double salary;
    public String toString()
    {
        return String.format("%s %s %s$", this.getClass(), skill, salary);
    }
}
