package kr.kro.task.gettask;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import kr.kro.task.connect.Connect;

public class GetTaskDAO implements IGetTaskDAO {

	private static GetTaskDAO dao = new GetTaskDAO();
	public static GetTaskDAO getInstance() {
		if(dao == null) {
			dao = new GetTaskDAO();
		}
		return dao;
	}
	
	@Override
	public List<Date> getDate(String classid) {
		Set<Date> taskSet = new HashSet<Date>();
		String sql = "SELECT t_day FROM task WHERE t_classid=? ORDER BY t_day DESC";
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
			pstmt.setString(1, classid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				taskSet.add(rs.getDate("t_day"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Date> taskList = new ArrayList<Date>(taskSet);
		Collections.sort(taskList);
		return taskList;
	}

	@Override
	public List<GetTaskVO> getTaskofDate(String classid, Date date) {
		List<GetTaskVO> taskList = new ArrayList<GetTaskVO>();
		String sql = "SELECT * FROM task WHERE t_classid=? AND t_day=?";
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
			pstmt.setString(1, classid);
			pstmt.setDate(2, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetTaskVO task = new GetTaskVO(
						rs.getInt("t_wrnum"),
						rs.getDate("t_day"),
						rs.getString("t_classid"),
						rs.getString("t_title"),
						rs.getString("t_content")
						);
				taskList.add(task);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return taskList;
	}

	@Override
	public GetTaskVO getTaskDetail(int wrnum) {
		GetTaskVO taskDetail = new GetTaskVO();
		String sql = "SELECT * FROM task WHERE t_wrnum=?";
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
			while (rs.next()) {
				taskDetail.setWrnum(rs.getInt("t_wrnum"));
				taskDetail.setDay(rs.getDate("t_day"));
				taskDetail.setClassid(rs.getString("t_classid"));
				taskDetail.setTitle(rs.getString("t_title"));
				taskDetail.setContent(rs.getString("t_content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return taskDetail;
	}
	

}
