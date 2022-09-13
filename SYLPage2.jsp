<%
try{
HttpSession hs=request.getSession();
String udata=hs.getAttribute("uname").toString();
String uid=hs.getAttribute("uid").toString();

}catch(Exception e){
	out.println(""+e);
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body style="background-color:#3b5998;">
<div class="container" style="">
<div class="row">
<%!
Connection con;
String username;
String id;
String followed_word="";
%>
<%
try{
username=session.getAttribute("uname").toString();
id=session.getAttribute("uid").toString();

}catch(Exception e){
	response.sendRedirect("index.jsp");
}
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

//out.println(""+finalmal);
%>
<div class="col-md-4">
<h1 style="color:#ffffff;"> A Social Media</h1>

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
<a href="LogOut.jsp"><button style="float: right;">LogOut</button></a>


</br>
</br>
<form method="post">

<input type="text" class="form-control" name="post" placeholder="Enter what is in your mind" required>
</br>
<input type="submit" value="Post" name="sub">
<br/>
<br/>
</form>


<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
  <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%!
String malword="";
String link="";
%>
<%
java.util.Date dt = new java.util.Date();
int month=dt.getMonth();
month=month+1;
//out.println(""+dt.getYear());

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

String timeStamp = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
String today=timeStamp+"Time: "+hour+":"+minute+":"+second;
//out.println("date"+dt.getDay()+"/"+month+"/"+dt.getYear());

String str1=request.getParameter("sub");
int word1count=0;
int word2count=0;
int word3count=0;
int hatecount=0;
int sexcount=0;
//Connection con;
//enter word for violance
String word1[]={"sexy","groomy","kill","killed","killer","terriost"};
//enter word for vulgur
String word2[]={"hate","fight","fighter","fighting","rubish","attack"};
//enter word for offensive
String word3[]={"vulgur","blast","bad","wrong","danger","dangerous"};
//enter word for hate
String hate[]={"vulgur","kiss","bullish","kissed","hate",""};
//enter word or sex
String sex[]={"vulgur","kiss","bullish","violance","","",""};
//

if(str1!=null){
	
	
	if(finalmal>=50.00000){
		
	%>	
		<script>
		
		alert("Your post has been block due to malicious content");
		
		</script>
		
		
	<%
	}else{
	
	
	String udata=request.getParameter("post");
	malword="";
	link="";
	  String[] splitStr = udata.split(" ");
	 
      List<String> list = new ArrayList();
      for(String s:splitStr){
    	  
    	 // out.println(""+s+"<br/>");
          if(!list.contains(s)){
              list.add(s);
          }
      }
	
for(int i=0;i<list.size();i++){
    	  
    	  
    	  String listitem=list.get(i);
    	  
   if(listitem.matches("^(http|https|ftp)://.*$")){
	   
	   link=listitem;
   }
    	  
    	  
    	  
          for(int j=0;j<word1.length;j++){
        	  
        	  if(listitem.contentEquals(word1[j])){
        		  word1count=word1count+1;
        		  malword=malword+","+listitem;
        		  followed_word=""+list.get(i+1);
        	  }
        	  if(listitem.contentEquals(word2[j])){
        		  word2count=word2count+1;
        		  malword=malword+","+listitem;
        		  followed_word=""+list.get(i+1);
        	  }
        	  if(listitem.contentEquals(word3[j])){
        		  word3count=word3count+1;
        		  malword=malword+","+listitem;
        		  followed_word=""+list.get(i+1);
        	  }
        	  if(listitem.contentEquals(hate[j])){
        		  hatecount=word3count+1;
        		  malword=malword+","+listitem;
        		  followed_word=""+list.get(i+1);
        	  }
        	  
        	  if(listitem.contentEquals(sex[j])){
        		  sexcount=word3count+1;
        		  malword=malword+","+listitem;
        		  followed_word=""+list.get(i+1);
        	  }
        	  
          }
              
             
          
          }
        
    	    
//out.println("<b>Word Status</b></br>");
//out.println("Violance:"+((float)word1count/word1.length)*100+"</br>");
//out.println("Vulgur:"+((float)word2count/word1.length)*100+"</br>");
//out.println("Offensive:"+((float)word3count/word1.length)*100+"</br>");
//out.println("Hate"+((float)hatecount/word1.length)*100+"</br>");
//out.println("Sex:"+((float)sexcount/word1.length)*100+"</br>");
if(((float)word1count/word1.length)*100>0||((float)word2count/word1.length)*100>0.00||((float)word3count/word1.length)*100>0.00||((float)hatecount/word1.length)*100>0.00||((float)hatecount/word1.length)*100>0.00){
	 // out.println("Post can be consider as malicious");
}else{
	 // out.println("Post not a malicious");
}


String udate=dt.toString();
//Establis Connection with databaseDate 
try{

//--------------check for credential

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
		word1count=0;
		word2count=0;
		word2count=0;
		word3count=0;
	}


	
	
	
PreparedStatement prst=con.prepareStatement("insert into UserPost(post,PostDate,UserId,UserName,violance,Vulgur,offensive,hate)values(?,?,?,?,?,?,?,?)");
prst.setString(1, udata);
prst.setString(2,today);
prst.setString(3, id);
prst.setString(4, username);
prst.setString(5,""+((float)word1count/word1.length)*100);
prst.setString(6, ""+((float)word2count/word2.length)*100+"");
prst.setString(7, ""+((float)word2count/word2.length)*100+"");
prst.setString(8, ""+((float)word3count/word3.length)*100+"");
//prst.setString(3, request.getParameter("url"));
int a= prst.executeUpdate();
prst.close();







}catch(Exception e){
	out.println(""+e);
}
//response.sendRedirect("User.jsp");
%>
<table class="table table-bordered table-responsive">
<tr class="warning">
<td>
Link Found
</td>
<td>
Malicious Word Found
</td>
<td>
Percentage Match
</td>
<td>
Violance
</td>
<td>
Vulgur
</td>
<td>
Offensive
</td>
<td>
Hate
</td>
<td>
is Malicious
</td>
</tr>


<tr class="warning">
<td>
<a href="<%out.println(""+link); %>" target="new"><%out.println(""+link); %></a>
<a href="http://localhost:8080/MaliciousSocialMedia/MaliciousLink?link=<%out.println(""+link); %>"><input type="submit" value="Checl Mal Link"></a>
</td>
<td>
<%out.println(""+malword); %>
</td>
<td>
<%out.println(""+malword); %>
</td>
<td>
<% out.println(""+((float)word1count/word1.length)*100+"");%>
</td>
<td>
<% out.println(""+((float)word2count/word2.length)*100+"");%>
</td>
<td>
<% out.println(""+((float)word3count/word3.length)*100+"");%>
</td>
<td>
<% out.println(""+((float)hatecount/word1.length)*100+"");%>
</td>
<td>
<% 
float totalmalcontent=(float)word1count/word1.length+(float)word2count/word2.length+(float)word3count/word3.length+(float)hatecount/word1.length;
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



<% 
}
}
%>


<br>
<%
try{
String query="select * from UserPost  Order By postid desc limit 5";
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
Statement stm=con1.createStatement();
ResultSet rs= stm.executeQuery(query);
while(rs.next()){
	%>
	<b style="color:#ffffff;"><%= rs.getString(2) %></b>
	</br>
	<p style="color:#ffffff;">Post Date:<%=rs.getString(3) %></p>
	<br/>
		<p style="color:#ffffff;">Upload By:<%=rs.getString(5) %></p>
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