package mini.model.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Reply;

@Repository(value="replyDao")
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<Reply> mapper = (rs, index)->{
		Reply r = new Reply();
		r.setNo(rs.getInt("no"));
		r.setWriter(rs.getString("writer"));
		r.setDetail(rs.getString("detail"));
		r.setReg(rs.getString("reg"));
		r.setParent(rs.getInt("parent"));
		r.setFriend(rs.getString("friend"));
		return r;
	};
	
	@Override
	public void insert(String writer, String detail, int parent, String friend) {
		String sql = "insert into reply values(reply_seq.nextval, ?, ?, sysdate, ?, ?)";
		jdbcTemplate.update(sql, writer, detail, parent, friend);
	}

	@Override
	public List<Reply> list(int parent, String friend) {
		String sql = "select * from reply where parent=? and friend = ? order by no";
		return jdbcTemplate.query(sql, mapper, parent, friend);
	}
}
