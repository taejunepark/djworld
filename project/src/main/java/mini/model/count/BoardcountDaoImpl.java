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
	public int visitorsTodayCount(String id) {
		String sql = "select count(*) from visitors where to_char(reg, 'yyyymmdd' ) = to_char( sysdate, 'yyyymmdd') and owner = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	@Override
	public int diaryCount(String id) {
		String sql = "select count(*) from diary where separate=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}
	
	@Override
	public int diaryTodayCount(String id) {
		String sql = "select count(*) from diary where to_char(reg, 'yyyymmdd' ) = to_char( sysdate, 'yyyymmdd') and separate = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	@Override
	public int photoCount(String id) {
		String sql = "select count(*) from photo where separate = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	@Override
	public int photoTodayCount(String id) {
		String sql = "select count(*) from photo where to_char(reg, 'yyyymmdd' ) = to_char( sysdate, 'yyyymmdd') and separate = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

}
