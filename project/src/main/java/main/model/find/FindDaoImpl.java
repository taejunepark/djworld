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

	public void pwFind(String id, String name, String email, String tempPw) {
		String sql = "update member set pw=? where id=? and name=? and email=?";
		System.out.println("업데이트 실행");
		jdbcTemplate.update(sql, tempPw, id, name, email);
	}
}
