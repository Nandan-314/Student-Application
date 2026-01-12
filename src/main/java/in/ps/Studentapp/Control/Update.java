package in.ps.Studentapp.Control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mysql.cj.Session;

import in.ps.Studentapp.dao.StudentDAO;
import in.ps.Studentapp.dto.Student;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		Student s=(Student) session.getAttribute("session");
		
		StudentDAO sado=new StudentDAO();
		String name=request.getParameter("name");
		String mail=request.getParameter("email");
		long phone=Long.parseLong(request.getParameter("Phone"));
		
		s.setName(name);
		s.setMail(mail);
		s.setPhone(phone);
		
		boolean b=sado.updateStudent(s);
		
		
		if(b) {
			request.getSession().setAttribute("success", "profile updated successfully");
			RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
			rd.forward(request, response);
		}else {
			request.getSession().setAttribute("failure", "failed to update your profile");
			RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
