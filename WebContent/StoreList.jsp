<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StoreList</title>

<style type="text/css">
	.button {
  background-color: #b3b3cc;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {border-radius: 12px;}



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
		<tr>
			<th colspan="4">
				<a href = "MyAccount.jsp" class = "button button1">My Account</a>
			
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
		<tr height="300px">
			<th colspan="8" style="background-image: url('shopping3.jpg'); background-size:80%" >
				
					<form action="">
						<table align="center" style="align-self: center;">
							<tr>
							
							<th><a href="ShoppingList.jsp?store_type=all" class="button button1">All Product</a></th>
							<%
								String sql2 = "select store_type from store_table group by store_type";
								PreparedStatement pr = cn.prepareStatement(sql2);
								ResultSet rs = pr.executeQuery();
								while(rs.next()){ %>
								
										
									<th><a href="ShoppingList.jsp?store_type=<%=rs.getString(1)%>" class="button button1"><%=rs.getString(1) %></a></th>
							<%} %>
							</tr>
						 </table>
					</form>
			</th>
		</tr>
	</table>
		

</body>
</html>