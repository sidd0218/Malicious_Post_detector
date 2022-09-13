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

<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<div class="container"  style="background-color:rgba(238, 130, 238, 0.42);">

<div class="row">

<div class="col-md-4">
<%@ include file="AdminLeftMenu.jsp" %>
<br/>
<br/>

</div>
<div class="col-md-8">
<form>
<br/>
<input type="text" name="frndname" class="form-control" placeholder="Enter User Name">
<br/>
<input type="submit" name="sub">
<br/><br/>
</form>

<% %>






<table class="table table-hover">
<tr style="background-color:#129089">
<td>
UserId

</td>
<td>
Name

</td>
<td>
Email
</td>
</tr>

<%
String str23=request.getParameter("sub");
if(str23!=null){
	String name=request.getParameter("frndname");
	//out.println(name);
try{
//conncet to database
Class.forName("com.mysql.jdbc.Driver");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
//--------------check for credential---------------------------------------------
String query="select  * from UserData";
PreparedStatement stm=con1.prepareStatement("select * from UserData where Name like ?");
stm.setString(1,"%"+name+"%");
ResultSet rs= stm.executeQuery();
while(rs.next()){
%>
<tr>

<td><b><% out.println(rs.getString(1));%></b></td>
<td><b><% out.println(rs.getString(2));%></b></td>
<td><b><% out.println(rs.getString(3));%></b></td>
</tr>

<%} 

}catch(Exception e){
	out.println(""+e);
}
}
%>





</table>


</div>
</div>



</div>
</body>
</html>