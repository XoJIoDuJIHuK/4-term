package Library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDAO implements IDAO {


    public MyDAO() throws SQLException {
        try {
            DriverManager.registerDriver(new net.sourceforge.jtds.jdbc.Driver());
        }
        catch (SQLException ex){
            ex.printStackTrace();
        }
    }

    @Override
    public Connection getConnection() throws SQLException{
        return DriverManager.getConnection("jdbc:sqlite:DB\\Library.db");
    }


    @Override
    public IGenDAO <Books, Integer> getBooksDAO(Connection connection) {
        return new MyDAO_Books(connection);
    }
    @Override
    public IGenDAO<Author, Integer> getAuthorDAO(Connection connection) {
        return new MyDAO_Author(connection);
    }
}
