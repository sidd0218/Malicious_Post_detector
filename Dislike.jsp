<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
  <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%

try{
String id=request.getParameter("id");
String clike="";
//conncet to database
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");

PreparedStatement prst=con.prepareStatement("select * from userpost where postid=?");
prst.setString(1, id);
ResultSet rs=prst.executeQuery();
while(rs.next()){
	
	clike=rs.getString(11);
	
}



int flike=0;
int ulike=Integer.parseInt(clike);

flike=ulike+1;

PreparedStatement prst2=con.prepareStatement("update userpost set dlike=? where postid=?");
prst2.setString(1, ""+flike);
prst2.setString(2, id);
prst2.executeUpdate();
con.close();
response.sendRedirect("User.jsp");

}catch(Exception e){
	
	out.println(""+e);
}
%>
</body>
</html>