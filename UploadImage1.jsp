<html>
<head>
<title>File Uploading Form</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body style="background-color:#3b5663;">

<div class="container">
<%@ include file="header.jsp" %>
<%!

String udata;
String id,dp;


%>
<%
try{
HttpSession hs=request.getSession();
udata=hs.getAttribute("uname").toString();
String uid=hs.getAttribute("uid").toString();
dp=session.getAttribute("dp").toString();

}catch(Exception e){
	out.println(""+e);
}
%>

<div class="row">
<div class="col-md-4">
<img src="<%out.println(dp); %>" style="width:90px;margin-left: 24px;">
</br>
<a href="UploadImage1.jsp">Change Profile</a>
</br>
<p style="color:#ffffff;">Name: <%=udata%></p>

</div>
<div class="col-md-8">

</div>

</div>
<div class="row">

<div class="col-md-4">


</br>

Name: <%=udata%>

<br/>

</div>



<div class="col-md-8">
<h3>Upload Image With Post</h3>
 <br />
<form action="UploadImage.jsp" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>


</div>



</div>

</div>
</body>
</html>