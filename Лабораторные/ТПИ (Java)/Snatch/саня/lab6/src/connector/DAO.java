package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.microsoft.sqlserver.jdbc.*;
public class DAO {

    String connectionUrl = "jdbc://localhost:1433;databaseName=master;user=root;password=123";
    protected Connection getConnection(){
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(connectionUrl);
            System.out.println("Connection OK");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Connection ERROR");
        }
        return connection;
    }
}
