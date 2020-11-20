package kr.kro.task.gettask;

import java.sql.Date;
import java.util.List;

public interface IGetTaskDAO {
	List<Date> getDate(String classid);
	
	List<GetTaskVO> getTaskofDate(String classid, Date date);
	
	GetTaskVO getTaskDetail(int wrnum);
}