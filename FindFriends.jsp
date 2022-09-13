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
<%!
Connection con1;
%>
<%

try{
	
	String username=session.getAttribute("uname").toString();
	Class.forName("com.mysql.jdbc.Driver");
    con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");

}catch(Exception e){

	response.sendRedirect("index.jsp");
	
}

%>

<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<div class="container"  style="background-color:rgba(238, 130, 238, 0.42);">

<div class="row">

<div class="col-md-4">
<table class="table table-hover">
<h2>Confirm Friend</h2>
<tr>
<td>Name</td>
<td>Action</td>

</tr>
<%
try{
HttpSession hs=request.getSession();
String senderid=hs.getAttribute("uid").toString();
PreparedStatement prst2=con1.prepareStatement("select * from friedrequest where receiverid=? and isconfirm=?");
prst2.setString(1, senderid);
prst2.setString(2, "0");
ResultSet rs2=prst2.executeQuery();
while(rs2.next()){
%>

<tr>
<td><%out.println(rs2.getString(4)); %></td>
<td><a href="ConfirmRequest.jsp?cid=<%out.println(rs2.getString(1));%>"><input type="submit" value="Confirm"></a></td>

</tr>
<% 	
}

}catch(Exception e){
	out.println(""+e);
}
%>

</table>
<br/>
<br/>

</div>
<div class="col-md-8">
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
<td>
Malicious Post
</td>
<td>
Non Malicious
</td>
<td>
Trust Factor
<td>
Action
</td>

</tr>

<%
float totalmal=0;
float finalmal=0;
float rem=0;
float mration=0;
int count=0;
try{
//conncet to database

//--------------check for credential---------------------------------------------
String query="select  * from UserData";
Statement stm=con1.createStatement();
ResultSet rs= stm.executeQuery(query);
while(rs.next()){
	 totalmal=0;
	 rem=0;
	 count=0;
	 finalmal=0;
	 mration=0;
	String uid=rs.getString(1);
	PreparedStatement prst=con1.prepareStatement("select * from userpost where UserId=?");
	prst.setString(1, uid);
    ResultSet rs22=prst.executeQuery();
    while(rs22.next()){
    	//out.println(""+uid);
 totalmal=Float.parseFloat(rs22.getString(6))+Float.parseFloat(rs22.getString(7).trim())+Float.parseFloat(rs22.getString(8))+Float.parseFloat(rs22.getString(9));
 finalmal= finalmal+ totalmal;
 
 count=count+1;
    }
   
    if(finalmal>100){
    	rem=100-finalmal;
    	rem=(-1)*rem;
    }else{
    	rem=100-finalmal;
    }
    
    
%>
<tr>

<td><b><% out.println(rs.getString(1));%></b></td>
<td><b><% out.println(rs.getString(2));%></b></td> 
<td><b><% out.println(rs.getString(3));%></b></td>
<td><b><% out.println(finalmal);%></b></td> 
<td><b><% out.println(rem);%></b></td>
<td><b><% out.println((float)finalmal/rem);%></b></td>

<td>
<%



%>
	<a href="SendFriendRequest.jsp?uid=<%out.println(rs.getString(1)); %>"><input type="submit" value="Send Friend Request"></a>
	
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
</body>
</html>