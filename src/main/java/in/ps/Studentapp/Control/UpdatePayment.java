package in.ps.Studentapp.Control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import in.ps.Studentapp.dao.PaymentDAO;

/**
 * Servlet implementation class UpdatePayment
 */
@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String paymentId = request.getParameter("payment_id");
        String status = request.getParameter("approval");

        PaymentDAO dao = new PaymentDAO(); // or however you instantiate it
        boolean updated = dao.updatePaymentStatus(Integer.parseInt(paymentId), status);

        if (updated) {
            request.setAttribute("Approve","Payment Approved Sucessfully");
        } else {
            request.setAttribute("Not Approve","Payment Not Approved");
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);

		
	}

}
