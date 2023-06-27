package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String url = "jdbc:sqlite:C:/Users/User/Documents/в сети/lab10(НОВАЯ ВЕРСИЯ)/db/Med.db";

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
