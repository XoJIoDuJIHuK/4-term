package Library;


import org.junit.Ignore;
import org.junit.Test;
import java.sql.Connection;
import java.util.List;
import static org.junit.Assert.assertNotNull;

public class LibTest {
    @Ignore
    @Test
    public void testObj()
    {
        Books a = new Books();
        assertNotNull(a);
    }
    @Test
    public void testConnection() throws Exception
    {
        MyDAO dao = new MyDAO();
        dao.getConnection();
    }

    @Test
    public void testSqlQuery() throws Exception
    {
        MyDAO dao = new MyDAO();
        List<Books> booksList;
        Connection con = dao.getConnection();
        IGenDAO<Books, Integer> booksDAO = dao.getBooksDAO(con);
        booksList = booksDAO.getAll();
    }
}
