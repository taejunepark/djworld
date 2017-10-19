package main.model.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="findDao")
public class FindDaoImpl implements FindDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public String idFind(String name, String email) {
		String sql = "select id from member where name=? and email=?";
		String id = jdbcTemplate.queryForObject(sql, String.class, name, email);
		return id;
	}

	public String pwFind(String id, String name, String email) {
		String tempPW = StringUtil.createRandomString(10);
		String sql = "update member set pw=? where id=? and name=? and email=?";
		jdbcTemplate.update(sql, tempPW, id, name, email);
		return tempPW;
	}

}
