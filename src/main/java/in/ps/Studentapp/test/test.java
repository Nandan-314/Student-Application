
package in.ps.Studentapp.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Student;

public class test {

	public static void main(String[] args) {
		int choice=0;
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		do {
			
			System.out.println("Enter the service you want to perform");
			System.out.println("1.Sign Up Form");
			System.out.println("2.Login form");
			System.out.println("3.Forgot Password");
			System.out.println("4.Exit\n");
			
			System.out.println("Enter the choice");
			choice=sc.nextInt();
			
			
			switch (choice) {
			case 1:
				SignUpForm.signup();
				break;
			case 2:
				Loginform.login();
				break;
			case 3:
				Password.forgot();
				break;
			case 4:
				System.out.println("Program terminated sucessfully");
				break;

			default:
				System.out.println("Invalid choice ,reentter the number");
				break;
			}
			
			
		} while (choice!=4);
		
		
		
		}

	}


