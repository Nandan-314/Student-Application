package in.ps.Studentapp.dto;

public class Student {
	
	
	private int  sid;
	private String name ;
	private Long phone; 
	private String mail; 
	private String password; 
	private String date;
	
	public Student() {};
	public Student(int sid, String name, Long phone, String mail, String password, String date) {
		super();
		this.sid = sid;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.password = password;
		this.date = date;
	}
	
	public Student(String name, Long phone, String mail, String password) {
		super();
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.password = password;
	}
	
	public int getSid() {
		return sid;
	}
	
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", password="
				+ password + ", date=" + date + "]";
	}

}
