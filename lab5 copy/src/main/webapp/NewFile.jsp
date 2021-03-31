<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head><title>Hello World</title></head>
   
   <body>
   
   <h1>Welcome to eHotel Management System</h1>
   
   <h2>Please choose an option below:</h2>
   
   
   <form name="myform" onsubmit="return OnSubmitForm();">
  
      
  	<h2>For Employees</h2>
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Employee">
     <h2>For Customers</h2>
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Book Room">
     
  
        </form>
<script type="text/javascript">
function OnSubmitForm()
{
  if(document.pressed == 'Employee')
  {
   document.myform.action ="employee.jsp";
  } else {
	  if(document.pressed == 'Book Room')
	  {
	   document.myform.action ="customerinfo.jsp";
	  }
  } 
  return true;
}
</script>
   </body>
</html>