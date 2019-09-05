<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Store</title>
<style type="text/css">
.table {
  border-collapse: collapse;
  border: 3px solid pink;
}


</style>

</head>
<body>
	<%@page import="java.sql.*,dbconnection.*,controller.*" %>
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
				<a href="AddProduct.jsp">Add Product</a>
			
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
				<table style="background-color: #e0e0eb;" class="table">
					<tr>
						<th>
							<form action="">
								<table>
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
											<font style="color:  #e69900; size: 20px">Store Type</font>
										</th>
										<th>
											<select name="store_type">
												<%
													String sql2 = "select store_type from store_table group by store_type";
													PreparedStatement pr = cn.prepareStatement(sql2);
													ResultSet rs = pr.executeQuery();
													while(rs.next())
													{
												%>
												<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
												<%} %>
												<option value="others">Others</option>
											</select>
										</th>
									</tr>
									<tr>
										<th>
											<font style="color:  #e69900; size: 20px">If Others enter Store Type</font>
										</th>
										<th>
											<input type="text" name="other_store">
										</th>
									</tr>
									<tr>
										<th colspan="2">
											<input type="submit" value="Add store">
										</th>
									</tr>
								</table>
							</form>
							<%
								try{
									
									String store_name = request.getParameter("store_name");
									String store_type = request.getParameter("store_type");
									
									
									Get_storeId get_storeid = new Get_storeId();
									String store_id = get_storeid.new_storeId();
									
									if(store_type.equals("others"))
									{
										store_type = request.getParameter("other_store");
									}
									
									//out.println("store_id="+store_id+"store_name="+store_name+"store_type = "+store_type);									
									String sql3 = "insert into store_table values(?,?,?,null,null)";
									PreparedStatement pr3 = cn.prepareStatement(sql3);
									pr3.setString(1,store_id);
									pr3.setString(2,store_name);
									pr3.setString(3,store_type);
									
									pr3.execute();
									
									out.println("Your StoreId is:"+store_id);
									%>
									
									
											
								<% }catch(Exception e){}%>
						</th>
					</tr>
				</table>
			</th>
		</tr>
	</table>

</body>
</html>