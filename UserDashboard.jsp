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
<div class="row">
<%!
Connection con;
String username;
String id;
%>
<%

username=session.getAttribute("uname").toString();
id=session.getAttribute("uid").toString();

//out.println("Hello"+id);

%>
<div class="col-md-4">
<img src="Images/facebook.png" style="width:300px;">

</div>
</div>
<hr>
<div class="row">
<div class="col-md-4">
<img src="Images/user_icon.png" style="width:90px;margin-left: 24px;">
</br>
</br>
Name: <%=username%>
</div>

<div class="col-md-8">
<a href="index.jsp"><button style="float: right;">LogOut</button></a>

<a href="FindFriends.jsp"><button style="float: right;">Find Friend</button></a>
</br>
</br>
<form method="post">

<input type="text" class="form-control" name="post" placeholder="Enter what is in your mind">
</br>
<input type="submit" value="Post" name="sub">
</form>


<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%!
String malword="";
String link="";
String udata="";
%>
<%
java.util.Date dt = new java.util.Date();
int month=dt.getMonth();
month=month+1;
//out.println(""+dt.getYear());
String today=dt.getDay()+"/"+month;
//out.println("date"+dt.getDay()+"/"+month+"/"+dt.getYear());

String str1=request.getParameter("sub");
int violantcount=0;
int vulgurcount=0;
int offensivecount=0;
int sexualcount=0;
//Connection con;
//enter word for violance
String wordmatch="";

if(str1!=null){
	 violantcount=0;
	 vulgurcount=0;
	 offensivecount=0;
	 sexualcount=0;
	try{
		//conncet to database
		wordmatch="";
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
	 udata=request.getParameter("post");
	
	

	  String[] splitStr = udata.split(" ");
	 
      List<String> list = new ArrayList();
      for(String s:splitStr){
    	  
    	 // out.println(""+s+"<br/>");
          if(!list.contains(s)){
              list.add(s);
          }
          
      }
   
      for(int i=0;i<list.size();i++){
    	  
    	  String element=list.get(i);
    	  
    	 Statement stm=con.createStatement();
    	 ResultSet rs=stm.executeQuery("select * from keywords");
    	  while(rs.next()){
    		  
    		  if(rs.getString(2).contentEquals(element)){
               
    			  wordmatch=wordmatch+","+element;
    			  
    			  if(rs.getString(4).contentEquals("Violant")){
    				  violantcount=violantcount+1;
    			  }
    			  
    			  if(rs.getString(4).contentEquals("Offensive")){
    				  offensivecount=offensivecount+1;
    			  }
    			  
    			  if(rs.getString(4).contentEquals("Vulgur")){
    				  vulgurcount=vulgurcount+1;
    			  }
    			  
    			  if(rs.getString(4).contentEquals("Sexual")){
    				  sexualcount=sexualcount+1;
    			  }
    			  
    		  }
    		  
    		  
    	  }

    	  
      }
      
      
      
      
      

for(int i=0;i<list.size();i++){
    	  
    	  
    	  String listitem=list.get(i);
    	  
   if(listitem.matches("^(http|https|ftp)://.*$")){
	   
	   link=listitem;
   }
    	  
}

    	  
         
    	    



String udate=dt.toString();
//Establis Connection with databaseDate 

//--------------check for credential

PreparedStatement prst=con.prepareStatement("insert into UserPost(post,PostDate,UserId,UserName,violance,Vulgur,offensive,hate)values(?,?,?,?,?,?,?,?)");
prst.setString(1, udata);
prst.setString(2,today);
prst.setString(3, id);
prst.setString(4, username);
prst.setString(5,""+((float)violantcount/(udata.length())));
prst.setString(6, ""+((float)vulgurcount/(udata.length()))+"");
prst.setString(7, ""+((float)offensivecount/(udata.length()))+"");
prst.setString(8, ""+(float)sexualcount/(udata.length())+"");
//prst.setString(3, request.getParameter("url"));
int a= prst.executeUpdate();
prst.close();

}catch(Exception e){
	out.println(""+e);
}
//response.sendRedirect("User.jsp");
%>




<hr>
<h3>Post Checker</h3>

<hr>
<table class="table table-condensed">
<tr class="warning">
<td>Post</td>
<td>Word Found</td>
<td>Offensive</td>
<td>Vulgur</td>
<td>Violant</td>
<td>Sexual</td>
</tr>
<tr class="danger">
<td><%out.println(""+udata);%></td>
<td><%out.println(""+wordmatch);%></td>
<td><%out.println(""+(float)offensivecount/(udata.length()));%></td>
<td><%out.println(""+(float)vulgurcount/(udata.length()));%></td>
<td><%out.println(""+(float)violantcount/(udata.length()));%></td>
<td><%out.println(""+(float)sexualcount/(udata.length()));%></td>
</tr>
</table>

<h3>Links Found</h3>
<table class="table table-condensed">
<tr class="warning">
<td>Link</td>
<td>is BalckListed</td>
<td>Action</td>
</tr>
<tr class="danger">
<td><% out.println(""+link); %></td>


<%
boolean status=false;
PreparedStatement prst=con.prepareStatement("select * from blacklink where Link=?");
prst.setString(1, link);

ResultSet rs=prst.executeQuery();
while(rs.next()){
	 status=true;
}

%>

<td><% 

if(status){
%>
Found in Itemset
<%	
}else{
%>

Not Found in Itemset
<%	
}


%></td>
<td><a href="http://localhost:8080/MaliciousSocialMedia/MaliciousLink?link=<%out.println(link);%>"><input type="submit"></a></td>
</tr>

</table>
<% 
}

%>


<hr>
<b>Your Posts</b>
<br>
<%
try{
String query="select * from UserPost where UserId="+id;
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
Statement stm=con1.createStatement();
ResultSet rs= stm.executeQuery(query);
while(rs.next()){
	%>
	<%= rs.getString(2) %>
	</br>
	Post Date:<%=rs.getString(3) %>
	<hr>
	<% 
}
}catch(Exception e){
	out.println(""+e);
}

%>
</div>



</div>

</div>

</body>
</html>