package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.Dbconnect;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			PrintWriter out = response.getWriter();
			
			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			//String password = "jagjadg";
			
			//System.out.println("userId="+userid);
			
			Connection cn = Dbconnect.getCn();
			String sql = "select password from user_table where userid =?";
			PreparedStatement pr = cn.prepareStatement(sql);
			pr.setString(1, userid);
			ResultSet rs = pr.executeQuery();
			if(rs.next())
			{
				if(password.equals(rs.getString(1)))
				{
					HttpSession usid = request.getSession();
					HttpSession pass = request.getSession();
					
					usid.setAttribute("userid", userid);
					pass.setAttribute("password", password);
					
					//RequestDispatcher rd=request.getRequestDispatcher("StoreList.jsp");
					//rd.forward(request, response);
					
					 //response.sendRedirect("StoreList.jsp");
					// response.sendRedirect("StoreList.jsp");
					//HttpServletResponse.sendRedirect("StoreList.jsp");
					// request.getRequestDispatcher("StoreList.jsp").include(request, response);
					
					//System.out.println(userid+"  "+password);
					
					out.println("<font color='red'> Login Successful</font><a href='StoreList.jsp' class='button button1'>Start Shoping</a>");
				}
				else
				{
					out.println("<font color='red'> Wrong Password...Try Again</font>");
				}
			}
			else
			{
				out.println("<font color='red'>Incorrect UserId...</font>");
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println(e);
		}
	}

}
