package mini.model.photo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
			p.setRead(rs.getInt("read"));
			p.setReplycount(rs.getInt("reply"));
			p.setType(rs.getString("type"));
			p.setSeparate(rs.getString("separate"));
			return p;
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
		String sql = "insert into photo values("+separate+".nextval,?,?,sysdate,0,0,'photo',?)";
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
}
