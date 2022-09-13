 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background=images/bgb.jpg>
<%
String uid=request.getParameter("cid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/career", "root", "root");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("Select * from college_info where cid="+uid);
while(rs.next()){
%>
<div class="panel-body">
<div class="container">
<br/><br/><br/><br/>
	<div class="row">
	<div class="col-sm-2"></div>
	
		<div class="col-sm-8">
		<div class="col-sm-3"></div>
		<div class="col-sm-2"></div>
		   
			<form method="post">
			<div class="form-group"> 
<input class="form-control" name="cid" type="text" value="<%out.println(rs.getString(1));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="name" type="text" value="<%out.println(rs.getString(2));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="contact" type="text" value="<%out.println(rs.getString(3));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="email" type="text" value="<%out.println(rs.getString(4));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="address" type="text" value="<%out.println(rs.getString(5));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="city" type="text" value="<%out.println(rs.getString(6));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="intake" type="text" value="<%out.println(rs.getString(7));%>">
</div>
<div class="form-group"> 
<div class="form-group"> 
<input class="form-control" name="fees" type="text" value="<%out.println(rs.getString(8));%>">
</div>
<input class="form-control" name="fees" type="text" value="<%out.println(rs.getString(9));%>">
</div>


		<center><input type="submit" name="sub" value="UPDATE"/></center>
    </form>
            
		</div>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>
<% 

}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%> 
<%
String buttonclick=request.getParameter("sub");
if(buttonclick!=null){
String name=request.getParameter("name");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String address=request.getParameter("address");
String city=request.getParameter("city");
String intake=request.getParameter("intake");
String fees=request.getParameter("fees");
String cri=request.getParameter("criteria");


try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/career","root","root");
 
     PreparedStatement ps=(PreparedStatement) conn.prepareStatement
   ("update college_info set name=?,contact=?,email=?,address=?,city=?,intake=?,fees=?,criteria=? where cid="+uid);
     
     ps.setString(1,name);
     ps.setString(2,contact);
     ps.setString(3,email);
     ps.setString(4,address);
     ps.setString(5,city);
     ps.setString(6,intake);
     ps.setString(7,fees);
     ps.setString(8,cri);
int i =ps.executeUpdate();
if(i>0)
{
response.sendRedirect("College_Info.jsp");	
}else{
response.sendRedirect("error.jsp");
}
}catch(Exception e){
	e.printStackTrace();
	
}
}
%>
</body>
<script>

</script>
</html>