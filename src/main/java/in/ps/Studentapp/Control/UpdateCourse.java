package in.ps.Studentapp.Control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import in.ps.Studentapp.dao.CoursesDAO;
import in.ps.Studentapp.dto.Courses;

/**
 * Servlet implementation class UpdateCourse
 */
@WebServlet("/UpdateCourse")
public class UpdateCourse extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		CoursesDAO cado = new CoursesDAO();
		Courses c=new Courses(request.getParameter("CourseName"), request.getParameter("CourseInfo"),Integer.parseInt(request.getParameter("duration")),
				Double.parseDouble(request.getParameter("price")));
		
		if(cado.insertCourse(c)) {
			request.setAttribute("update","Course Updated Successfully");
			
		}else {
			request.setAttribute("noupdate","Course Not Updated failed");
			
			
		}
		RequestDispatcher rd= request.getRequestDispatcher("admin.jsp");
		rd.forward(request, response);
		
	}

}
