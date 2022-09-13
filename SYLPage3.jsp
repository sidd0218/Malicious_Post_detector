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
<%@ include file="header.jsp" %>
<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">

<div class="row">
  <%@ page import="java.text.SimpleDateFormat" %>
<%!
Connection con;
String username;
String id,dp;
String followed_word="";

%>
<%
try{
HttpSession hs=request.getSession();
String udata=hs.getAttribute("uname").toString();
String uid=hs.getAttribute("uid").toString();
dp=session.getAttribute("dp").toString();
}catch(Exception e){
	out.println(""+e);
}
%>
<div class="col-md-4">

</div>
</div>
<hr>
<div class="row">
<div class="col-md-4">
<img src="<%out.println(dp.trim());%>" style="width:90px;margin-left: 24px;">
</br>
<a href="UploadImage1.jsp">Change Profile</a>
</br>
<p style="color:#ffffff;">Name: <%=username%></p>
</div>

<div class="col-md-8">
<a href="LogOut.jsp"><button style="float: right;">LogOut</button></a>
<a href="FindFriends.jsp"><button style="float: right;">Find Friends</button></a>


</br>
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
float totalmal=0;
float finalmal=0;
%>
<%

float totalmal=0;
float finalmal=0;
float rem=0;
float mration=0;
int count=0;
//out.println("Hello"+id);
//conncet to database
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");

PreparedStatement prst2=con.prepareStatement("select * from userpost where UserId=?");
prst2.setString(1, id);
ResultSet rs22=prst2.executeQuery();
while(rs22.next()){
	//out.println(""+uid);
totalmal=Float.parseFloat(rs22.getString(6))+Float.parseFloat(rs22.getString(7).trim())+Float.parseFloat(rs22.getString(8))+Float.parseFloat(rs22.getString(9));
finalmal= finalmal+ totalmal;

count=count+1;
}
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
		
		if(finalmal>=50.00000){
			
		%>	
			<script>
			
			alert("Your post has been block due to malicious content");
			
			</script>
			
			
		<%
		}else{
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
    			 followed_word=""+list.get(i+1);
    			// out.println(""+followed_word);
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

    	  
         
boolean malcontent=false;   	  

Statement selectword=con.createStatement();  
ResultSet rscheck=selectword.executeQuery("select * from followedword");
while(rscheck.next()){
	
	if(followed_word.contentEquals(rscheck.getString(2))){
		
		malcontent=true;
	}
	
	
}

if(malcontent){
	
}else{
	violantcount=0;
	vulgurcount=0;
	offensivecount=0;
	sexualcount=0;
}




String udate=dt.toString();
//Establis Connection with databaseDate 
 Calendar c = Calendar.getInstance();
			        SimpleDateFormat dateformat = new SimpleDateFormat("dd-MMM-yyyy");
			        String datetime = dateformat.format(c.getTime());
			        
			       // Toast.makeText(MainActivity.this, "Preferences"+""+date+"-"+ghour+"-"+gmin,500).show();
			        
			        int millisecond = c.get(Calendar.MILLISECOND);
			        int second = c.get(Calendar.SECOND);
			        int minute = c.get(Calendar.MINUTE);
			              //12 hour format
			        int hour = c.get(Calendar.HOUR);
			              //24 hour format
			        int hourofday = c.get(Calendar.HOUR_OF_DAY);

//--------------check for credential
String timeStamp = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
String today11=timeStamp+""+hour+""+minute+""+second ;

PreparedStatement prst=con.prepareStatement("insert into UserPost(post,PostDate,UserId,UserName,violance,Vulgur,offensive,hate)values(?,?,?,?,?,?,?,?)");
prst.setString(1, udata);
prst.setString(2,today11);
prst.setString(3, id);
prst.setString(4, username);
prst.setString(5,""+((float)violantcount/(udata.length()))*1000);
prst.setString(6, ""+((float)vulgurcount/(udata.length()))*1000);
prst.setString(7, ""+((float)offensivecount/(udata.length()))*1000);
prst.setString(8, ""+(float)sexualcount/(udata.length())*1000);
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
<td>is Malicious</td>
</tr>
<tr class="danger">
<td><%out.println(""+udata);%></td>
<td><%out.println(""+wordmatch);%></td>
<td><%out.println(""+(float)offensivecount/(udata.length()));%></td>
<td><%out.println(""+(float)vulgurcount/(udata.length()));%></td>
<td><%out.println(""+(float)violantcount/(udata.length()));%></td>
<td><%out.println(""+(float)sexualcount/(udata.length()));%></td>
<td>
<% 
float totalmalcontent=(float)offensivecount/(udata.length())+(float)offensivecount/(udata.length())+(float)offensivecount/(udata.length())+(float)offensivecount/(udata.length());
if(totalmalcontent>0){
%>	
<b><%out.println("Malicious") ;%></b>
<% 	
}else{
%>	
<b><%out.println(" Non Malicious") ;%></b>

<% 	
}

%>
</td>
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
}
%>
</div>



</div>

</div>

</body>
</html>