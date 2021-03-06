package main.model.member;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Member;

@Repository
public interface MemberDao {
	void register(Member m);
	boolean login(Member m);
	Member info(String id);
	boolean pwCheck(String id, String pw);
	boolean pwChange(String id, String pw);
	boolean drop(String id, Member m);
	List<Member> memberList(String id);
	List<Member> search(String key, String id);
	int idCheck(String id);
	int emailCheck(String email);
	String idEmail(String id);
	boolean emailChange(String nowemail, String newemail);
	boolean infoCheck(String id, String name, String email);
	List<Member> allList();
}

