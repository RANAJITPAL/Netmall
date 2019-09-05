package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.Dbconnect;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			Connection cn = Dbconnect.getCn();
			PrintWriter out = response.getWriter();
			
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String addr = request.getParameter("addr");
			String pin = request.getParameter("pin");
			String phone = request.getParameter("phone");
			String mail = request.getParameter("mail");
			String password = request.getParameter("password");
			
			
			System.out.println("fname ="+fname);
			
			Get_userId get_userid = new Get_userId();
			String userid = get_userid.new_userId();
			System.out.println("userid ="+userid);
			
			String sql="insert into user_table values(?,?,?,?,?,?,?,?,null)"; 
			PreparedStatement pr = cn.prepareStatement(sql);
			
			pr.setString(1, userid);
			pr.setString(2, password);
			pr.setString(3, fname);
			pr.setString(4, lname);
			pr.setString(5, addr);
			pr.setString(6, pin);
			pr.setString(7, phone);
			pr.setString(8, mail);
			
			pr.execute();
			
			out.println("<font color ='green'>Signup SUCCESSFUL...Your USERID is <font color='blue'>"+userid+"</font></font>");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

}
