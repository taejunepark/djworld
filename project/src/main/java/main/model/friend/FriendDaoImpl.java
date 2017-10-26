package main.model.friend;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.AllList;
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
		f.setRqid(rs.getString("rqid"));
		f.setRcid(rs.getString("rcid"));
		f.setRqtime(rs.getString("rqtime"));
		f.setStatus(rs.getString("status"));
		return f;
	};
	
	private RowMapper<AllList> mapper2 = (rs, index)->{
		AllList l = new AllList();
		l.setA(rs.getString("rqid"));
		l.setB(rs.getString("rcid"));
		return l;
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
			result = (result == null) ? "일촌 신청" : result;
		}
		return result;
	}
	
	@Override
	public String sendCheck(String rqId, String rcId) {
		String sql = "select status from friend where rqid = ? and rcid = ?";
		String result = null;
		try {
			result = jdbcTemplate.queryForObject(sql, String.class, rcId, rqId);
		} catch (DataAccessException e) {
			result = (result == null) ? "일촌 신청" : result;
		}
		return result;
	}

	@Override
	public void cancel(String rqId, String rcId) {
		String sql = "delete friend where rqid = ? and rcid = ?";
		jdbcTemplate.update(sql, rqId, rcId);
	}
	
	@Override
	public List<Member> allList(String id) {
		String sql = "select rqid, rcid from friend where (rqid=? and status='accept')"
				+ " or (rcid=? and status='accept')";
		List<AllList> list =  jdbcTemplate.query(sql, mapper2, id, id);
		List<Member> list2 = new ArrayList<>();
		Set<String> list3 = new HashSet();
		for(int i = 0; i < list.size(); i++) {
			if(!list.get(i).getA().equals(id)) {
				list3.add(list.get(i).getA());
			}
			if(!list.get(i).getB().equals(id)) {
				list3.add(list.get(i).getB());
			}
		}
		for(String s : list3) {
			 list2.add(memberDao.info(s));
		}
		return list2;
	}

	@Override
	public List<Member> requestList(String id) {
		String sql = "select * from friend where rcid = ? and status='wait'";
		List<Friend> list =  jdbcTemplate.query(sql, mapper, id);
		List<Member> list2 = new ArrayList<>();
		for(Friend f : list) {
			 list2.add(memberDao.info(f.getRqid()));
		}
		return list2;
	}

	@Override
	public List<Member> sendList(String id) {
		String sql = "select * from friend where rqid = ? and status='wait'";
		List<Friend> list =  jdbcTemplate.query(sql, mapper, id);
		List<Member> list2 = new ArrayList<>();
		for(Friend f : list) {
			 list2.add(memberDao.info(f.getRcid()));
		}
		return list2;
	}

	@Override
	public void agree(String rqid, String rcid) {
		String sql = "update friend set status='accept' where rqid = ? and rcid = ?";
		jdbcTemplate.update(sql, rqid, rcid);
	}

	@Override
	public boolean listCheck(String id) {
		String sql = "select count(*) from friend where rqid=? and status='accept' or rcid=? and status='accept'";
		return jdbcTemplate.queryForObject(sql, Integer.class, id, id) > 0;
	}

	@Override
	public void drop(String myid, String id) {
		String sql = "delete friend where (rqid = ? and rcid =?) or (rqid = ? and rcid = ?)";
		jdbcTemplate.update(sql, myid, id, id, myid);
	}

	
}
