package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String url ="jdbc:sqlite:C:/Users/User/Documents/в сети/Java_4sem/lab10/db/Med.db";
//            "jdbc:sqlserver://LAPTOP-N0QMVJ9U:1433;"
//            + "database=Med;"
//            + "user=JavaDie;"
//           + "password=123;"
//            + "encrypt=false;"
//            + "trustServerCertificate=false;"
//            + "loginTimeout=30;";
            //"jdbc:jtds:sqlite://localhost:1433;databaseName=Med;integratedSecurity=true;";


    public DBConnection() throws SQLException {
      try {
            Class.forName("org.sqlite.JDBC");
            DriverManager.registerDriver(new net.sourceforge.jtds.jdbc.Driver());
        }
        catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException{
        return DriverManager.getConnection(url);
    }
}
