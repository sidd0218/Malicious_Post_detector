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
<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">
<%@ include file="header.jsp" %>
<div class="row">

<div class="col-md-4">
<%@ page import="java.sql.*" %>
<%

try{
	
	String username=session.getAttribute("uname").toString();

}catch(Exception e){

	response.sendRedirect("index.jsp");
	
}




%>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
String str1=request.getParameter("sub");
if(str1!=null){
	String keyword=request.getParameter("keyword");
	String keyworddesc=request.getParameter("keyword_desc");
	String category=request.getParameter("category");
	
	PreparedStatement prst=con.prepareStatement("insert into Keywords(keyword,Keyworddescription,category)values(?,?,?)");
	prst.setString(1, keyword);
	prst.setString(2,keyworddesc);
	prst.setString(3,category);
	prst.executeUpdate();
	
%>
<script>
alert("Keyword Added Sucessfully");

</script>


<% 
}
}catch(Exception e){
	out.println(""+e);
}
%>
<%@ include file="AdminLeftMenu.jsp" %>
</div>
<div class="col-md-8">

<form method="post">
Enter Keyword
<input type="text" name="keyword" class="form-control"name="keyword" placeholder="Enter Keyword" required>
<br>
Enter Description
<input type="text" name="keyword_desc" class="form-control" placeholder="Enter Description" required>
<br>
Select category
<select name="category" class="form-control">
<option>Violant</option>
<option>Offensive</option>
<option>Vulgur</option>
<option>Sexual</option>

</select>
<br>
<input type="submit" name="sub">		

</form>
</div>

</div>



</div>
</body>
</html>