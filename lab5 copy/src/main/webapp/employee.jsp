<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head><title>Hello World</title></head>
   
   <body>
   
   <h1>Welcome to eHotel Management System</h1>
   
   <h2>Please choose an option below:</h2>
   
   
   <form name="myform" onsubmit="return OnSubmitForm();">
  
      
  
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Check in guest">
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Rent a room">
     
  
        </form>
<script type="text/javascript">
function OnSubmitForm()
{
  if(document.pressed == 'Check in guest')
  {
   document.myform.action ="checkin.jsp";
  } else {
	  if(document.pressed == 'Rent a room')
	  {
	   document.myform.action ="rent.jsp";
	  }
  } 
  return true;
}
</script>

<form name="bleh" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form>
   </body>
</html>