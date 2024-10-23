package pkg.qd;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class MemberList extends DBConn{

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	// ClubFeeList의 mtdMemList 메서드명과 같음
	public void mtdMemList() {
		try {
			
			conn = super.connOri;
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
		} catch (SQLException e) {
			System.out.println("SQLE : " + e.getMessage());
		}
	}

}
