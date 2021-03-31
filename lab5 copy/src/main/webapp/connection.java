package main.webapp;

import java.sql.*;

public class connection {

public static void main(String[] args) {
// TODO Auto-generated method stub
try {
Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
System.err.println("Where is your PostgreSQL JDBC Driver? " + "Include in your library path!");
e.printStackTrace();
}

try(Connection db = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_b07_g25", "sthad060", "Luna$pinx123")) {
	
Statement st = db.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM finalproject.brand");
while (rs.next()) {
System.out.print("");
System.out.println(rs.getString(2));
}
rs.close();
st.close();
} catch (SQLException ex) {
System.out.println("Hello");


}
}

} 