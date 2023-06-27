package Library;

public class Author {
    public String author;
    public String country;

    @Override
    public String toString() {
        return "\nAuthor{" +
                "author='" + author + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}
