package mini.model.upload;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import mini.bean.Diary;
import mini.bean.Upload;

@Repository(value="uploadDao")
public class UploadDaoImpl implements UploadDao{
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	private ResultSetExtractor<Upload> extractor = new ResultSetExtractor<Upload>() {
		@Override
		public Upload extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				Upload u = new Upload();
				u.setFilename(rs.getString("filename"));
				u.setType(rs.getString("type"));
				u.setNo(rs.getInt("no"));
				u.setSeparate(rs.getString("separate"));
				return u;
			}
			
			return null;
		}
	};
	
	@Override
	public void insert(List<String> list, int no, String separate) {
		for(String filename : list) {
			if(overlap(filename))
				continue;
			String sql = "insert into upload values(?,?,?)";
			Object[] obj = {
					filename, no, separate
			};
			jdbctemplate.update(sql,obj);
		}
	}

	@Override
	public boolean overlap(String filename) {
		String sql = "select * from upload where filename = ?";
		Upload u = jdbctemplate.query(sql, extractor, filename);
		return (u!=null)?true:false;
	}

	@Override
	public void delete(Diary d) {
		String sql = "delete upload where separate = ? and no = ?";
		Object[] obj = {
				d.getSeparate(), d.getNo()
		};
		jdbctemplate.update(sql,obj);
	}
}
 