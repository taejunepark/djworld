package main.model.friend;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Member;

@Repository
public interface FriendDao {
	// 요청
	void request(String rqId, String rcId);
	
	// 요청상태
	String requestCheck(String rqId, String rcId) ;
	
	// 전송상태
	String sendCheck(String rqId, String rcId) ;
	
	// 요청취소
	void cancel(String rqId, String rcId);
	
	// 일촌 리스트
	List<Member>  allList(String id);
	
	// 요청받은 리스트
	List<Member> requestList(String id);
	
	// 요청한 리스트
	List<Member> sendList(String id);
	
	// 수락
	void agree(String rqid, String rcid);

	// 일촌이 있는지
	boolean listCheck(String id);

	void drop(String myid, String id);
}