package in.ps.Studentapp.test;

import java.util.Scanner;

import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Student;

public class Password {
	public static void forgot() {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter yoour phoone nummber");
		long phone =sc.nextLong();
		System.out.println("Enter your mail");
		String mail=sc.next();
		StudentDAO sado=new StudentDAO();
		Student s=sado.getStudent(phone, mail);
		if(s!=null) {
			System.out.println("Enter thhe password to be updated");
			String password=sc.next();
			System.out.println("Confirm the password");
			String confirmPassword=sc.next();
			if(password.equalsIgnoreCase(confirmPassword)) {
				s.setPassword(confirmPassword);
				boolean result=sado.updateStudent(s);
				if(result) {
				System.out.println("Password updated Successfully");
				}else {
					System.out.println("Failed to updatte the password");
				}
			}
			else {
				System.out.println("password mismatch");
			}
			
		}else {
			System.out.println("Accoutn does'nt exist");
		}
		
	}
}
