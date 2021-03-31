<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head><title>Hello World</title></head>
   
   <body>
   <form name="myform" onsubmit="return OnSubmitForm();">
  
      
  
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Display Brand">
     <input type="submit" name="button" onclick="document.pressed=this.value" value="Book Room">
    
  
        </form>
<script type="text/javascript">
function OnSubmitForm()
{
  if(document.pressed == 'Display Brand')
  {
   document.myform.action ="displayBrand.jsp";
  } else{
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