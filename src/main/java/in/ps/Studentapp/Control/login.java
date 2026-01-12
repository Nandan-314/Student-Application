package in.ps.Studentapp.Control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Student;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudentDAO sido=new StudentDAO();
		Student s=sido.getStudent(request.getParameter("email"),request.getParameter("password"));
		HttpSession session=request.getSession();
		
		if(s!=null) {
			session.setAttribute("session", s);
			if(s.getSid()==1) {
				request.setAttribute("admin", "admin logged in successfully");
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
				rd.forward(request, response);
				
			}else {
				request.setAttribute("logsucc","you are logged in successfully");
				RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
				rd.forward(request, response);
			}
		}else {
			request.setAttribute("loginfail","login failed");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
