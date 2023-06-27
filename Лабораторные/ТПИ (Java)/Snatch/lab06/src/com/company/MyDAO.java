package com.company;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDAO implements IDAO {


    private static final String url = "jdbc:jtds:sqlserver://localhost:1433;databaseName=Weather;integratedSecurity=true;";


    public MyDAO() throws SQLException {
        try {
            DriverManager.registerDriver(new net.sourceforge.jtds.jdbc.Driver());
        }
        catch (SQLException ex){
            ex.printStackTrace();
        }
    }

    @Override
    public Connection getConnection() throws SQLException{
        return DriverManager.getConnection(url);
    }

    @Override
    public IGenDAO<Weather, Integer> getWeatherDAO(Connection connection) {
        return null;
    }




}
