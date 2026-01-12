package in.ps.Studentapp.test;

import java.util.Scanner;

import in.ps.Admin.Admin;
import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Student;

public class Loginform {
	public static void login() {
		StudentDAO d1=null;
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter the mail");
		String mail=sc.next();
		System.out.println("Enter the password");
		String password=sc.next();
		StudentDAO s=new StudentDAO();
		Student s1=s.getStudent(mail, password);
		if(s1!=null) {
			System.out.println("login succesful");
			if(s1.getSid()==1) {
				Admin.admin(s1);
				
			}
			else {
				App.options(s1);
			}
		}else {
			System.out.println("Failed to login");
		}
		
		
	}

}
