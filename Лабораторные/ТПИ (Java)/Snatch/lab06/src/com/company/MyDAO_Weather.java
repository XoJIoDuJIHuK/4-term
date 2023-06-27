package com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class MyDAO_Weather implements IGenDAO <Weather, Integer> {
    private final Connection connection;

    public MyDAO_Weather(Connection connection){
        this.connection = connection;
    }


    @Override
    public List<Weather> getAll() throws SQLException {
        String sql = "SELECT * FROM Weather;";
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Weather> list = new ArrayList<Weather>();
        ResultSetListWeather(rs, list);
        return list;
    }


    public List <Weather> infoAboutAuthor_N_books() throws SQLException{
        String sql = "Weather.Region, Weather.Date, Weather.Temperature, Weather.Precipitation from Weather\n" +
                " inner join books on author.author = books.author\n" +
                " group by author.author, author.country \n" +
                " having count(*) > 1;";
        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<Weather> list = new ArrayList<Weather>();
       // ResultSetListAuthor(rs, list);
        return list;
    }

    public void ResultSetListWeather(ResultSet rs, List<Weather> list) throws SQLException {//для вывода
        while (rs.next()){
            Weather weather= new Weather();
            weather.region = rs.getString("author");
            weather.temperature = rs.getInt("country");
            weather.date = rs.getDate("date");
            weather.precipitations = rs.getString("precipitation");
            list.add(weather);
        }
    }
}
