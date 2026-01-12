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
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO sido=new StudentDAO();
		Student s=null;
		String name=request.getParameter("name");
		long phone=Long.parseLong(request.getParameter("phone"));
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmPassword=request.getParameter("confirmPassword");
		
		if(password.equals(confirmPassword)) {
			s= new Student(name, phone, email, confirmPassword);
		}
		boolean res=sido.insertStudent(s);
		if(res) {
			request.setAttribute("success", "Account created Successfully");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		
		}else {
			request.setAttribute("failure", "Failed to create your acciunt");
			RequestDispatcher rd1=request.getRequestDispatcher("signup.jsp");
			rd1.forward(request, response);
		}
	}

}
