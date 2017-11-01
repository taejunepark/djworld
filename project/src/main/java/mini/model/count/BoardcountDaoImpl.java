package mini.model.count;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="boardcountDao")
public class BoardcountDaoImpl implements BoardcountDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int visitorsCount(String id) {
		String sql = "select count(*) from visitors where owner=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	@Override
	public int diaryCount(String id) {
		String sql = "select count(*) from diary where separate=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	@Override
	public int photoCount(String id) {
		String sql = "select count(*) from photo where owner = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

}
