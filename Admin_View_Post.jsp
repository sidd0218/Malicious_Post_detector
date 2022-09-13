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

<%

try{
	
	String username=session.getAttribute("uname").toString();

}catch(Exception e){

	response.sendRedirect("index.jsp");
	
}




%>



<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">
<%@ include file="header.jsp" %>

<%@ page import="java.sql.*" %>
<div class="row">

<div class="col-md-4">


<%@ include file="AdminLeftMenu.jsp" %>
</div>

<div class="col-md-8">
<%
try{
String query="select * from UserPost Order By postid desc limit 5";
Class.forName("com.mysql.jdbc.Driver");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
Statement stm=con1.createStatement();
ResultSet rs= stm.executeQuery(query);
while(rs.next()){
	%>
	<%= rs.getString(2) %>
	</br>
	Post Date:<%=rs.getString(3) %>
	</br>
	Post By: <%=rs.getString(5) %>
	<hr>
	<% 
}
}catch(Exception e){
	out.println(""+e);
}
%>

</div>

</div>
</div>

</body>
</html>