<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account</title>
<style type="text/css">
	.button {
  border: none;
  color: white;
  padding: 5px;
  padding-left: 10px;
  padding-right:10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {
	border-radius: 2px;
	background-color: #669999;	
}

.button2 {
	border-radius: 2px; 
	background-color: #666699;
}

.button3 {
	border-radius: 2px;   
	background-color: #ff9933;
}


</style>



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
		
		<tr style="background-color: aqua;">
			<th colspan="4">
				<a href = "StoreList.jsp" class = "button button1">Goto Shopping</a>
			
			</th>
			<th colspan="4" style="padding-right: 20px; text-align: right;padding-right: 6% width: 50%;">
			
				<%@page import="java.sql.*,dbconnection.*" %>
				<%
					Connection cn = Dbconnect.getCn();
				
					session =request.getSession(false);
					String userid = (String)session.getAttribute("userid");
					String password =(String)session.getAttribute("password");
					String sql1 = "select first_name,last_name from user_table where userid=?";
					PreparedStatement pr1 = cn.prepareStatement(sql1);
					pr1.setString(1,userid);
					
					ResultSet rs1 = pr1.executeQuery();
					String name;
					if(rs1.next())
					{
						name = "Welcome &nbsp;&nbsp;&nbsp;" +rs1.getString(1)+" "+rs1.getString(2)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ";
				%>
					<font color="#ff6666"><%=name%></font>
				<%}%>
				<a href="Logout.jsp">Logout</a>
				
			</th>
		</tr>
		<tr style="height: 400px;">
			<th colspan="8" style="background-color:; background-size: 100%;">
				<table style=" height: 400px;width:100%;" >
					<tr height="20px">
						<th>
							<a href ="mycart.jsp" class ="button button1" target="ifrm1">My Cart</a>
						</th>
						<th>
							<a href ="mypurchase.jsp" class ="button button1" target="ifrm2">My Purchase</a>
						</th>
					</tr>
					<tr>
						<th>
							<iframe name = 'ifrm1' id = 'ifrm1' scrollable="auto" frameBorder="0" height="100%" width="100%">
								
							</iframe>
						</th>
						<th>
							<iframe name = 'ifrm2' id = 'ifrm2' scrollable="auto" frameBorder="0" height="100%" width="100%">
								
							</iframe>
						</th>
					</tr>
				</table>
			</th>
		</tr>
	</table>

</body>
</html>