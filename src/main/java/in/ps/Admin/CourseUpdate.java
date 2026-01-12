package in.ps.Admin;

import java.util.ArrayList;
import java.util.Scanner;

import in.ps.Studentapp.dao.CoursesDAO;
import in.ps.Studentapp.dto.Courses;

public class CourseUpdate {
	static Scanner sc =new Scanner(System.in);
	static CoursesDAO cado=new CoursesDAO();
	
	
	public static Courses courseInfo() {
		
		ArrayList<Courses> course=cado.getCourses();
		for(Courses c:course) {
			System.out.println(c);
		}
		System.out.println("Enter the course id you want to perform operation on");
		Courses cs=cado.getCourses(sc.nextInt());
		return cs;
	}
	
	
	public static void updateCourse() {
		
		Courses c=courseInfo();
		int choice =0;
		do {
			
		
		System.out.println("1.Update the name");
		System.out.println("2.Update course info");
		System.out.println("3.Duration of course");
		System.out.println("4.Update thhe fess");
		System.out.println("5.back to admin menu");
		
		
		System.out.println("Enter what you want to update");
		choice =sc.nextInt();
		sc.nextLine();
		
		switch (choice) {
		case 1:
			System.out.println("enter the name");
			c.setCourseName(sc.nextLine());
			break;
		case 2:
			System.out.println("enter the course info");
			c.setCouserInfo(sc.nextLine());
			break;
		case 3:
			System.out.println("Emter the duration");
			c.setMonth(sc.nextInt());
			break;
		case 4:
			System.out.println("Enter the fees");
			c.setFees(sc.nextDouble());
			break;
		case 5:
			System.out.println("Back to admin menu");
			break;

		default:
			System.out.println("Invalid choice");
			break;
		}
		boolean res=cado.updateCourse(c);
		if(res) {
			System.out.println("Course updated Successfully");
		}else {
			System.out.println("Course not updated");
		}
		}while(choice!=5);
	
	}
	
	
	public static void deleteCourse() {
		CoursesDAO cad=new CoursesDAO();
		Scanner sc=new Scanner(System.in);
		Courses c=courseInfo();
		boolean del=cad.deleteCourse(c.getCourseid());
		if(del) {
			System.out.println("Course Deleted Successfuly");
		}else {
			System.out.println("Course not deleted");
			
		}
		
		
	}

}
