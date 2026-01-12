package in.ps.Admin;

import java.util.ArrayList;
import java.util.Scanner;

import in.ps.Studentapp.dao.CoursesDAO;
import in.ps.Studentapp.dao.PaymentDAO;
import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Courses;
import in.ps.Studentapp.dto.Student;
import in.ps.Studentapp.dto.payment;
import in.ps.Studentapp.test.CourseAdd;

public class Admin {

	public static void admin(Student s) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		PaymentDAO pado=new PaymentDAO();
		CoursesDAO cado=new CoursesDAO();
		StudentDAO sado=new StudentDAO();
		int choice=0;
		
		
		do {
			System.out.println("enter the operation you want to perform");
			System.out.println("1.view all users");
			System.out.println("2.view all courses");
			System.out.println("3.Insert a course");
			System.out.println("4.Update a course");
			System.out.println("5.Delete a course");
			System.out.println("6.view payment");
			System.out.println("7.Approve payment");
			System.out.println("8.exit");
			
			choice=sc.nextInt();
			
			switch (choice) {
			case 1:
				ArrayList<Student> slist=sado.getStudent();
				for(Student sal:slist) {
					System.out.println(sal.toString());
				}
				break;
			case 2:
				ArrayList<Courses> courlist=cado.getCourses();
				for(Courses cour:courlist) {
					System.out.println(cour.toString());
				}
				break;
			case 3:
				CourseAdd.addCourse();
				break;
			case 4:
				CourseUpdate.updateCourse();
				break;
			case 5:
				CourseUpdate.deleteCourse();
				break;
			case 6:
				ArrayList<payment> mentList=pado.getPaymetn();
				for(payment p:mentList) {
					System.out.println(p.toString());
				}
				break;
			case 7:
				ArrayList<payment> paymentList=pado.getPaymetn();
				for(payment p:paymentList) {
					
					System.out.println(p.toString());
				}
				System.out.println("Enter the payment id to be updated");
				payment p=pado.getPayment(sc.nextInt());
				System.out.println("1.Approve");
				System.out.println("2.Decline");
				int i=sc.nextInt();
				if(i==1) {
					p.setStatus("successful"); 
					
				}else if(i==2) {
					p.setStatus("Failed");
				}else {
					System.out.println("Invalid Reponse");
				}
				boolean results=pado.updatePayment(p);
				
				if(results) {
					System.out.println("Payment status updated");
				}else {
					System.out.println("Failed to update the paymetn status");
				}
			case 8:System.out.println("Going back to main menu>>>>");
			break;

			default:
				System.out.println("Invalid choice Try Again");
				break;
			}
			
			
			
			
		}while(choice!=8);

	}

}
