package kr.kro.task.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.kro.task.connect.Connect;

public class LoginDAO implements ILoginDAO {

	private static LoginDAO dao = new LoginDAO();

	public static LoginDAO getInstance() {
		if (dao == null) {
			dao = new LoginDAO();
		}
		return dao;
	}

	@Override
	public boolean userCheck(String id, String pw) {
		boolean check = false;
		String sql = "SELECT * FROM user WHERE u_id=?";
		Connect connect = new Connect();
		String url = connect.getUrl();
		String uId = connect.getuId();
		String uPw = connect.getuPw();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, uId, uPw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //아이디가 존재.
				String dbPw = rs.getString("u_pw"); // 데이터 베이스 내부에 있는 비밀번호 얻어오기.
				if(dbPw.equals(pw)) check = true; // 로그인 성공
				else check = false; // 비밀번호가 다른 경우.
			} else { // 아이디가 존재하지 않음.
				check = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
}
