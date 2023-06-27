package com.company;

import java.util.Date;

public class Weather {
    public String region;
    public Date date;
    public int temperature;
    public String precipitations;

    public String ToString()
    {
        return "Weather{"+
                " region = "+region+"\'"+
                ", date = "+date+"\'"+
                ", temperature = "+temperature+"\'"+
                ", precipitations = "+precipitations+"\'"+
                "}";
    }
}
