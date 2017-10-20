package main.model.member;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Member;

@Repository
public interface MemberDao {
	void register(Member m);
	boolean login(Member m);
	Member info(String id);
	boolean edit(Member m);
	boolean pwCheck(String id, String pw);
	boolean drop(String id, Member m);
	List<Member> memberList();
	List<Member> search(String key);
	int idCheck(String id);
	int emailCheck(String email);
}