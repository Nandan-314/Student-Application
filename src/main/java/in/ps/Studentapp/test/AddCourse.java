package in.ps.Studentapp.test;

import java.util.Scanner;

import in.ps.Admin.CourseUpdate;
import in.ps.Studentapp.dao.PaymentDAO;
import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Courses;
import in.ps.Studentapp.dto.Student;
import in.ps.Studentapp.dto.payment;

public class AddCourse {
	public static void addCourse(Student s) {
		Scanner sc=new Scanner(System.in);
		PaymentDAO pado=new PaymentDAO();
		Courses c=CourseUpdate.courseInfo();
		boolean res=false;
		if(c!=null) {
			System.out.println("Bill amount is Rs"+c.getFees()+"/-");
			payment p=new payment();
			p.setCourse_id(c.getCourseid());
			p.setStudent_id(s.getSid());
			p.setTransaction_id(TransactionId.generateId());
			
			System.out.println("Enter the payment mode:"); 
			System.out.println("1. Cash"); 
			System.out.println("2. UPI"); 
			System.out.println("3. Credit Card"); 
			System.out.println("4. Debit Card");
			int payment=0;
			payment=sc.nextInt();
			switch (payment) {
			case 1:
				p.setMethod("Casd");
				break;
			case 2:
				p.setMethod("UPI");
				break;
			case 3:
				p.setMethod("Credit card");
				break;
			case 4:
				p.setMethod("Debit Carrd");
				break;
			}
			p.setPath("NA");
			res=pado.insertPayment(p);
			
			if(res) {
				System.out.println("Payment Successfull course added to your list");
				
			
			}else{
				System.out.println("Payment failed");
			}
		}
			else {
				System.out.println("Failed to opt the course");
			}
		}
		
		
	}


