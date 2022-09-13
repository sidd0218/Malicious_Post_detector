<html>
<head>
<title>File Uploading Form</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body style="background-color:rgba(238, 130, 238, 0.42);">
<div class="container">
<div class="row">
<div class="col-md-4">
<img src="Images/facebook.png" style="width:300px;">

</div>
<div class="col-md-8">

</div>

</div>
<hr>
<div class="row">

<div class="col-md-4">
<%

String username=session.getAttribute("uname").toString();
String id=session.getAttribute("uid").toString();


%>


</br>

Name: <%=username%>

<br/>

</div>


<%@ page import="java.sql.*" %>
<div class="col-md-8">
<h3>Upload Image With Post</h3>
 <br />
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from imagedata");
while(rs.next()){
%>
<img src="<%out.println(rs.getString(2)); %>" width="100px" height="100px">
<%} %>
</div>



</div>

</div>
</body>
</html>