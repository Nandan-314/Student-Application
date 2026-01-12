package in.ps.Studentapp.dto;

public class Courses {
	private int courseid;
	private String CourseName;
	private String CouserInfo;
	private int month;
	private double fees;
	
	
	




	public Courses(String courseName, String couserInfo, int month, double fees) {
		super();
		CourseName = courseName;
		CouserInfo = couserInfo;
		this.month = month;
		this.fees = fees;
	}


	public Courses(int courseid, String courseName, String couserInfo, int month, double fees) {
		super();
		this.courseid = courseid;
		CourseName = courseName;
		CouserInfo = couserInfo;
		this.month = month;
		this.fees = fees;
	}


	public Courses() {
		// TODO Auto-generated constructor stub
	}


	public int getCourseid() {
		return courseid;
	}


	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}


	public String getCourseName() {
		return CourseName;
	}


	public void setCourseName(String courseName) {
		CourseName = courseName;
	}


	public String getCouserInfo() {
		return CouserInfo;
	}


	public void setCouserInfo(String couserInfo) {
		CouserInfo = couserInfo;
	}


	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	public double getFees() {
		return fees;
	}


	public void setFees(double fees) {
		this.fees = fees;
	}


	@Override
	public String toString() {
		return "Courses [courseid=" + courseid + ", CourseName=" + CourseName + ", CouserInfo=" + CouserInfo
				+ ", month=" + month + ", fees=" + fees + "]";
	}
	
	

}
