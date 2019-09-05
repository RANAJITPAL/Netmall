package dbconnection;


import java.sql.*;

public class Dbconnect {
	
	static Connection cn = null;
	static String driver = "oracle.jdbc.driver.OracleDriver";
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static String user = "system";
	static String password ="1234";
	
	public static Connection getCn()
	{
		try {
			Class.forName(driver);
			cn = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cn; 
	}

}
