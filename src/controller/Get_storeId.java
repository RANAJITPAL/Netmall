package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.Dbconnect;

public class Get_storeId {
	
	 public String new_storeId()
	 {
		 String storeId=null;
		 try {
			 	int count =0;
			 	
				Connection cn = Dbconnect.getCn();
				String sql = "select count(*) from store_table";
				PreparedStatement pr = cn.prepareStatement(sql);
				ResultSet rs = pr.executeQuery();
				if(rs.next())
				{
					count = Integer.parseInt(rs.getString(1))+1;
				}
				
				storeId = "SID"+String.format("%03d",count);
				
				return storeId;
				
		} catch (Exception e) {
			System.out.println(e);
		}
		 return storeId;
	 }

}
