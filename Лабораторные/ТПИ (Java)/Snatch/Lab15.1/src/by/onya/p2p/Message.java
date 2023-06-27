package by.onya.p2p;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
    private String text;
    private Date date;

    @Override
    public String toString() {
        return "Message : " + text + '\'' +
                "\t date : " + date ;
    }

    public Message(String text, Date date) {
        this.text = text;
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public Date getDate() {
        return date;
    }
}