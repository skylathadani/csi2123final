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
//ResultSet resultSet = null;
String roomid = "";
String date = "";
String customerName = "";
String sin = "";

String phone ="";
String email ="";
String staydate = "";
String custid = "";


customerName = request.getParameter("name");

email = request.getParameter("email");

sin = request.getParameter("sin");

phone = request.getParameter("phone");

roomid = request.getParameter("roomid");

staydate = request.getParameter("staydate");
String street = request.getParameter("street");
String city = request.getParameter("city");
String country = request.getParameter("country");
String postal = request.getParameter("postal");


%>



<%
try{ 
connection = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_b07_g25", "sthad060", "Luna$pinx123");
statement=connection.createStatement();
String sql ="INSERT INTO finalproject.customer (full_name, sin, date_of_registration,phone,email,customer_address) VALUES ('" + customerName + "'," + sin + ",'2021-03-30'," + phone + ",'" + email + "',('" + street + "','" +  city + "','" + country + "','" + postal +"'))" ;

System.out.println(sql);
statement.executeUpdate(sql);
Statement statement2 = connection.createStatement();
sql = "Select finalproject.customer.customerid from finalproject.customer where sin =" + sin;
ResultSet result2=statement2.executeQuery(sql);
%>
<p><b>CustomerID Please write down this value for next step:</b>

</p>

 
<% 
while(result2.next()){
%>

<h3><%=result2.getString("customerid") %></h3>

<%
}

statement.close();
result2.close();
connection.close();

%>


<% 





} catch (Exception e) {
e.printStackTrace();
}
%>

<h1>Form Processing</h1>
 
<p><b>Name:</b>
   <%= request.getParameter("name")%>
</p>
<p><b>email:</b>
   <%= request.getParameter("email")%>
</p>
<p><b>SIN:</b>
   <%= request.getParameter("sin")%>
</p>
<p><b>phone:</b>
   <%= request.getParameter("phone")%>
</p>
<p><b>Address:</b>
   <%= request.getParameter("street")%>
   <%= request.getParameter("city")%>
   <%= request.getParameter("country")%>
   <%= request.getParameter("postal")%>
</p>

 <form action="rentroom.jsp" method="GET">

Customerid: <input type="text" name="custid" required/>
Stay Date: (yyyy-mm-dd): <input type="text" name="staydate" required />
Number of Nights: <input type="text" name="nights" required/>
Number of people in room: <input type="text" name="capacity" required />

<input type="submit" value="Submit" />
</form>

<form name="myform" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form>


   </body>
</html>