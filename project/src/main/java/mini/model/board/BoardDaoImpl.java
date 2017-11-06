package mini.model.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mini.bean.Board;
import mini.bean.Reply;
import mini.model.reply.ReplyDao;

@Repository(value="boardDao")
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	@Autowired
	private ReplyDao replyDao;
	
	private RowMapper<Board> mapper = new RowMapper<Board>() {
		@Override
		public Board mapRow(ResultSet rs, int index) throws SQLException {
			Board b = new Board();
			b.setNo(rs.getInt("no"));
			b.setRead(rs.getInt("read"));
			b.setReply(rs.getInt("reply"));
			b.setTitle(rs.getString("title"));
			b.setWriter(rs.getString("writer"));
			b.setDetail(rs.getString("detail"));
			b.setReg(rs.getString("reg"));
			b.setType(rs.getString("type"));
			b.setOwner(rs.getString("owner"));
			return b;
		}
	};
	
	private ResultSetExtractor<Board> extractor = new ResultSetExtractor<Board>() {
		@Override
		public Board extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				Board b = new Board();
				b.setNo(rs.getInt("no"));
				b.setRead(rs.getInt("read"));
				b.setReply(rs.getInt("reply"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setDetail(rs.getString("detail"));
				b.setReg(rs.getString("reg"));
				b.setType(rs.getString("type"));
				b.setOwner(rs.getString("owner"));
				return b;
			}
			return null;
		}
	};
	
	@Override
	public void insert(Board b) {
		String sql = "insert into board "
				+ "values(" + b.getOwner()+ ".nextval, ?, ?, ?, 0, 0, sysdate, 'board', ?)";
		Object[] obj = {
				b.getTitle(), b.getWriter(), b.getDetail(), b.getOwner()
		};
		jdbctemplate.update(sql, obj);
	}

	@Override
	public int newSeq(String owner) {
		String sql = "select max(no) from board where owner = ?";
		return jdbctemplate.queryForObject(sql, Integer.class, owner);
	}

	@Override
	public List<Board> list(String type, String owner) {
		String sql = "select * from board where type = ? and owner = ? order by reg desc";
		Object[] obj = {
				type,owner
		};
		return jdbctemplate.query(sql, obj,mapper);
		
	}

	@Override
	public Board info(int no, String owner) {
		String sql = "select * from board where no = ? and owner = ?";
		Object[] obj = {
				no, owner
		};
		Board b = jdbctemplate.query(sql, obj, extractor);
		List<Reply> replyList = replyDao.list(no, owner);
		b.setReplyList(replyList);
		return b;
	}

	@Override
	public void edit(String title, String detail, String owner, int no) {
		String sql = "update board set title = ?, detail = ? where owner = ? and no = ?";
		Object[] obj = {
				title, detail, owner, no
		};
		jdbctemplate.update(sql,obj);
	}

	@Override
	public void delete(String owner, int no) {
		String sql = "delete board where owner = ? and no = ?";
		jdbctemplate.update(sql, owner, no);
	}
}
