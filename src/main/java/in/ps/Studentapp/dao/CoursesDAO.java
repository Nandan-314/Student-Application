package in.ps.Studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.Connector.Connector;
import in.ps.Studentapp.dto.Courses;
import in.ps.Studentapp.dto.Student;

public class CoursesDAO implements CoursesDAOInterface {
	private Connection con;
	
	public CoursesDAO() {
		try {
			this.con=Connector.requestConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	
	}

	@Override
	public boolean insertCourse(Courses c) {
		// TODO Auto-generated method stub
		String query="insert into courses values (0,?,?,?,?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, c.getCourseName());
			ps.setString(2, c.getCouserInfo());
			ps.setInt(3, c.getMonth());
			ps.setDouble(4, c.getFees());
			
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
			
		}
		
		
	}

	@Override
	public boolean updateCourse(Courses c) {
		// TODO Auto-generated method stub
		String query="UPDATE courses SET CourseName=?, CourseInfo=?, month=?, fees=? WHERE courseid=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			 ps.setString(1, c.getCourseName());
			 ps.setString(2, c.getCouserInfo());
			 ps.setInt(3, c.getMonth());
			 ps.setDouble(4, c.getFees());
			 ps.setInt(5, c.getCourseid());
			 i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i > 0;
	}

	@Override
	public boolean deleteCourse(int courseId) {
		String query = "DELETE FROM courses WHERE courseid=?";
	    int i = 0;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, courseId);
	        i = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return i > 0;
	}

	@Override
	public Courses getCourses(int courseId) {
		// TODO Auto-generated method stub
		Courses cs=null;
		String query="select * from courses where Courseid=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, courseId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				cs=new Courses(rs.getInt(1), rs.getString(2),rs.getString(3) ,rs.getInt(4), rs.getDouble(5));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cs!=null) {
			return cs;
		}else {
			return null;
			
		}
		
	}

	@Override
	public ArrayList<Courses> getCourses() {
		// TODO Auto-generated method stub\
		ArrayList<Courses> Courselist=new ArrayList<Courses>();
		String query="select *  from courses";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Courses cs=new Courses(rs.getInt(1), rs.getString(2),rs.getString(3) ,rs.getInt(4), rs.getDouble(5));
				Courselist.add(cs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Courselist;
	}

}
