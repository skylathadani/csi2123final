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

Statement statement3=connection.createStatement();
sql ="INSERT INTO finalproject.booking (roomid,date,customerid) VALUES (" + roomid + ",'" + staydate + "'," + custid + ")" ;
System.out.println(sql);
ResultSet resultSet3 = statement3.executeQuery(sql);
statement3.close();
resultSet3.close();
connection.close();



} catch (Exception e) {
e.printStackTrace();
}
%>

<h1>Form Processing</h1>

<p><b>CustomerID:</b>
   <%= request.getParameter("customerid")%>
</p>

<p><b>room picked:</b>
   <%= request.getParameter("roomid")%>
</p>
<p><b>date of stay:</b>
   <%= request.getParameter("staydate")%>
</p>

   </body>
</html>