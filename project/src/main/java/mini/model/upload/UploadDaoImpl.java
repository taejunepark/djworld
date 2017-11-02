package mini.model.upload;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="uploadDao")
public class UploadDaoImpl implements UploadDao{
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	@Override
	public void insert(List<String> list, String type, int no, String separate) {
		for(String filename : list) {
			String sql = "insert into upload values(?,?,?,?)";
			Object[] obj = {
					filename, type, no, separate
			};
			jdbctemplate.update(sql,obj);
		}
	}
}
