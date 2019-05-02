<!DOCTYPE html>
<%@page import="com.dao.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.AdminDAO"%>
<html>
	<head>
		<title>Secure Home System</title>
		<meta charset="utf-8">
		<style type="text/css">
			@font-face {
			    font-family: 'RieslingRegular';
			    src: url('fonts/riesling-webfont.eot');
			    src: url('fonts/riesling-webfont.eot?#iefix') format('embedded-opentype'),
			         url('fonts/riesling-webfont.woff') format('woff'),
			         url('fonts/riesling-webfont.ttf') format('truetype'),
			         url('fonts/riesling-webfont.svg#RieslingRegular') format('svg');
			    font-weight: normal;
			    font-style: normal;
			}
			html {
				background: url('images/lightpaperfibers.png');
			}
			h1 {
				font: 35pt "RieslingRegular", Tahoma, Arial, sans-serif;
			}
			.wrapper {
				margin: 10px auto;
				height: 276px;
				width: 575px;
				text-align: center;
			}
			img {
				border-width: 30px;

				border-image:url("images/frame.png") 30 repeat;
				-o-border-image:url("images/frame.png") 30 repeat;
				-moz-border-image:url("images/frame.png") 30 repeat;
				-webkit-border-image:url("images/frame.png") 30 repeat;

		        box-shadow:  0px 2px 3px 0px rgba(0, 0, 0, .5);
				-webkit-box-shadow:  0px 2px 3px 0px rgba(0, 0, 0, .5);
			}
		</style>
		
		
		<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>

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

<%
	String collapseKey = "GCM_Message";
    String message = "NewRequest";

    Object collapseKeyObj =  request.getAttribute("CollapseKey");
    
    if (collapseKeyObj != null) {
    	collapseKey = collapseKeyObj.toString();
    }
    
    Object msgObj =  request.getAttribute("Message");
    
    if (msgObj != null) {
    	message = msgObj.toString();
    }
        
%>


<script type="text/javascript">
    window.onload=function(){
        var auto = setTimeout(function(){ autoRefresh(); }, 100);

        function submitform(){
          
          document.forms["myForm"].submit();
        }

        function autoRefresh(){
           clearTimeout(auto);
           auto = setTimeout(function(){ submitform(); autoRefresh(); }, 10000);
        }
    }
</script>


		
	<%
	
	ResultSet rs = UserDAO.getMemberStatus();
	
	String allowstatus="false";
int k=1;
%>	
	</head>
	<body>
	
	<form name="myForm" id="myForm"  action="<%=request.getContextPath() %>/GCMBroadcast" method="post">
	
<div class="wrapper">
	<h1>Secure Home System</h1>
	<img src="visitor_Face.jpg" width="150px;" height="150px;">
	  <a href="<%=request.getContextPath()%>/visitorpage1.jsp" class="button">Try Again</a>
  <a href="<%=request.getContextPath()%>/" class="button">Cancel</a>
</div>
<div style="position: absolute;top: 170px;width: 450px;height: 200px;" >
<table>
  <tr>
    <th>Name</th>
    <th>RelationShip</th>
    <th>Request Status</th>
  </tr>
  <%while(rs.next()) 
  {%>
  <tr>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    
  </tr>
  <%
  allowstatus=rs.getString(5);
  
  } %>
  </table>
  
  <%if(allowstatus.equals("True"))
	  {%>
	   <img src="<%=request.getContextPath() %>/images/go.png" width="100px;" height="100px;">
	  <%}else
		  {%>
		   <img src="<%=request.getContextPath() %>/images/stop.gif" width="100px;" height="100px;">
		  <%} %>

  </div>
  
  <input type="hidden" name="CollapseKey" value="<%=collapseKey %>" />
   <input type="hidden" name="Message" value="<%=message %>" />
		
  
</form>
</body>
</html>