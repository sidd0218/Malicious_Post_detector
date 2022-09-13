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
<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">

<div class="row">

<div class="container">
<div class="col-md-4">
<%@ include file="AdminLeftMenu.jsp" %>
</br>
</div>
<div class="col-md-8">
<%@ page import="java.sql.*" %>
<table class="table table-hover table-responsive">
<tr style="background-color:#129089">
<td>
Links Found		

</td>
<td>
Violant

</td>
<td>
Offensive 

</td>
<td>
Vulgar

</td>
<td>
Sexual 

</td>
<td>
Total Ration

</td>
<td>
Upload By

</td>
</tr>

<%

try{
//conncet to database
Class.forName("com.mysql.jdbc.Driver");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
//--------------check for credential---------------------------------------------
String query="select  * from blacklink";
Statement stm=con1.createStatement();
ResultSet rs= stm.executeQuery(query);
while(rs.next()){
%>

<tr >
<td>
<%out.println(rs.getString(2)); %>	

</td>
<td>
<%out.println(rs.getString(3)); %>	

</td>
<td>
<%out.println(rs.getString(4)); %>	
</td>
<td>
<%out.println(rs.getString(5)); %>	

</td>
<td>
<%out.println(rs.getString(6)); %>	

</td>
<td>
<%out.println(rs.getString(7)); %>	

</td>
<td>
<%out.println(rs.getString(8)); %>	

</td>
</tr>

<%
}
}catch(Exception e){
	
	out.println(""+e);
}


%>
</table>



</div>

</div>



</div>


</div>

</body>
</html>