<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">
<div class="row">

<div class="col-md-4">
<img src="Images/facebook.png" style="width:300px;">

</div>
</div>
<hr>
<div class="row">
<div class="col-md-4">

</div>
<div class="col-md-8">
Win an existing prizes get check the following link
</br>
<a href="">www.http.google/abcd/gogle</a>

<hr>
Win an existing prizes get check the following link
</br>
<a href="">www.http.google/abcd/gogle</a>
<hr>
Win an existing prizes get check the following link
</br>
<a href="">www.http.google/abcd/gogle</a>
<hr>
Win an existing prizes get check the following link
</br>
<a href="">www.http.google/abcd/gogle</a>
<hr>
</br>
Win an existing prizes get check the following link
</br>
<a href="">www.http.google/abcd/gogle</a>
</div>
</div>

<%@ page import="java.sql.*" %>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
Statement stm=con.createStatement();
ResultSet rs= stm.executeQuery("select * from UserPost");
while(rs.next()){
	out.println(rs.getString(1));
}

%>

</body>
</html>