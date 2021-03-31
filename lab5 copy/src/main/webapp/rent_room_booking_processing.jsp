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
<%@page import="java.time.*"%>
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
String roomid = "";
String date = "";
String customerName = "";
String sin = "";

String phone ="";
String email ="";
String staydate = "";

String custid = request.getParameter("customerid");



roomid = request.getParameter("roomid");

staydate = request.getParameter("staydate");



%>



<%
try{ 
connection = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_b07_g25", "sthad060", "Luna$pinx123");
String sql = "";
%>


<% 

//Statement statement2=connection.createStatement();
//sql ="Select customerid from finalproject.customer where sin = " + sin ;

//System.out.println(sql);

//ResultSet resultSet2 = statement2.executeQuery(sql);

%>

<% 
//String customerid = resultSet2.getString(0);
//statement2.close();
//resultSet2.close();
String allgood="Oops your booking did not go through";
Statement statement3=connection.createStatement();
sql ="INSERT INTO finalproject.booking (status,roomid,date,customerid,chainid) VALUES ('rented'," + roomid + ",'" + staydate + "'," + custid + ",(Select chainid from finalproject.room where roomid = " + roomid + "))" ;
System.out.println(sql);
statement3.executeUpdate(sql);

sql = "SELECT * FROM finalproject.booking ORDER BY bookingid DESC LIMIT 1";

ResultSet result = statement3.executeQuery(sql);

while(result.next()){
	
	if(result.getString("customerid").equals(custid)){
		allgood="Your booking went through";
	}
	
		
		%>
	<h1><%= allgood%></h1>
	<p><b>Booking id:</b>
   	<%= result.getString("bookingid")%>
	</p>
	<p><b>CustomerID:</b>
   	<%= result.getString("customerid")%>
	</p>
	<p><b>room picked:</b>
   	<%= result.getString("roomid")%>
	</p>
	<p><b>date of stay:</b>
   	<%= result.getString("date")%>
	</p>
	<p><b>Hotel Chain id:</b>
   	<%= result.getString("chainid")%>
	</p>
	<p><b>Status:</b>
   	<%= result.getString("status")%>
	</p>
	
		<%
		 
	}
		
	
		
		


result.close();
statement3.close();
connection.close();



} catch (Exception e) {
e.printStackTrace();
}
%>

<form name="myform" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form>



   </body>
</html>