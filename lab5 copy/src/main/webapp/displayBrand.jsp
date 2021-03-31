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

<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>brand_email</b></td>
<td><b>brand_phone_number</b></td>
<td><b>number_of_chains</b></td>
<td><b>chainids</b></td>
<td><b>braindid</b></td>
<td><b>address</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_b07_g25", "sthad060", "Luna$pinx123");
statement=connection.createStatement();
String sql ="SELECT * FROM finalproject.brand";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<tr bgcolor="#DEB887">

<td><%=resultSet.getString("brand_email") %></td>
<td><%=resultSet.getString("brand_phone_number") %></td>
<td><%=resultSet.getString("number_of_chains") %></td>
<td><%=resultSet.getString("chainids") %></td>
<td><%=resultSet.getString("brandid") %></td>
<td><%=resultSet.getString("address") %></td>

</tr>




<% 
}
statement.close();
resultSet.close();

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<form name="myform" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form>


   </body>
</html>