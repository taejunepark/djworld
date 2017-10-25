package main.model.friend;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Member;

@Repository
public interface FriendDao {
	void request(String rqId, String rcId);
	String requestCheck(String rqId, String rcId) ;
	void cancel(String rqId, String rcId);
	List<Member> requestList(String id);
}
