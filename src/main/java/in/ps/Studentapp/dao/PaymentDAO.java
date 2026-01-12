package in.ps.Studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.Connector.Connector;
import in.ps.Studentapp.dto.payment;

public class PaymentDAO implements PaymentDAOInterface {
	
	private Connection con;
	
	public PaymentDAO() {
		try {
			this.con=Connector.requestConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean insertPayment(payment p) {
		// TODO Auto-generated method stub
		String query ="Insert into payment values(0,?,?,?,?,'Pending',?,sysdate()) ";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, p.getStudent_id());
			ps.setInt(2, p.getCourse_id());
			ps.setLong(3, p.getTransaction_id());
			ps.setString(4, p.getMethod());
			ps.setString(5,p.getPath());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}else {
			return false;
			
		}
		
	}

	@Override
	public boolean updatePayment(payment p) {
		// TODO Auto-generated method stub
		String query="update payment set studentid=?,courseid=?,transactionId=?,method=?,status=?,path=? where paymentid=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, p.getStudent_id());
			ps.setInt(2, p.getCourse_id());
			ps.setLong(3, p.getTransaction_id());
			ps.setString(4, p.getMethod());
			ps.setString(5, p.getStatus());
			ps.setString(6,p.getPath());
			ps.setInt(7, p.getPaymment_id());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean deletePayment(payment p) {
		// TODO Auto-generated method stub
		String query="delete from payment where paymentid=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i>0) {
			return true;
		}else {
			return false;
		}
		
				
		
	}

	@Override
	public payment getPayment(int paymentId) {
		// TODO Auto-generated method stub
		payment p=null;
		String query="Select * from payment where paymentid=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, paymentId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new payment();
				p.setPaymment_id(rs.getInt("paymentId"));
				p.setStudent_id(rs.getInt("studentId"));
				p.setCourse_id(rs.getInt("courseId"));
				p.setTransaction_id(rs.getLong("transactionId"));
				p.setMethod(rs.getString("method"));
				p.setStatus(rs.getString("status"));
				p.setPath(rs.getString("Path"));
				p.setDate(rs.getString("date"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}

	@Override
	public ArrayList<payment> getPaymentByStudentId(int studentId) {
		// TODO Auto-generated method stub
		ArrayList<payment> payments=new ArrayList<payment>();
		payment p=null;
		
		String query="Select * from payment where studentid=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, studentId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new payment();
				p.setPaymment_id(rs.getInt("Paymentid"));
				p.setStudent_id(rs.getInt("StudentId"));
				p.setCourse_id(rs.getInt("CourseId"));
				p.setTransaction_id(rs.getLong("TransactionId"));
				p.setMethod(rs.getString("method"));
				p.setStatus(rs.getString("status"));
				p.setPath(rs.getString("Path"));
				p.setDate(rs.getString("Date"));
				payments.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return payments;
	}

	@Override
	public ArrayList<payment> getPaymetn() {
		// TODO Auto-generated method stub
		String query="select * from payment ";
		ArrayList<payment> paylist=new ArrayList<payment>();
		payment p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new payment();
				p.setPaymment_id(rs.getInt("Paymentid"));
				p.setStudent_id(rs.getInt("StudentId"));
				p.setCourse_id(rs.getInt("CourseId"));
				p.setTransaction_id(rs.getLong("TransactionId"));
				p.setMethod(rs.getString("method"));
				p.setStatus(rs.getString("status"));
				p.setDate(rs.getString("date"));
				paylist.add(p);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return paylist;
	}

	@Override
	public boolean updatePaymentStatus(int paymentId, String status) {
		// TODO Auto-generated method stub
		String query = "UPDATE payment SET status=? WHERE paymentid=?";
	    try (PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setString(1, status);
	        ps.setInt(2, paymentId);
	        return ps.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }

		
	}

}
