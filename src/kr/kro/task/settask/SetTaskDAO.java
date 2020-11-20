package kr.kro.task.settask;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.kro.task.connect.Connect;

public class SetTaskDAO implements ISetTaskDAO {

	private static SetTaskDAO dao = new SetTaskDAO();

	public static SetTaskDAO getInstance() {
		if (dao == null) {
			dao = new SetTaskDAO();
		}
		return dao;
	}

	@Override
	public boolean setTask(String day, String classid, String title, String content) {
		boolean setCheck = false;
		String sql = "INSERT INTO task (t_day, t_classid, t_title, t_content) VALUES (?, ?, ?, ?)";
		System.out.println(day + classid + title + content);
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
			pstmt.setString(1, day);
			pstmt.setString(2, classid);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			if (pstmt.executeUpdate() == 1)
				setCheck = true;
			else
				setCheck = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return setCheck;
	}
}
