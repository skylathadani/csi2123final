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

String custid = request.getParameter("custid");
String staydate = request.getParameter("staydate");
String capacity = request.getParameter("capacity");
String nights = request.getParameter("nights");

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
<td><b>view</b></td>
<td><b>extendable</b></td>
<td><b>tv</b></td>
<td><b>ac</b></td>
<td><b>fridge</b></td>
<td><b>hotel address</b></td>
<td><b>star rating</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_b07_g25", "sthad060", "Luna$pinx123");
statement=connection.createStatement();
String sql ="SELECT room.roomid, room.price, room.view, room.extendable, (room.amenities).tv, (room.amenities).ac, hotelchain.rating, (room.amenities).fridge, hotelchain.hotel_chain_address from finalproject.room Inner Join finalproject.hotelchain on room.chainid=hotelchain.chainid Where room.isavailable = 'True' and roomid not in (Select roomid from finalproject.booking where booking.date >= '" +staydate+ "' and checkoutdate <= ( TO_DATE('" + staydate +"', 'YYYY-MM-DD') + " +nights+ ")) AND capacity = " + capacity;


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<tr bgcolor="#DEB887">

<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getString(5) %></td>
<td><%=resultSet.getString(6) %></td>
<td><%=resultSet.getString(7) %></td>
<td><%=resultSet.getString("hotel_chain_address") %></td>
<td><%=resultSet.getString("rating") %></td>


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

<h2>Please fill out this form to book a reservation</h2>
<h3>If successful, a confirmation will show on the next page</h3>
<form action="room_booking_process.jsp" method="GET">
CustomerID: <input type="text" name="customerid" value=<%=custid%> required/>
roomid: <input type="text" name="roomid" required/>
date of stay (yyyy-mm-dd): <input type="text" name="staydate" value=<%=staydate%> required />
Number of Nights (please remove /): <input type="text" name="nights" required value=<%=nights%> required/>
<input type="submit" value="Submit" />
</form>

<form name="myform" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form>


   </body>
</html>