package pkg.qd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	protected Connection connOri;
	
	public DBConn() {
		mtdDBConn();
	}
	
	public void mtdDBConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/community?";
			url += "useSSL=false&";
			url += "useUnicode=true&";
			url += "characterEncoding=UTF8&";
			url += "serverTimezone=Asia/Seoul&";
			url += "allowPublicKeyRetrieval=true";
			String uid = "root";
			String upw = "1234";
			connOri = DriverManager.getConnection(url, uid, upw);
			
			
		} catch(ClassNotFoundException e) {
			System.out.println("CNFE : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQLE : " + e.getMessage());
		}
	}

}
