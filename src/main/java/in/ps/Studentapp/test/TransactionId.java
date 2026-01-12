package in.ps.Studentapp.test;

import java.util.Random;

public class TransactionId {

	public static long generateId() {
		Random rd=new Random();
		long id=rd.nextLong();
		
		long num=0;
		long ans=0;
		if(id<0) {
			id=id*(-1);
		}
		
		while(num<15) {
			long rem=id%10;
			ans=(ans*10)+rem;
			
			id=id/10;
			num++;
			
		}
		return ans;
	}
}
