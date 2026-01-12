package in.ps.Studentapp.test;

import java.util.ArrayList;
import java.util.Scanner;

import in.ps.Studentapp.dao.CoursesDAO;
import in.ps.Studentapp.dao.PaymentDAO;
import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Courses;
import in.ps.Studentapp.dto.Student;
import in.ps.Studentapp.dto.payment;

public class App {
	public static void options(Student s) {
		StudentDAO sado=new StudentDAO();
		PaymentDAO pado =new PaymentDAO();
		CoursesDAO cado=new CoursesDAO();
		
		Scanner sc=new Scanner(System.in);
		int choice=0;
		
		System.out.println("Good day"+s.getName());
		
		do {
			ArrayList<payment> payments=pado.getPaymentByStudentId(s.getSid());
			System.out.println("1. VIEW PURCHASED COURSE"); 
			System.out.println("2. ADD COURSES"); 
			System.out.println("3. VIEW ACCOUNT"); 
			System.out.println("4. UPDATE ACCOUNT"); 
			System.out.println("5. VIEW PAYMENTS AND STATUS"); 
			System.out.println("6. EXIT"); 
			
			
			choice=sc.nextInt();
			
			switch (choice) {
			case 1: 
				if(payments!=null || payments.isEmpty()) {
					System.out.println("No courses found");
				}else {
					for(payment p:payments) {
						Courses c=cado.getCourses(p.getCourse_id());
						
						if(p.getStatus().equalsIgnoreCase("Pending")) {
							System.out.println("Course name:"+c.getCourseName());
							System.out.println("Status:"+p.getStatus());
							System.out.println("Course will be purchased once admin approves");
						}else {
							System.out.println(c);
						}
					}
				}
				break;
			case 2:
				AddCourse.addCourse(s);
				break;
			case 3:
				System.out.println(s);
				break;
			case 4:
				break;
			case 5:
				for(payment p:payments) {
					System.out.println(p);
				}
				break;
			}
		
		
	}while(choice!=6);

}
}
