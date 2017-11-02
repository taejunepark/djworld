package mini.model.visitors;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Member;
import main.model.member.MemberDao;
import mini.bean.Reply;
import mini.bean.Visitors;
import mini.model.reply.ReplyDao;

@Repository(value = "visitorsDao")
public class VisitorsDaoImpl implements VisitorsDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private ReplyDao replyDao;

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
		r.setFriend(rs.getString("friend"));
		return r;
	};

	@Override
	public void write(String writer, String detail, String id) {
		String sql = "insert into visitors values(" + id + ".nextval, ?, ?, sysdate, '방명록', ?)";
		jdbcTemplate.update(sql, writer, detail, id);
	}

	@Override
	public List<Visitors> list(String id) {
		String sql = "select * from visitors where owner=? order by no desc";
		List<Visitors> list = jdbcTemplate.query(sql, mapper, id);
		for (Visitors visitor : list) {
			Member m = memberDao.info(visitor.getWriter());
			List<Reply> list2 = replyDao.list(visitor.getNo(), id);
			visitor.setReply(list2);
			visitor.setProfile(m.getProfile());
			visitor.setName(m.getName());
		}
		return list;
	}

	@Override
	public void delete(String id, int no) {
		String sql = "delete visitors where no = ? and owner = ?";
		jdbcTemplate.update(sql, no, id);
		replyDao.delete(id, no);
	}

	@Override
	public void edit(String id, int no, String detail) {
		String sql = "update visitors set detail = ? where no =? and owner = ?";
		jdbcTemplate.update(sql, detail, no, id);
	}
}
