package mini.model.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Member;
import main.model.member.MemberDao;
import mini.bean.Friendcomment;

@Repository(value="minicommentDao")
public class MinicommentDaoImpl implements MinicommentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MemberDao memberDao;
	
	private RowMapper<Friendcomment> mapper = (rs, index)->{
		Friendcomment f = new Friendcomment();
		f.setWriter(rs.getString("writer"));
		f.setOwner(rs.getString("owner"));
		f.setFriendComment(rs.getString("friendcomment"));
		f.setReg(rs.getString("reg"));
		return f;
	};
	
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

	@Override
	public void friendCommentInsert(String writer, String id, String comment) {
		String sql = "insert into friendcomment values(?, ?, ?, sysdate)";
		jdbcTemplate.update(sql, writer, id, comment);
	}

	@Override
	public List<Friendcomment> friendCommentList(String id) {
		String sql = "select * from friendcomment where owner = ? order by reg desc";
		List<Friendcomment> list =  jdbcTemplate.query(sql, mapper, id);
		for(Friendcomment f : list) {
			Member m = memberDao.info(f.getWriter());
			f.setName(m.getName());
		}
		return list;
	}

	@Override
	public void friendCommentDelete(String writer, String id, String comment) {
		String sql = "delete friendcomment where writer = ? and owner = ? and friendcomment = ?";
		jdbcTemplate.update(sql, writer, id, comment);
	}
}
