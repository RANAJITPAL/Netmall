<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
	<table border="2" style="width: 90%;" align="center">
		<tr style="height: 100px; width: 100%">
			<th colspan="3" style="width: 30%">
				<img  src="netmal_logo.png" style="height: 100px;width: 100%">
			</th>
			<th colspan="5" style="width: 70%;background-color:  #df9f9f;">
				<font style="color: lime; font-size: 70px; font-style: italic;font-weight: bold;">NetMall</font>
				<br>
				<font style="color: yellow; font-size: 25px; font-style: italic;font-weight:normal; ;">Everythig Under a roof</font>
			</th>
		</tr>
		<tr style="height: 390px;">
			<th colspan="8" style="background-image: url('logout.jpg'); background-size: 80%; padding-bottom: 205px;">
				<%
					session =request.getSession(false);
					session.invalidate();
				%>
				
				<font style="font-style: italic;font-weight: bold;font-size:x-large;">Successfully Logout...To LogIn&nbsp;&nbsp;&nbsp;<a href="login.html">Click Here</a></font>
			</th>
		
		</tr>
		
		
	</table>
	
	
	
</body>
</html>