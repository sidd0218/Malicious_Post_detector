<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminLogin</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">

</br>
</br>
</br>
<%
String str1= request.getParameter("sub");

if(str1!=null){
	
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	
	if(uname.contentEquals("Admin")&& pass.contentEquals("Admin")){
		
		response.sendRedirect("Admin.jsp");
		
	}
}



%>
<div class="row">
<div class="col-md-4">

</div>
<div class="col-md-4">
<b>Login Here</b>
</br>
</br>
<form>
<input type="text" class="form-control" name="uname" placeholder="Enter Username">
</br>
<input type="text" class="form-control" name="pass" placeholder="Enter Password">
</br>
<input type="submit" name="sub">
</form>
</div>
<div class="col-md-4"></div>
</div>


</div>




</body>
</html>