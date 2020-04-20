package movie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {
	
	//static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//static String url = "jdbc:mysql://localhost:3306/dbweb";
	static String url = "jdbc:mysql://localhost:3306/basicjsp";
	static String user = "jspid";
	static String password = "jsppass";
	static Connection conn = null;
	static Statement stmt = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	// JDBC DRIVER INIT
	static {
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// CONNECTION
	protected static Connection getConnect() {
		
	  Connection tempConn = null;
	  if(conn==null) {
	    try {
			tempConn = DriverManager.getConnection(url, user, password);
			System.out.println("DB CONN SUCCESS");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  }
	  return tempConn;
	}
	
	// DB CLOSE()
	protected static void DBClose() {
		if(conn!=null) {try{conn.close(); conn=null;} 
			catch (SQLException e) {e.printStackTrace();}
		}
		if(stmt!=null) {try{stmt.close(); stmt=null;} 
			catch (SQLException e) {e.printStackTrace();}
		}
		if(pstmt!=null) {try{pstmt.close(); pstmt=null;} 
		catch (SQLException e) {e.printStackTrace();}
		}
		if(rs!=null) {try{rs.close(); rs=null;} 
		catch (SQLException e) {e.printStackTrace();}
		}
				
	}

}
