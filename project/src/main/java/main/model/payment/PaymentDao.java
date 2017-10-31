package main.model.payment;

import org.springframework.stereotype.Repository;

@Repository
public interface PaymentDao {
	void bamBuy(String id, int bam);

	int payMent(String tid, String id, int amount, String method);
}
