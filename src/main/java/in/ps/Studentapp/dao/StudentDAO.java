package in.ps.Studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import in.ps.Connector.Connector;
import in.ps.Studentapp.dto.Student;

public class StudentDAO implements StudentDAOInterface {

	private Connection con;
	
	public StudentDAO() {
		try {
			this.con=Connector.requestConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public boolean insertStudent(Student s) {
		// TODO Auto-generated method stub
		String query="insert into student_1 values  (0,?,?,?,?,sysdate());";
		int rs=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getPassword());
			
			rs=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs>0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean updateStudent(Student s) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		String query="update student_1 set namr=?,phone=?,passwo=?,mail=? where id=?";
		int i=0;
		
		
		try {
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getPassword());
			ps.setString(4, s.getMail());
			ps.setInt(5, s.getSid());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		
		return false;
	}

	@Override
	public boolean deleteStudent(Student s) {
		// TODO Auto-generated method stub
		String query ="delete from student_1 where id=?";
		int i=0;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, s.getSid());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		
		
		
		return false;
	}

	@Override
	public Student getStudent(String mail, String password) {
		// TODO Auto-generated method stub
		Student s=null;
		String query="select * from student_1 where mail=? and passwo=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				s=new Student(rs.getInt("id"), rs.getString("namr"),rs.getLong("phone"), rs.getString("mail"), rs.getString("passwo"), rs.getDate("date").toString());
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(s!=null) {
			System.out.println("login successful");
			return s;
		}
		else {
			System.out.println("no login happend");
			return null;
		}
		
		
	}

	@Override
	public Student getStudent(Long phone, String mail) {
		// TODO Auto-generated method stub
		Student s=null;
		
		try {
			PreparedStatement ps=con.prepareStatement("select * from student_1 where phone=? and mail=?;");
			ps.setLong(1, phone);
			ps.setString(2, mail);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				s=new Student(rs.getInt("id"), rs.getString("namr"),rs.getLong("phone"), rs.getString("mail"), rs.getString("passwo"), rs.getDate("date").toString());
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public ArrayList<Student> getStudent() {
		// TODO Auto-generated method stub
		Student s=null;
		ArrayList<Student> StudentList=new ArrayList<Student>();
		try {
			PreparedStatement ps=con.prepareStatement("Select * from student_1");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				int sid=rs.getInt("id");
				String name=rs.getString("Namr");
				Long phone=rs.getLong("phone");
				String mail=rs.getString("mail");
				String password=rs.getString("passwo");
				String date=rs.getDate("date").toString();
				s=new Student(sid, name, phone, mail, password, date);
				StudentList.add(s);
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return StudentList;
	}

}
