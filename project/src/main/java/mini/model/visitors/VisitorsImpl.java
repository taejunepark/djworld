package mini.model.visitors;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Visitors;

@Repository(value="visitorsDao")
public class VisitorsImpl implements VisitorsDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Visitors> mapper = (rs, index)->{
		Visitors v = new Visitors();
		v.setNo(rs.getInt("no"));
		v.setDetail(rs.getString("detail"));
		v.setReg(rs.getString("reg"));
		v.setType(rs.getString("type"));
		v.setWriter(rs.getString("writer"));
		return v;
};
	
	@Override
	public void write(String detail, String writer) {
		String sql = "insert into visitors values(visitors_sq.nextval, ?, sysdate, '방명록', ?)";
		jdbcTemplate.update(sql, detail, writer);
	}

	@Override
	public List<Visitors> list() {
		String sql = "select * from visitors order by no desc";
		return jdbcTemplate.query(sql, mapper);
	}
}
