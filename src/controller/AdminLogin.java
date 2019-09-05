package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.Dbconnect;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try
		{
			String admin_user_id = request.getParameter("userid");
			String admin_password = request.getParameter("password");
			
			PrintWriter out = response.getWriter();
			
			Connection cn = Dbconnect.getCn();
			String sql = "select password from admin_table where userid =?";
			PreparedStatement pr = cn.prepareStatement(sql);
			pr.setString(1, admin_user_id);
			
			ResultSet rs = pr.executeQuery();
			
			//System.out.println("id ="+admin_user_id+"  pass="+admin_password);
			
			if(rs.next())
			{
				if(rs.getString(1).equals(admin_password))
				{
					out.println("<font color ='yellow'>Successfully login as admin <a href='AddStore.jsp'>ADD STORE</a> or <a href='AddProduct.jsp'>ADD PRODUCT</a></font>");
				}
				else
				{
					out.println("<font color ='yellow'>Enter Write Password</font>");
				}
			}
			else
			{
				out.println("<font color ='yellow'>Enter write Admin user id</font>");
			}
			
			
		}catch(Exception e)
		{
			
		}
		
	}
}
