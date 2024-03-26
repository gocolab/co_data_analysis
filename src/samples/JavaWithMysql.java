import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class JavaWithMysql {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/java_mysql";
    static final String USER = "cocolabhub";
    static final String PASS = "cocolabhub";

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        HashMap<Integer, HashMap<String, Object>> data = new HashMap<>();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();

            // Create
            String sql = "INSERT INTO TableName (column1, column2) VALUES ('value1', 'value2')";
            stmt.executeUpdate(sql);

            // Read
            sql = "SELECT * FROM TableName";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String column1 = rs.getString("column1");
                String column2 = rs.getString("column2");
                
                HashMap<String, Object> row = new HashMap<>();
                row.put("column1", column1);
                row.put("column2", column2);
                data.put(id, row);
            }

            // Update
            sql = "UPDATE TableName SET column1='newvalue1' WHERE id=1";
            stmt.executeUpdate(sql);

            // Delete
            sql = "DELETE FROM TableName WHERE id=2";
            stmt.executeUpdate(sql);

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}