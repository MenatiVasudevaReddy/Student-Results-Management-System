package Project;
import java.sql.*;

public class ConnectionProvider {
    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SRMS?useSSL=false", "root", "root");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
