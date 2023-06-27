package Library;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyDAO_Author implements IGenDAO <Author, Integer> {
    private final Connection connection;

    public MyDAO_Author(Connection connection){
        this.connection = connection;
    }


    @Override
    public List<Author> getAll() throws SQLException {
        String sql = "SELECT * FROM author;";
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Author> list = new ArrayList<Author>();
        ResultSetListAuthor(rs, list);
        return list;
    }

    public void transaction() throws SQLException {

        try {
            Statement stm = connection.createStatement();
            connection.setAutoCommit(false);
            stm.executeUpdate("INSERT INTO author VALUES ('Hi', 'Russia')");
            stm.executeUpdate("INSERT INTO author VALUES ('Hi2', 'Russia2')");
            connection.commit();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            connection.rollback();
        }

    }

    public List <Author> infoAboutAuthor_N_books() throws SQLException{
        String sql = "select author.author, author.country from author\n" +
                " inner join books on author.author = books.author\n" +
                " group by author.author, author.country \n" +
                " having count(*) > 1;";
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Author> list = new ArrayList<Author>();
        ResultSetListAuthor(rs, list);
        return list;
    }

    public void ResultSetListAuthor(ResultSet rs, List<Author> list) throws SQLException {//для вывода
        while (rs.next()){
            Author author = new Author();
            author.author = rs.getString("author");
            author.country = rs.getString("country");
            list.add(author);
        }
    }
}
