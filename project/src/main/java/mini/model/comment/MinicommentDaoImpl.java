package mini.model.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="minicommentDao")
public class MinicommentDaoImpl implements MinicommentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(String id, String comment) {
		String sql = "insert into minicomment values(?, ?, sysdate)";
		jdbcTemplate.update(sql, id, comment);
	}
	
	public String check(String id) {
		String message;
		try {
			String sql = "select minicomment from minicomment where owner = ?";
			message = jdbcTemplate.queryForObject(sql, String.class, id);
		}
		catch(EmptyResultDataAccessException e){
			message = null;
		}
		return message;
	}

	@Override
	public void update(String id, String comment) {
		String sql = "update minicomment set minicomment = ? where owner = ?";
		jdbcTemplate.update(sql, comment, id);
	}
}
