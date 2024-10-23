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
	
//	다형성을 위한 오버라이딩 DBConn을 상속한 클래스의
//	메소드명이 같으면 메인에서의 객체생성에 따라
//	해당 메서드를 호출하기 위해 만듬
	
	public void mtdMemList() {}

}
