package in.ps.Studentapp.test;

import java.util.Scanner;

import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dao.StudentDAOInterface;
import in.ps.Studentapp.dto.Student;


public class SignUpForm {
	
	public static void signup() {
		Scanner sc=new Scanner(System.in);
		Student s=new Student();
		System.out.println("Enter the name");
		s.setName(sc.next());
		System.out.println("Enter the phone");
		s.setPhone(sc.nextLong());
		System.out.println("Enter the mail");
		s.setMail(sc.next());
		System.out.println("Enter the password");
		String pass=sc.next();
		System.out.println("Enter the password once again");
		String word=sc.next();
		if(pass.equals(word)) {
			s.setPassword(word);
			StudentDAOInterface sado=new StudentDAO();
			boolean result=sado.insertStudent(s);
			if(result) {
				System.out.println("Data Inserted Successfully");
			}else {
				System.out.println("Data not inserted");
			}
		}else {
			System.out.println("password mismatch");
		}
		
		
		
		
		
	}

}
