package DB;

import Model.*;
import Utils.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDAO {

    public enum LoginResult
    {
        UserNotFound,
        WrongPassword,
        Success
    }

    private Connection _connection;
    private final Hasher _hasher;

    public UsersDAO() throws Exception {

        _connection = new DBConnection().getConnection();
        _hasher = new Hasher();
    }

    public void Register(String login, String password, UserType userType) throws SQLException {
        String query = " INSERT INTO Users(login, password, userType) VALUES (?, ?, ?);";
        PreparedStatement statement = _connection.prepareStatement(query);

        String hashedPassword = _hasher.hash(password);
        statement.setString(1, login);
        statement.setString(2, hashedPassword);
        statement.setString(3, userType.toString());
        statement.executeUpdate();

        statement.close();
        _connection.close();
    }

    public LoginResult Login(String login, String password) throws SQLException {
        _connection = new DBConnection().getConnection();
        PreparedStatement statement = _connection.prepareStatement("SELECT password FROM Users WHERE login='" + login + "';");
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String retrievedPassword = resultSet.getString("password");
            if ( _hasher.authenticate(password, retrievedPassword)) {
                _connection.close();
                return LoginResult.Success;
            }
            _connection.close();
            return LoginResult.WrongPassword;
        }
        _connection.close();
        return LoginResult.UserNotFound;

    }

    public User GetUser(String login) throws SQLException {
        _connection = new DBConnection().getConnection();
        PreparedStatement statement = _connection.prepareStatement("SELECT * FROM Users WHERE login='" + login + "';");

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            User user = new User();
            user.setID(resultSet.getInt(4));
            user.setLogin(resultSet.getString(1));
            user.setPassword(resultSet.getString(2));
            user.setRole(UserType.valueOf(resultSet.getString(3)));

            _connection.close();
            return user;
        }
        _connection.close();
        return null;
    }
}

