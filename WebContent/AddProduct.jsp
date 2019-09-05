<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<%@page import="java.sql.*,dbconnection.*" %>
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
		<tr bgcolor="#e0ebeb">
			<th colspan="4">
				<a href="AddStore.jsp">Add Store</a>
			
			</th>
			<th colspan="4" style="padding-right: 20px; text-align: right;padding-right: 6% width: 50%;">
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
			<th colspan="8" style="background-image: url('addstore.jpeg');background-repeat: no-repeat; background-position: center;background-size:cover;">
				<table>
					<tr>
						<th>
							<form action="AddProduct" enctype="multipart/form-data" method="post">
								<table style="align-self: baseline;">
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">Name of The Store</font>
										</th>
										<th>
											<input type="text" name="store_name">
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">StoreId</font>
										</th>
										<th>
											<input type="text" name="store_id">
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">Product Name</font>
										</th>
										<th>
											<input type= "text" name="product_name">
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">Product Price</font>
										</th>
										<th>
											<input type= "text" name="product_price">
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">Discount Persentage</font>
										</th>
										<th>
											<input type= "text" name="product_dis">
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">Product Image</font>
										</th>
										<th>
											<input type= "file" name="product_img">
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">Product Quantity</font>
										</th>
										<th>
											<input type= "text" name="product_qty">
										</th>
									</tr>
									<tr>
										<th colspan="2">
											<input type="submit" value="Add Product">
										</th>
									</tr>
								</table>
							</form>
							<table>
								<tr>
									<th>
										<div id = "s"></div>
									</th>
								</tr>
							</table>
						</th>
					</tr>
				</table>
			
			</th>
		</tr>
		
	</table>
</body>
</html>