package com.company;

import java.sql.Connection;
import java.sql.SQLException;

public interface IDAO {
    public Connection getConnection() throws SQLException;
    public IGenDAO <Weather, Integer> getWeatherDAO(Connection connection);
    //public  IGenDAO<Author, Integer> getAuthorDAO(Connection connection);
  //  public  IGenDAO<Author, Integer> getAuthorDAO(Connection connection);
}

