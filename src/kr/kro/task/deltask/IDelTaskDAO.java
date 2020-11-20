package kr.kro.task.deltask;

public interface IDelTaskDAO {
	// 권한 있는지 체크
	boolean deleteCheck(int wrnum, String classid);
	
	//삭제
	void deleteTask(int wrnum);
}
