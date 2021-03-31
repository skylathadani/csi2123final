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
<h1>Please enter your information below</h1>



<form action="rent_processing.jsp" method="GET">
Full Name: <input type="text" name="name">
<br />
email: <input type="text" name="email" />
SIN: <input type="text" name="sin" />
phone: <input type="text" name="phone" />
Today's date written (yyyy-mm-dd): <input type="text" name="staydate" />
Your street name and number written (street 1): <input type="text" name="street" />
Your city: <input type="text" name="city" />
Your country: <input type="text" name="country" />
Your postal code: <input type="text" name="postal" />
<input type="submit" value="Submit" />
</form>


<form name="myform" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form></body>
</html>