<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Now</title>
<script type="text/javascript">


</script>

<style type="text/css">

.button {
	  background-color: #ff9933;
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
	
	.table
	{
		float: left;
		height:200px;
		width: 100px;
		border-collapse: collapse;
 		 border: 3px solid #b3b3cc;
		align-self: center;
	}

	.img {
		  display: table-cell;
		  max-width:100%;
		  max-height:300px;
		  width: auto;
		  height: auto;



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
				<a href = #>My Account</a>
			
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
			<th colspan="8" style="background-image: url('shopping5.jpg'); background-size:100% ; align-items: center; padding-left: 32%">
			<%
				try{
				
				String pid = request.getParameter("pid");
				String store_id = request.getParameter("store_id");
				
				String sql2 = "select * from product_table where pid =?";
				PreparedStatement pr2 = cn.prepareStatement(sql2);
				pr2.setString(1,pid);
				
				ResultSet rs2 = pr2.executeQuery();
				if(rs2.next()){
				int count = Integer.parseInt(rs2.getString(5));
				if(count ==0){
				%>
				<font>Product is out of stock</font>
				
				<%}else{ 
					
				
				%>
				<table class="table">
					<tr>
						<th rowspan="2" width="50%">
							<img alt="" src="<%=rs2.getString(3)%>" class = "img">
						</th>
						<th colspan="2" width="50%">
							<font style="color:  #ffff00; size: 20px; text-decoration: underline;">Order Details</font>
						</th>
					</tr>

					<tr>
						<th>
							<%
							int price = Integer.parseInt(rs2.getString(4));
							int discount_percentage = Integer.parseInt(rs2.getString(6));
							int current_price = price*(100-discount_percentage)/100;
							%>
							
							<font style="color:  #ffff00; size: 20px">Total Price</font>
						</th>
						<th>
							<%=current_price%>
						</th>
					</tr>
					<tr>
						<th colspan="3">
							<font style="color:  #ffff00; size: 20px"><%=rs2.getString(2) %></font>
						</th>
					</tr>
					<tr>
						<th colspan="3">
							 <a href="ConfirmationPage.jsp?pid=<%=pid %>&store_id=<%=store_id %>" class="button button1">Confirm order</a>
						</th>
					</tr>
				</table>	
				<%} %>
				
				<%} %>
			<%}catch(Exception e){}%>
				
			
			</th>
		</tr>	
	</table>
	

</body>
</html>