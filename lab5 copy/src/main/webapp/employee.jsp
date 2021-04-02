<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head><title>Hello World</title></head>
   
   <body>
   
   <h1>Welcome to eHotel Management System</h1>
   
   <h2>Please choose an option below:</h2>
   
   
   <form name="myform" onsubmit="return OnSubmitForm();">
  
      
  	<h2>Check in a guest with a booking id</h2>
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Check in guest">
     <h2>Book a room for a walk-in guest</h2>
     <h3>this option displays available and unavailable rooms based on customer preference</h3>
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

<h2>Confirm a customer has paid</h2>

<form name="bleh" form action="hasPaid.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Update Customer Pay">
        </form>
   </body>
</html>

<form name="bleh" form action="NewFile.jsp" method="GET">

     <input type="submit" name="button" onclick="document.pressed=this.value" value="Go Back Home">
        </form>
   </body>
</html>