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
try{
String name= request.getParameter("uname");
out.println(name);
//connecting to db
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
PreparedStatement prst=con.prepareStatement("insert into UserData(Name,Email,Password,DOB,status,profilephoto)values(?,?,?,?,?,?)");
prst.setString(1, name);
prst.setString(2, request.getParameter("email"));
prst.setString(3, request.getParameter("pass"));
prst.setString(4, request.getParameter("dob"));
prst.setString(5, "0");
prst.setString(6, "images/user.png");
int a= prst.executeUpdate();
%>

<script>
alert("User Register Sucessfully");
window.location="index.jsp";

</script>






<%

}catch(Exception e){
	out.println(""+e);
}





%>
</body>
</html>