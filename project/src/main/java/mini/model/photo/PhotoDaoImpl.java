package mini.model.photo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mini.bean.Photo;
import mini.bean.Reply;
import mini.model.reply.ReplyDao;

@Repository(value="photoDao")
public class PhotoDaoImpl implements PhotoDao {
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	@Autowired
	private ReplyDao replyDao;
	
	private RowMapper<Photo> mapper = new RowMapper<Photo>() {
		@Override
		public Photo mapRow(ResultSet rs, int index) throws SQLException {
			Photo p = new Photo();
			p.setNo(rs.getInt("no"));
			p.setTitle(rs.getString("title"));
			p.setDetail(rs.getString("detail"));
			p.setReg(rs.getString("reg"));
			p.setType(rs.getString("type"));
			p.setOwner(rs.getString("owner"));
			return p;
		}
	};
	
	private ResultSetExtractor<Photo> extractor = new ResultSetExtractor<Photo>() {
		public Photo extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				Photo p = new Photo();
				p.setNo(rs.getInt("no"));
				p.setTitle(rs.getString("title"));
				p.setDetail(rs.getString("detail"));
				p.setReg(rs.getString("reg"));
				p.setType(rs.getString("type"));
				p.setOwner(rs.getString("owner"));
				return p;
			}
			return null;
		}
	};
	
	@Override
	public List<Photo> list(String type, String owner) {
		String sql = "select * from photo where type = ? and owner = ? order by reg desc";
		List<Photo> list =  jdbctemplate.query(sql, mapper, type, owner);
		for(Photo p : list) {
			List<Reply> list2 = replyDao.list(p.getNo(), owner);
			p.setReply(list2);
		}
		return list;
	}

	@Override
	public void insert(String title, String detail, String owner) {
		String sql = "insert into photo values("+owner+".nextval,?,?,sysdate,'photo',?)";
		Object[] obj = {
				title, detail, owner
		};
		jdbctemplate.update(sql,obj);
	}

	@Override
	public int newSeq(String owner) {
		String sql = "select max(no) from photo where owner = ?";
		return jdbctemplate.queryForObject(sql, Integer.class, owner);
	}

	@Override
	public Photo info(int no) {
		String sql = "select * from photo where no = ?";
		return jdbctemplate.query(sql, extractor, no);
	}

	@Override
	public void edit(String title, String detail, String owner, int no) {
		String sql = "update photo set title = ?, detail = ? where owner = ? and no = ?";
		Object[] obj = {
				title, detail, owner, no
		};
		jdbctemplate.update(sql,obj);
		
	}

	@Override
	public void delete(String owner, int no) {
		String sql = "delete photo where owner = ? and no = ?";
		jdbctemplate.update(sql, owner, no);
	}

	@Override
	public String title(String id) {
		String result = null;
		try {
			String sql = "select tmp.title from (select * from photo order by reg desc)tmp where rownum = 1 and owner = ?";
			result = jdbctemplate.queryForObject(sql, String.class, id);
			if(result.length() > 10) {
				result = result.substring(0, 10)+"..";
			}
		}
		catch(EmptyResultDataAccessException e) {
			result = null;
		}
		return result;
	}
}
