package in.ps.Studentapp.dao;

import java.util.ArrayList;
import java.util.List;

import in.ps.Studentapp.dto.Student;

public interface StudentDAOInterface {
	public boolean insertStudent(Student s);
	public boolean updateStudent(Student s);
	public boolean deleteStudent(Student s);
	public Student getStudent(String mail,String password);
	public Student getStudent(Long phone,String mail);
	public ArrayList<Student> getStudent();
	

}
