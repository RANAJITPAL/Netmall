package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dbconnection.Dbconnect;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
@MultipartConfig(fileSizeThreshold = 1024*1,maxFileSize= 1024*1024*20,maxRequestSize=1024*1024*50)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR="NetMAll_product_img";
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String store_id = request.getParameter("store_id");
			String store_name = request.getParameter("store_name");
			String product_name = request.getParameter("product_name");
			String product_price = request.getParameter("product_price");
			String product_qty = request.getParameter("product_qty");
			Part product_img = request.getPart("product_img");
			String product_dis = request.getParameter("product_dis"); 
			
			
			Get_productId get_productid = new Get_productId();
			String pid = get_productid.new_productId();
			
			PrintWriter out = response.getWriter();
			
			Connection cn = Dbconnect.getCn();
			String sql1 = "select store_name from store_table where store_id = ?";
			PreparedStatement pr1 = cn.prepareStatement(sql1);
			pr1.setString(1, store_id);
			
			ResultSet rs1 = pr1.executeQuery();
			
			//if(rs1.next()&&(store_name.equals(rs1.getString(1))))
			//{
				String imgPath = "F:"+File.separator+SAVE_DIR;
				File directory = new File(imgPath);
				if(!directory.exists())
				{
					directory.mkdir();	
				}
				
				String path = extractPath(product_img);
				String fileName=path.substring(path.lastIndexOf("\\")+1,path.length());
				String fimg=imgPath+File.separator+fileName;
				//System.out.println(fimg);
				
				product_img.write(fimg);
				
				String sql2 = "insert into product_table values(?,?,?,?,?,?)";
				PreparedStatement pr2 = cn.prepareStatement(sql2);
				pr2.setString(1,pid);
				pr2.setString(2,product_name);
				pr2.setString(3,fimg);
				pr2.setString(4, product_price);
				pr2.setString(5, product_qty);
				pr2.setString(6, product_dis);
				
				pr2.execute();
				//System.out.println("pr2");
				
				String sql3 = "insert into product_store_table values(?,?)";
				PreparedStatement pr3 = cn.prepareStatement(sql3);
				pr3.setString(1, pid);
				pr3.setString(2, store_id);
				pr3.execute();
				//System.out.println("pr3");
				
				 response.sendRedirect("AddProduct.jsp");
			//}
			/*else
			{
				out.println("Enter Right Store Name and Store ID");
			}*/
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	private String extractPath(Part part){
		String content_dis=part.getHeader("Content-Disposition");
		String item[]=content_dis.split(";");
		for(String s:item){
			if(s.trim().startsWith("filename")){
				return s.substring(s.indexOf("=")+2,s.length()-1);
			}
		}
		return null;
	}

}
