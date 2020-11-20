package kr.kro.task.deltask;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.kro.task.connect.Connect;

public class DelTaskDAO implements IDelTaskDAO{

	private static DelTaskDAO dao = new DelTaskDAO();
	public static DelTaskDAO getInstance() {
		if(dao == null) {
			dao = new DelTaskDAO();
		}
		return dao;
	}
	
	@Override
	public boolean deleteCheck(int wrnum, String classid) {
		boolean check = false;
		String sql = "SELECT t_classid FROM task WHERE t_wrnum=?";
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
			pstmt.setInt(1, wrnum);
			rs = pstmt.executeQuery();
			if(rs.getString("t_classid").equals("classid")) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	@Override
	public void deleteTask(int wrnum) {
		String sql = "DELETE FROM task WHERE t_wrnum=?";
		Connect connect = new Connect();
		String url = connect.getUrl();
		String uId = connect.getuId();
		String uPw = connect.getuPw();

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, uId, uPw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wrnum);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
