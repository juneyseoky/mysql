package pkg.qd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class MemberList {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public void mtdMemList() {
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
			String sql = "select seq, name, memID, tel, regTM regTM ";
					sql += "from memberList order by seq desc";
			rs = stmt.executeQuery(sql);
			System.out.println("번호  이름  회원ID  연락처  가입날짜");
			System.out.println("------------------------------------");
			while (rs.next()) {
				
				Timestamp regTM = rs.getTimestamp("regTM");
				String regTime = regTM.toString();
				String res = "";
				res += rs.getInt("seq") + "  ";
				res += rs.getString("name") + "  ";
				res += rs.getString("memID") + "\t  ";
				res += rs.getString("tel") + "  ";
				res += regTime.substring(0, 10);
				System.out.println(res);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("CNFE : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQLE : " + e.getMessage());
		}
	}

}
