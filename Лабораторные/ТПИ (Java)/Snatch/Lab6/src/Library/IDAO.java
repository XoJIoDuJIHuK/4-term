package Library;

import java.sql.Connection;
import java.sql.SQLException;

public interface IDAO {
    public Connection getConnection() throws SQLException;
    public IGenDAO <Books, Integer> getBooksDAO(Connection connection);
    public  IGenDAO<Author, Integer> getAuthorDAO(Connection connection);
}
