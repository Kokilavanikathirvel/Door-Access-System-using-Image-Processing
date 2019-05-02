<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Secure Home System</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	
	  <!-- for popup message start -->
<link href="<%=request.getContextPath() %>/js/message.css" rel="stylesheet" type="text/css" /> 

<script type="text/javascript" src="<%=request.getContextPath() %>/js/style.js"></script>	
<!-- for popup message end-->

	
</head>

<body onload="startTimer();">
<center>
<img alt="" src="<%=request.getContextPath() %>/title.png">
</center>
		 <form action="<%=request.getContextPath()%>/AdminLogin" method="post">	
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">Admin Id</label>
			<br/>
			<input type="text" id="username" name="username">
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password">
			<br/>
			<button type="submit">Sign In</button>
			
		</div>
		
		</form>
	</div>
	<div align="right">
	<a href="<%=request.getContextPath()%>/visitorpage1.jsp" style="color: blue;">Goto Visitor Page</a>
	</div>
	
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>
<%

String k=null;
k=request.getParameter("no");
 int no=0;
 if(k!=null)
 {
	 no=Integer.parseInt(k); 
 }



%>
 
 <%
if(no==1)
{
%>
<div style="position: absolute;top: 150px;">
<div class="error" id="message" >	
	<p> Invalid User ID/Password.....!</p>
</div>
</div>
<%}else if(no==6)
{
%>
<div style="position: absolute;top: 150px;">
<div class="success" id="message" >	
	<p> Logged Out Successfully.....!</p>
</div>
</div>

<%} else
{%>


<%} %>


</html>