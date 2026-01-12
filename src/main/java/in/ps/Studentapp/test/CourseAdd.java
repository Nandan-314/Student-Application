package in.ps.Studentapp.test;

import java.util.Scanner;

import in.ps.Studentapp.dao.CoursesDAO;
import in.ps.Studentapp.dto.Courses;

public class CourseAdd {

	public static void addCourse() {
		CoursesDAO cado=new CoursesDAO();
		Scanner sc=new Scanner(System.in);
		Courses c=new Courses();
		
		System.out.println("Enter the course name ");
		c.setCourseName(sc.nextLine());
		System.out.println("Enter the course info");
		c.setCouserInfo(sc.nextLine());
		System.out.println("Enter the duration");
		c.setMonth(sc.nextInt());
		System.out.println("enter the fees");
		c.setFees(sc.nextDouble());
		
		boolean res=cado.insertCourse(c);
		
		if(res) {
			System.out.println("Course updated Successfully");
		}else {
			System.out.println("Course updation failed");
		}
		
		
		
		
		
	}
}
