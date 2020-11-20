package kr.kro.task.connect;

public class Connect {
	private static String url = "jdbc:mariadb://localhost:3306/notice"; // db접속 url
	private static String uId = "root"; // 유저 ID
	private static String uPw = "password"; // 유저 비밀번호
	
	public String getUrl() {
		return url;
	}
	public String getuId() {
		return uId;
	}
	public String getuPw() {
		return uPw;
	}
	
}
