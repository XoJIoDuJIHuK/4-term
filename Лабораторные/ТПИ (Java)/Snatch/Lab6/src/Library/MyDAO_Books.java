package Library;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Date;

public class MyDAO_Books implements IGenDAO<Books, Integer> {
    public final Connection connection;
    public  MyDAO_Books(Connection connection){
        this.connection = connection;
    }

    public List<Books> booksyear() throws SQLException {
        Statement st = connection.createStatement();
        Date d=new Date();
        int year=d.getYear();
        String sql = "select * from books where books.released='"+(new SimpleDateFormat("yyyy").format(new Date()))+"'"
                +" or books.released='"+ Year.now().minusYears(1).getValue()+"'";
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Books> list = new ArrayList<Books>();

        ResulSetListBooks(rs, list);
        return list;
    }

    public void ResulSetListBooks(ResultSet rs, List<Books> list) throws SQLException {
        while (rs.next()) {
            Books books = new Books();
            books.id_book = rs.getInt("id_book");
            books.name_of_book = rs.getString("name_of_book");
            books.author = rs.getString("author");
            books.released = rs.getString("released");
            books.publishing_house = rs.getString("publishing_house");

            list.add(books);
        }
    }


    @Override
    public List<Books> getAll() throws SQLException{
        Statement st = connection.createStatement();
        String sql = "SELECT * FROM books;";
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Books> list = new ArrayList<Books>();

        ResulSetListBooks(rs, list);
        return list;
    }




    public List<Books> deleteBooks() throws SQLException {

        Statement st = connection.createStatement();
        Scanner in = new Scanner(System.in);
        System.out.print("Введите год: ");
        String year = in.next();
        String sql = "select* from books where CAST(books.released as Integer) > "+year ;
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Books> list = new ArrayList<Books>();

        ResulSetListBooks(rs, list);
        return list;
    }
}
