<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping List</title>
<style type="text/css">
	.img {
  display: table-cell;
  max-width:100px;
  max-height:100px;
  width: auto;
  height: auto;
  padding-left: 70px;
}

	.table
	{
		float: left;
		height: 150px;
		width: 25%;
		padding-left: 15px;
		padding-right: 15px;
		
	}
	
	.button {
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

.button1 {
	border-radius: 12px;
	background-color: #ff9933;	
}

.scrollit {
    overflow:scroll;
    height:100px;
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
		<tr>
			<th colspan="4">
				<a href = StoreList.jsp>GoTo Store</a>
			
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
				<a href = #>My Account</a>
				<a href="Logout.jsp">Logout</a>
				
			</th>
		</tr>
		
	<tr>	
		<th style="height: 400px" colspan="8">
		<table>
			 <tbody style='height:400px;display:block;overflow:scroll;width: 100%'>
			 	<tr>
			 		<th>
				<%@page import="java.sql.*,dbconnection.*" %>
				<%
					String store_type = request.getParameter("store_type");
				
					
					String sql;
					ResultSet rs = null;
					PreparedStatement pr = null;
					if(store_type.equals("all"))
					{
						sql ="select name,img_path,price,discount,store_id,pid from product_table natural join product_store_table natural join store_table";
						pr = cn.prepareStatement(sql);
						rs = pr.executeQuery();
					}
					else
					{
						sql = "select name,img_path,price,discount,store_id,pid from product_table natural join product_store_table natural join store_table where store_type =?";
						pr = cn.prepareStatement(sql);
						pr.setString(1, store_type);
						rs = pr.executeQuery();
					}
					
					while(rs.next()){
				%>
					<table  class="table">
						<tr style="align-items: center;">
							<th colspan="2" style="align-items: center; padding-left: 0px;">
								<img class ="img" src = "<%= rs.getString(2)%>" width="50px" height="50px">
							</th>
						</tr>
						<tr>
							<th colspan="2">
								<font style="align-content: center;"><%=rs.getString(1)%></font>
							</th>
						</tr>
						<tr>
							<th>
								<font style="text-decoration:none;">Actual Price</font>
							</th>
							<th>
								<font style="text-decoration: line-through;"><%=rs.getString(3)%></font>
							</th>
						</tr>
						<tr>
							<th>
								<font style="align-content: center;">Current Price</font>
							</th>
							<th>
								<%
									int price = Integer.parseInt(rs.getString(3));
									int discount_percentage = Integer.parseInt(rs.getString(4));
									int current_price = price*(100-discount_percentage)/100;
								%>
								<font><%=current_price %></font>
							</th>
						</tr>
						<tr>
							<th>
								<font style="align-content: center;">Discount</font>
							</th>
							<th>
								<font style="align-content: center;"><%=rs.getString(4)%>%</font>
							</th>
						</tr>
						<tr>
							<th style="align-items: center;" width="50%">
								<form action="Addtocart.jsp?pid=<%=rs.getString(6)%>&store_id=<%=rs.getString(5)%>" method="post">
									<input type="submit" value="Add to catr" class="button button1">
								</form>
							</th>
							
							<th style="align-items: center;" width="50%">
								<a href="BuyNow.jsp?pid=<%=rs.getString(6)%>&store_id=<%=rs.getString(5)%>" class = "button button1">Buy Now</a>
							</th>
						</tr>
					</table>
				<%} %>
				</th>
				</tr>
				</tbody>
			</table>	
			</th>
		</tr>
	</table>
</body>
</html>