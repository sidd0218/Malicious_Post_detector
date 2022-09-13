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
<div class="container"  style="background-color:rgba(238, 130, 238, 0.42);">

<div class="row">

<div class="col-md-4">
<%@ include file="AdminLeftMenu.jsp" %>
<br/>
<br/>

</div>
<div class="col-md-8">

<form>
<br/>
<input type="text" name="frndname" class="form-control" placeholder="Enter User Name">
<br/>
<input type="submit" name="sub">
<br/><br/>
</form>



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
Total Post
</td>
<td>
Action
</td>
<td>
Unblocking
</td>
</tr>

<%

String str45=request.getParameter("sub");

if(str45!=null){
String name=request.getParameter("frndname");
	
	
float totalmal=0;
float finalmal=0;
float rem=0;
float mration=0;
int count=0;
try{
//conncet to database
Class.forName("com.mysql.jdbc.Driver");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
//--------------check for credential---------------------------------------------
PreparedStatement stm=con1.prepareStatement("select * from UserData where Name like ?");
stm.setString(1,"%"+name+"%");
ResultSet rs= stm.executeQuery();
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
<td><b><% out.println(count);%></b></td>
<td><b><% 
if( finalmal>50.00 && rs.getString(6).contentEquals("0")){
%>
<a href="BlockUser2.jsp?final=<%out.println(finalmal);%>&rem=<%out.println(rem);%>&count=<%out.println(count);%>"><input type="submit" value="Block"></a>
<% 
}else{
%>
None
<%
}
%></b></td>
<td>
<%

if(rs.getString(6).contentEquals("1")){

%>
	<a href="UnBlock.jsp?uid=<%out.println(rs.getString(1)); %>"><input type="submit" value="UnBlock"></a>
	
</td>


<%
}
%>


<td>
<a href="PlotGraph.jsp?final=<%out.println(finalmal);%>&rem=<%out.println(rem);%>&count=<%out.println(count);%>"><input type="submit" value="Plot Graph"></a>
</td>
</tr>
<%

}

}catch(Exception e){
	out.println(""+e);
}
}
%>
</table>





 

</div>
</div>



</div>
</body>
</html>