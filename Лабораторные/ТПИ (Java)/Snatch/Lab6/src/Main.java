import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import Library.*;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
public class Main {
    static {
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }

    private static final Logger LOG = Logger.getLogger(Main.class);

    public static void main(String[] args) throws SQLException {


        MyDAO dao = new MyDAO();
        List<Author> authorList;
        List<Books> booksList;

        Connection con = dao.getConnection();
        System.out.println("All authors");
        LOG.info("All authors" + "\n");
        IGenDAO<Author, Integer> authorDAO = dao.getAuthorDAO(con);
        authorList = authorDAO.getAll();
        System.out.println(authorList);
        LOG.info(authorList + "\n");


        LOG.info("авторы у которых больше 1-ой книги");
        authorList = ((MyDAO_Author) (authorDAO)).infoAboutAuthor_N_books();
        System.out.println(authorList);
        LOG.info(authorList);

        System.out.println("Список всех книг");
        LOG.info("Список всех книг");
        IGenDAO<Books, Integer> booksDAO = dao.getBooksDAO(con);
        booksList = booksDAO.getAll();
        System.out.println(booksList);
        LOG.info(booksList + "\n");

        System.out.println("Книги, вышедшие в текущем и прошлом году\"");
        LOG.info("Книги, вышедшие в текущем и прошлом году");
        booksList = ((MyDAO_Books) (booksDAO)).booksyear();
        System.out.println(booksList);
        LOG.info(booksList + "\n");

        LOG.info("Список оставшихся книг после удаления");
        booksList = ((MyDAO_Books) (booksDAO)).deleteBooks();
        LOG.info(booksList + "\n");
        System.out.println("Список оставшихся книг после удаления");
        System.out.println(booksList + "\n");

        System.out.println("СТранзакция");
        ((MyDAO_Author) (authorDAO)).transaction();
        authorList = authorDAO.getAll();
        System.out.println(authorList);
        LOG.info(authorList + "\n");

    }
}
