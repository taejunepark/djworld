package main.model.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="paymentDao")
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int payMent(String tid, String id, int amount, String method) {
		String sql = "insert into payment values(?, ?, ?, sysdate, ?)";
		return jdbcTemplate.update(sql, tid, id, amount, method);
	}
	
	// 결제 후 밤 추가
	@Override
	public void bamBuy(String id, int bam) {
		String sql = "update member set bam=bam+? where id=?";
		jdbcTemplate.update(sql, bam, id);
	}
}
