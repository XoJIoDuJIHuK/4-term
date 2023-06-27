package Library;

import java.util.ArrayList;

public class Books {
    public String name_of_book;
    public String author;
    public String released;
    public String publishing_house;
    public int id_book;

    @Override
    public String toString() {
        return "\nBooks{ " +
                "name_of_book='" + name_of_book + '\'' +
                ", author='" + author + '\'' +
                ", released='" + released + '\'' +
                ", publishing_house='" + publishing_house + '\'' +
                ", id_book=" + id_book +
                '}';
    }
}
