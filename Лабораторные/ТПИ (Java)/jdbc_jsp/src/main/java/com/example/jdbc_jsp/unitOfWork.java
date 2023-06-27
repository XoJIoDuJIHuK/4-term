package com.example.jdbc_jsp;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import com.microsoft.sqlserver.jdbc.*;
public class unitOfWork {
    static void WriteLogFile(String string) {
        try {
            File file = new File("D:\\_УЧЁБА_\\Лабораторные\\ТПИ (Java)\\jdbc_jsp\\src\\main\\java\\log.txt");
            file.createNewFile();
            FileWriter fw = new FileWriter(file, true);
            BufferedWriter writer = new BufferedWriter(fw);
            writer.write(string + "\n");
            writer.close();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

  static String connectionUrl = "jdbc:sqlserver://XOJIODUJIHUK\\MSQL_SERVER_V1;databaseName=IDT_Lab06;" +
            "trustServerCertificate=true;encrypt=false;IntegratedSecurity=false";
    static boolean IsAuthenticated(String login, String password) throws Exception {
        DriverManager.registerDriver(new SQLServerDriver());
        String query = "select count(*) from users where login='" + login + "' and password='" + password + "'";
        try (
             Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement st = connection.prepareStatement(query)) {
            ResultSet result = st.executeQuery();
            int count = 0;
            if (result.next()) count = result.getInt(1);

            return count > 0;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    static void Pay(String userName) throws Exception {
        DriverManager.registerDriver(new SQLServerDriver());
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111")) {
            int sum = GetBalance(userName);
            if (sum >= 100) sum -= 100;
            else sum = 0;
            String querySet = "update users set sum=" + sum + " where login='" + userName + "'";
            var statement = connection.prepareStatement(querySet);
            statement.executeQuery();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    static int GetBalance(String userName) throws Exception {
        DriverManager.registerDriver(new SQLServerDriver());
        String querySelect = "select sum from users  where login='" + userName + "'";
        try (
                Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
                PreparedStatement st = connection.prepareStatement(querySelect)) {
            ResultSet result = st.executeQuery();
            int sum = 0;
            if (result.next()) sum = result.getInt(1);
            return sum;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
}
