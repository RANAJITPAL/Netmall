package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.Dbconnect;

public class Get_productId {
	 public String new_productId()
	 {
		 String productId=null;
		 try {
			 	int count =0;
			 	
				Connection cn = Dbconnect.getCn();
				String sql = "select count(*) from product_table";
				PreparedStatement pr = cn.prepareStatement(sql);
				ResultSet rs = pr.executeQuery();
				if(rs.next())
				{
					count = Integer.parseInt(rs.getString(1))+1;
				}
				
				productId = "PID"+String.format("%03d",count);
				
				return productId;
				
		} catch (Exception e) {
			System.out.println(e);
		}
		 return productId;
	 }
}
