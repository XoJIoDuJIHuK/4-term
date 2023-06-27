package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class MedDAO {
    private final Connection _connection;

    public MedDAO() throws Exception {
        _connection = new DBConnection().getConnection();
    }

    public boolean Create(Med med) {
        String query = " INSERT INTO Med(Name, Adress, Phone) VALUES (?, ?, ?);";

        try {
            PreparedStatement statement = _connection.prepareStatement(query);

            statement.setString(1, med.getName());
            statement.setString(2, med.getAdress());
            statement.setString(3, med.getPhone());
            statement.executeUpdate();

            statement.close();
        } catch (SQLException exception) {
            return false;
        }

        return true;
    }

    public boolean Remove(int id) {
        String query = "DELETE FROM Med WHERE id = (?);";

        try {
            PreparedStatement statement = _connection.prepareStatement(query);

            statement.setInt(1, id);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException exception) {
            return false;
        }
        return true;
    }

    public boolean Update(int id, Med med) {
        String query = "UPDATE Med SET Name = (?), Adress = (?), Phone = (?) WHERE Id = (?);";

        try {
            PreparedStatement statement = _connection.prepareStatement(query);

            statement.setString(1, med.getName());
            statement.setString(2, med.getAdress());
            statement.setString(3, med.getPhone());
            statement.setInt(4, id);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException exception) {
            return false;
        }
        return false;
    }

    public Med Get(int id) {
        String query = "SELECT * FROM Med WHERE id=(?);";

        try {
            PreparedStatement statement = _connection.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Med med = new Med();
                med.setId(resultSet.getInt(4));
                med.setName(resultSet.getString(1));
                med.setAdress(resultSet.getString(2));
                med.setPhone(resultSet.getString(3));

                return med;
            }
        } catch (SQLException exception) {
        }
        return null;
    }

    public ArrayList<Med> GetAll() {
        String query = "SELECT * FROM Med;";
        ArrayList<Med> result = new ArrayList<>();

        try {
            PreparedStatement statement = _connection.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Med med = new Med();
                med.setId(resultSet.getInt(4));
                med.setName(resultSet.getString(1));
                med.setAdress(resultSet.getString(2));
                med.setPhone(resultSet.getString(3));

                result.add(med);
            }
        } catch (SQLException exception) {
        }

        return result;
    }
}
