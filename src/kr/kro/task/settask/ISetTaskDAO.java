package kr.kro.task.settask;

public interface ISetTaskDAO {
	boolean setTask(String day, String classid, String title, String content);
}
