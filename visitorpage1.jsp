<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Secure Home System</title>
<style type="text/css">
.button {
    background-color: #008CBA; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    border-radius: 12px;
    display: inline-block;
    font-size: 16px;
}
</style>
<!-- for popup message start -->
<link href="<%=request.getContextPath() %>/js/message.css" rel="stylesheet" type="text/css" /> 

<script type="text/javascript" src="<%=request.getContextPath() %>/js/style.js"></script>	
<!-- for popup message end-->

</head>
<body onload="startTimer()">
<div align="center"><img src="<%=request.getContextPath()%>/images/title.png"></div>
<%

String k1=null;
k1=request.getParameter("no");
 int no=0;
 if(k1!=null)
 {
	 no=Integer.parseInt(k1); 
 }



%>
 
 <%
if(no==1)
{
%>
<div style="position: absolute;top: 150px;">
<div class="error" id="message" >	
	<p>You are not covering with web camera.....!</p>
</div>
</div>
<%}
 else
	{%>
	
	<%
	}%>




<form action="<%=request.getContextPath()%>/MemberAuthentication">

<center>
<img alt="" src="<%=request.getContextPath() %>/images/web_camera_PNG7989.png">

<input type="submit" name="action" class="button" value="BELL">
</center>
</form>
</body>
</html>