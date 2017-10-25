package main.model.friend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Friend;
import main.bean.Member;
import main.model.member.MemberDao;

@Repository(value = "friendDao")
public class FriendDaoImpl implements FriendDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MemberDao memberDao;
	
	private RowMapper<Friend> mapper = (rs, index)->{
		Friend f = new Friend();
		f.setRcid(rs.getString("rcid"));
		f.setRqid(rs.getString("rqid"));
		f.setRqtime(rs.getString("rqtime"));
		f.setStatus(rs.getString("status"));
		return f;
};
	
	public void request(String rqId, String rcId) {
		String sql = "insert into friend values(?, ?, sysdate, 'wait')";
		jdbcTemplate.update(sql, rqId, rcId);
	}

	@Override
	public String requestCheck(String rqId, String rcId) {
		String sql = "select status from friend where rqid = ? and rcid = ?";
		String result = null;
		try {
			result = jdbcTemplate.queryForObject(sql, String.class, rqId, rcId);
		} catch (DataAccessException e) {
			result = (result == null) ? "일촌 신청하기" : result;
		}
		return result;
	}

	@Override
	public void cancel(String rqId, String rcId) {
		String sql = "delete friend where rqId = ? and rcId = ?";
		jdbcTemplate.update(sql, rqId, rcId);
	}

	@Override
	public List<Member> requestList(String id) {
		String sql = "select rqid from friend where rcid = ? and status='wait'";
		List<Friend> list =  jdbcTemplate.query(sql, mapper);
		List<Member> list2 = new ArrayList<>();
		for(Friend f : list) {
			 list2.add(memberDao.info(f.getRqid()));
		}
		System.out.println(list2);
		return list2;
	}
}
