package main;

import company.Company;
import org.apache.log4j.*;
import org.apache.log4j.xml.DOMConfigurator;
import staff.Skills;

public class Main {
    static{
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }
    private static final Logger LOG = Logger.getLogger(Main.class);
    public static void main(String[] args) {
        LOG.info("Starting program_____________________________");

        try
        {
            var Google = new Company();
            Google.director.CountEmployees();
            Google.director.PrintEngineersBySkill(Skills.ADVANCED);
            Google.director.Sort("salar");
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }

    }
}