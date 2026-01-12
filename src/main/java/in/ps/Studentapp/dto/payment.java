package in.ps.Studentapp.dto;

public class payment {
	private int paymment_id;
	private int student_id;
	private int course_id;
	private long transaction_id;
	private String method;
	private String status;
	private String path;
	private String date;
	
	
	
	
	public payment(int paymment_id, int student_id, int course_id, long transaction_id, String method, String status,
			String path, String date) {
		super();
		this.paymment_id = paymment_id;
		this.student_id = student_id;
		this.course_id = course_id;
		this.transaction_id = transaction_id;
		this.method = method;
		this.status = status;
		this.path = path;
		this.date = date;
	}
	public int getPaymment_id() {
		return paymment_id;
	}
	public void setPaymment_id(int paymment_id) {
		this.paymment_id = paymment_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public long getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(long transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "payment [paymment_id=" + paymment_id + ", student_id=" + student_id + ", course_id=" + course_id
				+ ", Transaction_id=" + transaction_id + ", method=" + method + ", status=" + status + ", path=" + path
				+ ", date=" + date + "]";
	}
	public payment() {
		super();
	}
	
	


}
