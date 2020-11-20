package kr.kro.task.getclass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.kro.task.connect.Connect;

public class GetClassDAO implements IGetClassDAO {
	
	private static GetClassDAO dao = new GetClassDAO();
	public static GetClassDAO getInstance() {
		if(dao == null) {
			dao = new GetClassDAO();
		}
		return dao;
	}
	
	@Override
	public List<String> getClass(int classid) {
		List<String> classIdList = new ArrayList<String>();
		String sql = "SELECT u_classid FROM user ORDER BY u_classid";
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

			rs = pstmt.executeQuery();
			while (rs.next()) {
				classIdList.add(rs.getString("u_classid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classIdList;
	}
	
	@Override
	public String getMyClass(String id) {
		String classid = null;
		String sql = "SELECT u_classid FROM user WHERE u_id=?";
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
			while (rs.next()) {
				classid = rs.getString("u_classid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classid;
	}
}
