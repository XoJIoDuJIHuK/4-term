package sql.demo;

import connector.*;
import java.sql.*;
import java.util.Scanner;
import com.microsoft.sqlserver.jdbc.*;
import org.apache.log4j.PropertyConfigurator;
public class Main {

    public static void main(String[] args) {

        DAO dao=new DAO();
        Mssql mas=new Mssql();
        mas.printResult();
        String log4jConfPath = "..\\lab6\\src\\resources\\log4j.properties";
        PropertyConfigurator.configure(log4jConfPath);

    }
}
