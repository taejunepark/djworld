package mini.model.total;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="totalDao")
public class TotalDaoImpl implements TotalDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void plus(String id) {
		String sql = "update total set total = total +1 where owner = ?";
		jdbcTemplate.update(sql, id);
	}

	public int count(String id) {
		String sql = "select total from total where owner = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}
}
