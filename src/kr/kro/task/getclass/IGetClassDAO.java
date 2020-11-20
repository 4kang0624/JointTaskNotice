package kr.kro.task.getclass;

import java.util.List;

public interface IGetClassDAO {
	// 반 목록 가져오기
	List<String> getClass(int classid);
	
	// 로그인 한 사용자의 반 가져오기
	String getMyClass(String id);
}
