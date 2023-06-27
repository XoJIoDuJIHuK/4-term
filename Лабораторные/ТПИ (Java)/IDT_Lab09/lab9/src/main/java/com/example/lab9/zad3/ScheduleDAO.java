package com.example.lab9.zad3;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDAO {
    static String connectionUrl = "jdbc:sqlserver://XOJIODUJIHUK\\MSQL_SERVER_V1;databaseName=ExtremeIroningDatabase;" +
            "trustServerCertificate=true;encrypt=false;IntegratedSecurity=false";

    public List<Schedule> getScheduleByUserLogin(String userLogin) {
        List<Schedule> schedule = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement("SELECT us.user_id, us.day_of_week, us.start_time, us.end_time, us.description\n" +
                     "FROM user_schedule us\n" +
                     "INNER JOIN users u ON u.id = us.user_id\n" +
                     "WHERE u.username = ?\n")) {
            statement.setString(1, userLogin);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Schedule item = new Schedule(
                        resultSet.getInt("user_id"),
                        resultSet.getString("channel_name"),
                        resultSet.getString("href")
                );
                schedule.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedule;
    }


    public List<Schedule> getUserSchedule(int user_id) {
        List<Schedule> schedule = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM user_schedule WHERE user_id=?")) {
            statement.setInt(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Schedule item = new Schedule(
                        resultSet.getInt("user_id"),
                        resultSet.getString("channel_name"),
                        resultSet.getString("href")
                );
                schedule.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedule;
    }
    public List<Schedule> getAllSchedules() {
        List<Schedule> scheduleList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement("SELECT us.user_id, us.day_of_week, us.start_time, us.end_time, us.description\n" +
                     "FROM user_schedule us\n")) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Schedule item = new Schedule(
                        resultSet.getInt("user_id"),
                        resultSet.getString("channel_name"),
                        resultSet.getString("href")
                );
                scheduleList.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return scheduleList;
    }



    public boolean updateSchedule(List<Schedule> schedule) {
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE user_schedule SET channel_name=? WHERE id=?")) {
            for (Schedule item : schedule) {
                statement.setInt(1, item.getId());
                statement.addBatch();
            }
            int[] rowsUpdated = statement.executeBatch();
            for (int row : rowsUpdated) {
                if (row == 0) {
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
    public void saveSchedule(List<Schedule> schedules) {
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE FROM user_schedule WHERE user_id = ?");
             PreparedStatement insertStatement = connection.prepareStatement(
                     "INSERT INTO user_schedule (user_id, channel_name, href) " +
                             "VALUES (?, ?, ?)")) {
            // Удаляем все записи из таблицы user_schedule для данного пользователя
            statement.setInt(1, schedules.get(0).getuser_id());
            statement.executeUpdate();

            // Добавляем новое расписание
            for (Schedule schedule : schedules) {
                insertStatement.setInt(1, schedule.getuser_id());
                insertStatement.setString(2, schedule.getChannel_name());
                insertStatement.setString(3, schedule.getHref());
                insertStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean UpdateChannel(int id, String name, String url)
    {
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE user_schedule SET href = '" + url + "' where user_id = " + id +
                             " and channel_name = '" + name + "'")) {
            statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public static boolean AddChannel(int id, String name, String url)
    {
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT user_schedule values(" + id + ", '" + name + "', '" + url + "')")) {
            statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public static boolean DeleteChannel(int id, String name)
    {
        try (Connection connection = DriverManager.getConnection(connectionUrl, "testuser", "1111");
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE user_schedule where channel_name = '" + name + "' and user_id = " + id)) {
            statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }



}
