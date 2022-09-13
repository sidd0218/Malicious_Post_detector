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
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<div class="container" style="background-color:rgba(238, 130, 238, 0.42);">
<div class="row">
<div class="col-md-4">
</br>
</br>
<%@ include file="AdminLeftMenu.jsp" %>
</br>
</br>
</div>
<div class="col-md-8">
<%
int malicious=0;
int non_malicious=0;
int total=0;
String str1="";
int totaloff=0;
int totalhate=0;
int totalvul=0;
int totalviolance=0;
int numberofpost=0;
%>
<%
try{

//conncet to database
Class.forName("com.mysql.jdbc.Driver");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
//--------------check for credential---------------------------------------------
String query="select count(*) from UserData";
Statement stm=con1.createStatement();
ResultSet rs= stm.executeQuery(query);
rs.next();
 str1=rs.getString(1);

rs.close();
stm.close();
con1.close();

%>

<%

Connection con2= DriverManager.getConnection("jdbc:mysql://localhost/FraApp","root","root");
Statement stm2=con2.createStatement();
ResultSet rs2= stm2.executeQuery("select * from UserPost");
while(rs2.next()){
String str2=rs2.getString(1);

String off11=rs2.getString(8);
float off = Float.parseFloat(off11);
float hate= Float.parseFloat(rs2.getString(9));
float vio= Float.parseFloat(rs2.getString(7));

float vulgur= Float.parseFloat(rs2.getString(6));

if(off>0.0){
	totaloff=totaloff+1;
}

if(hate>0.0){
	totalhate=totalhate+1;
}

if(vio>0.0){
	totaloff=totaloff+1;
}

if(vulgur>0.0){
	totalvul=totalvul+1;
}
numberofpost=numberofpost+1;
}

}catch(Exception e){
	out.println(""+e);
}
%>
<table class="table table-hover">
<tr style="background-color:#129089">
<td>
No. of Users

</td>
<td>
Offensive
</td>
<td>
Hate
</td>
<td>
Vulgur
</td>
<td>
Violence
</td>
<td>
No. of Post

</td>
<td>
Malicious Post
</td>
</tr>
<tr>

<td><b><% out.println(str1);%></b></td>
<td><b><% out.println(""+totaloff);%></b></td>
<td><b><% out.println(""+totalhate);%></b></td>
<td><b><%out.println(""+totalviolance);%></b></td>
<td><b><%out.println(""+totalvul);%></b></td>
<td><b><%out.println(""+numberofpost);%></b></td>
<td><b><%out.println(""+totaloff);%></b></td>

</table>
<div id="columnchart_material" style="width:700px; height:500px;"></div>
</div>
</div>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Vulgur', 'Violence', 'Offensive','Hate'],
          ['2017',<%out.println(""+totalviolance);%>,<%out.println(""+totalvul);%>, <%out.println(""+totaloff);%>, <%out.println(""+totalhate);%>]
          
        ]);

        var options = {
          chart: {
            title: 'OverAll Malicous Detection ',
            subtitle: 'Violance, Vulgur, Offensive,Hate',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, options);
      }
    </script>


</div>
</body>
</html>