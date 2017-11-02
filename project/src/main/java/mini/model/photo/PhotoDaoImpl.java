package mini.model.photo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mini.bean.Photo;

@Repository(value="photoDao")
public class PhotoDaoImpl implements PhotoDao {
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	private RowMapper<Photo> mapper = new RowMapper<Photo>() {
		@Override
		public Photo mapRow(ResultSet rs, int index) throws SQLException {
			Photo p = new Photo();
			p.setNo(rs.getInt("no"));
			p.setDetail(rs.getString("detail"));
			p.setReg(rs.getString("reg"));
			p.setRead(rs.getInt("read"));
			p.setReply(rs.getInt("reply"));
			p.setType(rs.getString("type"));
			p.setSeparate(rs.getString("separate"));
			return p;
		}
	};
	
	@Override
	public List<Photo> list(String type, String separate) {
		String sql = "select * from photo where type = ? and separate = ?";
		return jdbctemplate.query(sql, mapper, type, separate);
	}
}
