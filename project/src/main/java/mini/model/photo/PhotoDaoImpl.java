package mini.model.photo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
			p.setSeparate(rs.getString("separate"));
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
				p.setSeparate(rs.getString("separate"));
				return p;
			}
			return null;
		}
	};
	
	@Override
	public List<Photo> list(String type, String separate) {
		String sql = "select * from photo where type = ? and separate = ? order by no desc";
		List<Photo> list =  jdbctemplate.query(sql, mapper, type, separate);
		for(Photo p : list) {
			List<Reply> list2 = replyDao.list(p.getNo(), separate);
			p.setReply(list2);
		}
		return list;
	}

	@Override
	public void insert(String title, String detail, String separate) {
		String sql = "insert into photo values("+separate+".nextval,?,?,sysdate,'photo',?)";
		Object[] obj = {
				title, detail, separate
		};
		jdbctemplate.update(sql,obj);
	}

	@Override
	public int newSeq(String separate) {
		String sql = "select max(no) from photo where separate = ?";
		return jdbctemplate.queryForObject(sql, Integer.class, separate);
	}

	@Override
	public Photo info(int no) {
		String sql = "select * from photo where no = ?";
		return jdbctemplate.query(sql, extractor, no);
	}

	@Override
	public void edit(String title, String detail, String separate, int no) {
		String sql = "update photo set title = ?, detail = ? where separate = ? and no = ?";
		Object[] obj = {
				title, detail, separate, no
		};
		jdbctemplate.update(sql,obj);
		
	}

	@Override
	public void delete(String separate, int no) {
		String sql = "delete photo where separate = ? and no = ?";
		jdbctemplate.update(sql, separate, no);
	}
}
