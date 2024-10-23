package pkg.qd;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DecimalFormat;

public class ClubFeeList extends DBConn{


	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public void mtdMemList() {
	
		DecimalFormat df = new DecimalFormat("#,###");
	
		try {
			conn = super.connOri;
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
		} catch (SQLException e) {
			System.out.println("SQLE : " + e.getMessage());
		}
	}
}
