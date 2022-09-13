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
String receiver=request.getParameter("uid");
HttpSession hs=request.getSession();
String senderid=hs.getAttribute("uid").toString();
String sendername=hs.getAttribute("uname").toString();
try{
	//conncet to database
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
    PreparedStatement prtsm=con1.prepareStatement("Update friedrequest set isconfirm=? where rid=?" );
    prtsm.setString(1,"1");
    prtsm.setString(2,request.getParameter("cid"));
    prtsm.executeUpdate();
%>
<script>

alert("Friend Request Accepted  Sucessfully")
window.location="FindFriends.jsp";

</script>


<%
}catch(Exception e){
	out.println(""+e);
}



%>
</body>
</html>