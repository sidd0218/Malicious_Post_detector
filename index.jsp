	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<div class="container" >
<%@ include file="heade_Login.jsp" %>

<div class="row">

<div class="col-md-6">
<img src="images/instaimage.png" style="width:450px;">
</div>
<div class="col-md-6">
<b>Create an account</b>
<form action="NewRegistration.jsp">
</br>
<input type="text" name="uname" class="form-control" placeholder="Enter Full Name" pattern="[A-Za-z ]{1,32}" title="Please Enter Valid Name" required>
</br>
<input type="email"  name="email" class="form-control" placeholder="Enter your email address" required>
</br>
<input type="email" class="form-control" placeholder="Renter your email address" title="Enter Valid Contact Number"  required >
</br>
<input type="password" name="pass" class="form-control" placeholder="Enter Password" required>
</br>
<input type="date" min="1900-01-01" max="1999-12-30"name="dob"class="form-control" placeholder="Select Date of Birth" required>
</br>
<input type="submit" class="btn btn-success" value="Create an account">
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</div>
</form>

</div>
</div>

</body>
</html>