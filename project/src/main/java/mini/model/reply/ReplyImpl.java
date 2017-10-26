package mini.model.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Reply;

@Repository(value="replyDao")
public class ReplyImpl implements ReplyDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<Reply> mapper = (rs, index)->{
		Reply r = new Reply();
		r.setNo(rs.getInt("no"));
		r.setWriter(rs.getString("writer"));
		r.setDetail(rs.getString("detail"));
		r.setReg(rs.getString("reg"));
		r.setParent(rs.getInt("parent"));
		return r;
	};
	
	@Override
	public void insert(String writer, String detail, int parent) {
		String sql = "insert into visitorsreply values(visitorsreply_seq.nextval, ?, ?, sysdate, ?)";
		jdbcTemplate.update(sql, writer, detail, parent);
	}

	@Override
	public List<Reply> list(int parent) {
		String sql = "select * from visitorsreply where parent=? order by no";
		return jdbcTemplate.query(sql, mapper);
	}
}
