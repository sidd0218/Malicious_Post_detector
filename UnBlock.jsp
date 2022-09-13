<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
//conncet to database
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
//--------------check for credential---------------------------------------------
String str1=request.getParameter("uid");
PreparedStatement prst=con1.prepareStatement("update userdata set status=?where uid=?");
prst.setString(1, "0");
prst.setString(2, str1);
prst.executeUpdate();

}catch(Exception e){
	out.println(""+e);
}
%>
<script>
alert("User Record Block Sucessfully");
window.location="PostCalculator.jsp"
</script>
</body>
</html>