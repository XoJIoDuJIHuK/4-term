package connector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import com.microsoft.sqlserver.jdbc.*;
interface MsDAO{
    void printResult();
}
 final public  class Mssql extends DAO implements MsDAO {


    private final  Connection con=getConnection();
    @Override
    public void printResult() {
        String sql = "SELECT TOP 1 rt1.NAMES,[Сумма радиусов] from (SELECT PLANETS.NAMES, sum(SATELLITES.RADIUS)[Сумма радиусов] FROM PLANETS inner JOIN SATELLITES on PLANETS.NAMES = SATELLITES.PLANET GROUP BY PLANETS.NAMES) rt1 order by [Сумма радиусов] desc;\n";
        try (con){
        try(Statement state=con.createStatement()){
            ResultSet resultSet=  state.executeQuery(sql);
            while (resultSet.next()) {
                System.out.println(
                        resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3)+
                                " "+ resultSet.getInt(4)+" "+resultSet.getInt(5) + " " + resultSet.getInt(6) + " " + resultSet.getString(7)+
                                " "+ resultSet.getString(8));
            }

        }
        }catch (Exception e){

        }
    }
}
