package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.Dbconnect;


public class Get_userId {
	
	 public String new_userId()
	 {
		 String userId=null;
		 try {
			 	int count =0;
			 	
				Connection cn = Dbconnect.getCn();
				String sql = "select count(*) from user_table";
				PreparedStatement pr = cn.prepareStatement(sql);
				ResultSet rs = pr.executeQuery();
				if(rs.next())
				{
					count = Integer.parseInt(rs.getString(1))+1;
				}
				
				userId = "us"+String.format("%04d",count);
				
				return userId;
				
		} catch (Exception e) {
			System.out.println(e);
		}
		 return userId;
	 }

}
