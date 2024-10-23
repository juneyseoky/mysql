package pkg.qd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DecimalFormat;

public class ClubFeeList {


	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public void mtdMemList() {
	
		DecimalFormat df = new DecimalFormat("#,###");
	
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
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			String sql = "select seq, name, memID, money, payTM from clubFeeView";
			rs = stmt.executeQuery(sql);
			System.out.println("번호  이름  회원ID  회비  납부일");
			System.out.println("------------------------------------");
			while (rs.next()) {
				
				Timestamp payTM = rs.getTimestamp("payTM");
				String payTime = payTM.toString();
				String res = "";
				res += rs.getInt("seq") + "  ";
				res += rs.getString("name") + "  ";
				res += rs.getString("memID") + "\t  ";
				res += df.format(rs.getInt("money")) + "  ";
				res += payTime.substring(0, 10);
				System.out.println(res);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("CNFE : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQLE : " + e.getMessage());
		}
	}
}
