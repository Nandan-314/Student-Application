package in.ps.Studentapp.dao;

import java.util.ArrayList;

import in.ps.Studentapp.dto.Courses;



public interface CoursesDAOInterface {
	
	public boolean insertCourse(Courses c);
	public boolean updateCourse(Courses c);
	public boolean deleteCourse(int courseId);
	public Courses getCourses(int courseId);
	public ArrayList<Courses> getCourses();

}
