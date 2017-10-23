package main.model.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Member;

@Repository(value="memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Member> mapper = (rs, index)->{
			Member m = new Member();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setBirth(rs.getString("birth"));
			m.setEmail(rs.getString("email"));
			m.setGender(rs.getString("gender"));
			m.setBam(rs.getInt("bam"));
			m.setPower(rs.getString("power"));
			m.setReg(rs.getString("reg"));
			return m;
	};

	public void register(Member m) {
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, 0, '일반', sysdate)";
		int result = jdbcTemplate.update(sql, m.getId(), m.getPw(), m.getName(), m.getPhone(), m.getBirth(), m.getEmail(), m.getGender());
	}
	
	public boolean login(Member m) {
		String sql = "select count(*) from member where id=? and pw=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, m.getId(), m.getPw());
		return result > 0;
	}
	
	public Member info(String id) {
		String sql = "select * from member where id=?";
		// List<Member> list = jdbcTemplate.query(sql, mapper, id);
		// log.debug(list.toString());
		Object[] args = { id };
		Member member = jdbcTemplate.queryForObject(sql, args, mapper);
		return member;
	}
	
	@Override
	public boolean pwCheck(String id, String pw) {
		String sql = "select count(*) from member where id=? and pw=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, id, pw);
		return result > 0;
	}
	
	@Override
	public boolean drop(String id,Member m) {
		String sql = "delete member where id=? and pw=? and phone=? and power!='관리자'";
		return jdbcTemplate.update(sql, id, m.getPw(), m.getPhone()) > 0;
	}

	public List<Member> memberList() {
		String sql = "select * from member where power != '관리자' order by reg";
		return jdbcTemplate.query(sql, mapper);
	}

	public List<Member> search(String key) {
		String sql = "select * from member "
				+ "where power != '관리자' and id like '%'||?||'%' or phone like '%'||?||'%' "
				+ "order by reg";
		return jdbcTemplate.query(sql, mapper, key, key);
	}

	@Override
	public int idCheck(String id) {
		String sql = "select count(*) from member where id=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	@Override
	public int emailCheck(String email) {
		String sql = "select count(*) from member where email=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, email);
	}

	@Override
	public boolean pwChange(String id, String pw) {
		 String sql = "update member set pw=? where id=?";
		return  jdbcTemplate.update(sql, pw, id) > 0;
	}

	@Override
	public String idEmail(String id) {
		String sql = "select email from member where id = ?";
		return jdbcTemplate.queryForObject(sql, String.class, id);
	}

	@Override
	public boolean emailChange(String nowemail, String newemail) {
		String sql = "update member set email=? where email=?";
		return  jdbcTemplate.update(sql, newemail, nowemail) > 0;
	}

	@Override
	public boolean infoCheck(String id, String name, String email) {
		String sql = "select count(*) from member where id = ? and name = ? and email = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id, name, email) > 0;
	}
}
