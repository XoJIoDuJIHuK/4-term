package Library;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

public interface IGenDAO<T, PK extends Serializable> {
    List<T> getAll() throws SQLException;
}
