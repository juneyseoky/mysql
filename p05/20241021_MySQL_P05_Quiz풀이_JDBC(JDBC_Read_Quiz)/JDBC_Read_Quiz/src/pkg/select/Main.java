package pkg.select;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;

public class Main {

	public static void main(String[] args) {
		
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		DecimalFormat df = new DecimalFormat("#,###");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/p01_quiz_store?";
			url+="useSSL=false&";
			url+="useUnicode=true&";
			url+="characterEncoding=UTF8&";
			url+="serverTimezone=Asia/Seoul&";
			url+="allowPublicKeyRetrieval=true";
			String uid = "root";
			String upw = "1234";
			conn = DriverManager.getConnection(url, uid, upw);
			
			stmt = conn.createStatement();
			String sql = "select * from orderList order by num desc";
			rs = stmt.executeQuery(sql);
			
			System.out.println("번호  주문상품  주문금액  주문수");
			System.out.println("-------------------------------------");
						
			while (rs.next()) {
				String res = ""; 
				res += rs.getInt("num") + "\t";
				res += rs.getString("item") + "\t";
				res += df.format(rs.getInt("price")) + "\t    ";
				res += rs.getInt("cnt");
				System.out.println(res);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("CNFE : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQLE : " + e.getMessage());
		}

	}

}
