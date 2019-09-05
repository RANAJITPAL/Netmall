<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%@page import="java.sql.*,dbconnection.*;"%>
	<%
		try{
			
			Connection cn = Dbconnect.getCn();
			
			session =request.getSession(false);
			String userid = (String)session.getAttribute("userid");
			
			String sql = "select * from cart_table natural join product_table natural join store_table natural join product_store_table where userid= ?";
			PreparedStatement pr = cn.prepareStatement(sql);
			pr.setString(1, userid);
			
			ResultSet rs= pr.executeQuery();
			while(rs.next())
			{
	%>
		<table  class="table">
						<tr style="align-items: center;">
							<th colspan="2" style="align-items: center; padding-left: 0px;">
								<img class ="img" src = "<%= rs.getString(5)%>" width="50px" height="50px">
							</th>
						</tr>
						<tr>
							<th colspan="2">
								<font style="align-content: center;"><%=rs.getString(4)%></font>
							</th>
						</tr>
						<tr>
							<th>
								<font style="text-decoration:none;">Actual Price</font>
							</th>
							<th>
								<font style="text-decoration: line-through;"><%=rs.getString(6)%></font>
							</th>
						</tr>
						<tr>
							<th>
								<font style="align-content: center;">Current Price</font>
							</th>
							<th>
								<%
									int price = Integer.parseInt(rs.getString(6));
									int discount_percentage = Integer.parseInt(rs.getString(8));
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
								<font style="align-content: center;"><%=rs.getString(8)%>%</font>
							</th>
						</tr>
						<tr>
							<th>
								<font style="align-content: center;">Date</font>
							</th>
							<th>
								<font style="align-content: center;"><%=rs.getString(3)%>%</font>
							</th>
						</tr>
					</table>
	
	<%} %>
	<%}catch(Exception e)
		{
			out.println(e);
	
		}%>
		
	

</body>
</html>