package in.ps.Studentapp.dao;

import java.util.ArrayList;

import in.ps.Studentapp.dto.payment;


public interface PaymentDAOInterface {
	public boolean insertPayment(payment p);
	public boolean updatePayment(payment p);
	public boolean deletePayment(payment p);
	public payment getPayment(int paymentId);
	public ArrayList<payment> getPaymentByStudentId(int studentId);
	public ArrayList<payment> getPaymetn();
	public boolean updatePaymentStatus(int paymentId, String status);

}
