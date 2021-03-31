<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head><title>Hello World</title></head>
   
   <body>
     <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<h1>See available rooms below</h1>
<%
String id = request.getParameter("userId");
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://web0.site.uottawa.ca:15432";
String dbName = "group_b07_g25";
String userId = "sthad060";
String password = "Luna$pinx123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h2 align="center"><font><strong>Rooms</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>roomid</b></td>
<td><b>price</b></td>
<td><b>capacity</b></td>
<td><b>view</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_b07_g25", "sthad060", "Luna$pinx123");
statement=connection.createStatement();
String sql ="SELECT * FROM finalproject.room Where isavailable=TRUE";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<tr bgcolor="#DEB887">

<td><%=resultSet.getString("roomid") %></td>
<td><%=resultSet.getString("price") %></td>
<td><%=resultSet.getString("capacity") %></td>
<td><%=resultSet.getString("view") %></td>



</tr>




<% 
}
statement.close();
resultSet.close();
connection.close();

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


<form action="room_booking_process.jsp" method="GET">
CustomerID: <input type="text" name="customerid" />
roomid: <input type="text" name="roomid" />
date of stay (yyyy-mm-dd): <input type="text" name="staydate" />

<input type="submit" value="Submit" />
</form>

   </body>
</html>