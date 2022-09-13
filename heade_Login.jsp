<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body style="background-color:#3b5663;">
<%@ page import="java.sql.*" %>

<%
String buttton_click=request.getParameter("sub");
if(buttton_click!=null){
	
	String user_uname=request.getParameter("uname"	);
	String user_pass=request.getParameter("upass");
	boolean status=true;
	//conncet to database
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
String query="select * from UserData";

Statement stm=con.createStatement();
ResultSet rs= stm.executeQuery(query);
while(rs.next()){
	
	//out.println("Hello"+rs.getString(3));
	String db_uname=rs.getString(3);
	String db_pass=rs.getString(4);
	if(user_uname.contentEquals(db_uname) && user_pass.contentEquals(db_pass) ){
		try{
		session.setAttribute("uname", rs.getString(2));
		session.setAttribute("uid", rs.getString(1));
		session.setAttribute("dp", rs.getString(7));
		status=false;
		/*if(rs.getString(6).contentEquals("1")){*/
			%>
			<script>
			//alert("Your Account has been block");
			</script>
			
			<%
	/*	}else{
		response.sendRedirect("User.jsp");
		}*/
			response.sendRedirect("SYLPage3.jsp");
		}catch(Exception e){
			out.println(""+e);
		}
		
	}
}

	
	
	if(user_uname.contentEquals("admin@gmail.com")&&user_pass.contentEquals("admin")){
		session.setAttribute("uname","admin");
		response.sendRedirect("Admin_View_Post.jsp");
		status=true;
	}
	
	if(status){
		%>
		<script>
		alert("Invalid Username or Password");
		</script>
		
		<%
	}
}
		
%>
<div class="container">
<div class="row">
<div class="col-md-4">
<h1 style="color:#ffffff;"> AI Based Text Analysis</h1>

</div>

<div class="col-md-4">
</br>
<form method="post">
<input type="text" name="uname" class="form-control" placeholder="Enter username">
</div>
<div class="col-md-4">
<br>
<input type="password" name="upass" class="form-control" placeholder="Enter Password">
</div>
<div class="col-md-2">
</br>
<input type="submit" name="sub" class="btn btn-warning" style="align:right">
</div>
</form>	
</div>
<hr>




</div>
</body>
</html>