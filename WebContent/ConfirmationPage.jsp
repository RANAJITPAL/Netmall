<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmed</title>
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
			<th colspan="8" style="background-image: url('#'); background-size:100% ; align-items: center; padding-left: 1%;background-color: #99ccff">
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
				
				//out.println("count="+count);
				
				String sql3 = "update product_table set count = ? where pid = ?";
				PreparedStatement pr3 = cn.prepareStatement(sql3);
				count--;
				
				String c = count+"";
				pr3.setString(1,c);
				pr3.setString(2, pid);
				
				pr3.execute();
				}
				
				
				String sql5= "SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY') as x FROM dual";
				PreparedStatement pr5 = cn.prepareStatement(sql5);
				ResultSet rs5 = pr5.executeQuery();
				String day = null;
				
				if(rs5.next())
				{
					day = rs5.getString(1);
				}
				
				String sql4 ="insert into purchase_table values(?,?,?)";
				PreparedStatement pr4 = cn.prepareStatement(sql4);
						//out.println("userid="+userid);
						//out.println("pid="+pid);
				pr4.setString(1, userid);
				pr4.setString(2, pid);
				pr4.setString(3, day);
				pr4.execute();
				}catch(Exception e){}%>
				
				<font style="font-size: 40px; font-weight: bold;font-style: italic;"><p>Thank You for Shopping....<br></p>
					<p>Your Order delivared shortly</p>
				</font>
				<a href="StoreList.jsp" class ="button button1">Continue Shoping</a>
				
			</th>

</body>
</html>
				