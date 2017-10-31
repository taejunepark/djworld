package mini.model.visitors;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Reply;
import main.bean.Visitors;

@Repository(value = "visitorsDao")
public class VisitorsImpl implements VisitorsDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Visitors> mapper = (rs, index) -> {
		Visitors v = new Visitors();
		v.setNo(rs.getInt("no"));
		v.setDetail(rs.getString("detail"));
		v.setReg(rs.getString("reg"));
		v.setType(rs.getString("type"));
		v.setWriter(rs.getString("writer"));
		return v;
	};

	private RowMapper<Reply> mapper2 = (rs, index) -> {
		Reply r = new Reply();
		r.setNo(rs.getInt("no"));
		r.setWriter(rs.getString("writer"));
		r.setDetail(rs.getString("detail"));
		r.setReg(rs.getString("reg"));
		r.setParent(rs.getInt("parent"));
		return r;
	};

	@Override
	public void write(String writer, String detail, String id) {
		String sql = "insert into visitors values("+id+".nextval, ?, ?, sysdate, '방명록', ?)";
		jdbcTemplate.update(sql, writer, detail, id);
	}

	@Override
	public List<Visitors> list(String id) {
		String sql = "select * from visitors where friend=? order by no desc";
		List<Visitors> list = jdbcTemplate.query(sql, mapper, id);
		for(Visitors visitor : list) {
			List<Reply> list2 = list(visitor.getNo());
			visitor.setReply(list2);
		}
		return list;
	}

	@Override
	public List<Reply> list(int parent) {
		String sql = "select * from visitorsreply where parent=? order by no";
		return jdbcTemplate.query(sql, mapper2, parent);
	}
}
