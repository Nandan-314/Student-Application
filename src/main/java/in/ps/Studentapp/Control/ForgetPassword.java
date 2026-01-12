package in.ps.Studentapp.Control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Student;

/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO sido=new StudentDAO();
		
		long phone =Long.parseLong(request.getParameter("phone"));
		String email=request.getParameter("email");
		String password=request.getParameter("newPassword");
		String newPassword=request.getParameter("confirmPassword");
		
		
		Student s1=sido.getStudent(phone, email);
		if(s1==null) {
			request.setAttribute("fail1", "Phone number entered or email entered is wrong");
			RequestDispatcher rd=request.getRequestDispatcher("Forgotpassword.jsp");
			rd.forward(request, response);
					
		}else {
			if(password.equals(newPassword)) {
			s1.setPassword(newPassword);
			boolean res=sido.updateStudent(s1);
			if(res) {
				request.setAttribute("success1", "Password updated successfully");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("failure1", "Password not updated successfully");
				RequestDispatcher rd=request.getRequestDispatcher("Forgotpassword.jsp");
				rd.forward(request, response);
				
			}
			}else {
				request.setAttribute("nomatch", "Password entered are not matching");
				RequestDispatcher rd=request.getRequestDispatcher("Forgotpassword.jsp");
				rd.forward(request, response);
				
			}
		}
		
		
				
		
		
		
		
	}

}
