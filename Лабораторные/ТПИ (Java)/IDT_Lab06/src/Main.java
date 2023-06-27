import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.util.ArrayList;

public class Main {

    private static void PrintAll(ResultSet result) throws SQLException {
        System.out.println(String.format("Planet: name: %s radius: %s core temperature: %s is atmosphere: " +
                        "%s is live: %s Satellite: name: %s radius: %s distance to planet: %s",
                result.getString(1), result.getLong(2),
                result.getLong(3), result.getString(4),
                result.getString(5), result.getInt(6),
                result.getString(7), result.getLong(8),
                result.getLong(9)
        ));
    }

    public static void main(String[] args) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").getDeclaredConstructor().newInstance();
            String connectionUrl = "jdbc:sqlserver://XOJIODUJIHUK\\MSQL_SERVER_V1;databaseName=IDT_Lab06;" +
                    "trustServerCertificate=true;encrypt=false;IntegratedSecurity=false";
            Connection con = DriverManager.getConnection(connectionUrl, "testuser", "1111");
            System.out.println("Success");

            Statement st = con.createStatement();

            System.out.println("Вывести информацию обо всех планетах, на которых присутствует жизнь, и их спутниках");
            ResultSet result = st.executeQuery("select * from Planets join Satellites on " +
                    "Planets.name = Satellites.planet_name where Planets.is_live = 'д'");

            while (result.next())
            {
                PrintAll(result);
            }
            System.out.println("Вывести информацию о планетах и их спутниках, имеющих наименьший радиус и наибольшее количество спутников.");
            result = st.executeQuery("select *\n" +
                    "\tfrom Planets left join Satellites on Planets.name = Satellites.planet_name\n" +
                    "\t\twhere Planets.radius = (select top(1) radius from Planets\n" +
                    "\t\t\twhere Planets.name = Planets.name\n" +
                    "\t\t\torder by radius asc)\n" +
                    "union select *\n" +
                    "\tfrom Planets left join Satellites on Planets.name = Satellites.planet_name\n" +
                    "\t\twhere Planets.satellites_amount = (select top(1) satellites_amount from Planets\n" +
                    "\t\t\twhere Planets.name = Planets.name\n" +
                    "\t\t\torder by satellites_amount desc)");

            while (result.next())
            {
                PrintAll(result);
            }
            System.out.println("Найти планету, сумма радиусов спутников которой наибольшая.");
            result = st.executeQuery("select planet_name, sum(Satellites.radius) [Sum]\n" +
                    "\tfrom Satellites\n" +
                    "\tgroup by planet_name\n" +
                    "\torder by Sum desc");
            if (result.next())
            {
                System.out.println("Planet with highest sum of satellites radiuses: " + result.getString(1));
            }

            st.close();
            con.close();
        } catch (Exception ex)
        {
            System.out.println("Failed");
            System.out.println(ex);
        }
    }

}
