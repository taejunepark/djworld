package mini.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Friendcomment {
	private String writer;
	private String owner;
	private String friendComment;
	private String reg;
	private String name;
	public Friendcomment() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getFriendComment() {
		return friendComment;
	}

	public void setFriendComment(String friendComment) {
		this.friendComment = friendComment;
	}
	public String getTime() {
		return reg.substring(0, 16);
	}
	public String getDate() {
		return reg.substring(0, 10);
	}
	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public Friendcomment(HttpServletRequest request) {
		setWriter(request.getParameter("writer"));
		setOwner(request.getParameter("owner"));
		setFriendComment(request.getParameter("friendcomment"));
		setReg(request.getParameter("reg"));
	}

	public Friendcomment(ResultSet rs) throws SQLException {
		setWriter(rs.getString("writer"));
		setReg(rs.getString("reg"));
		setOwner(rs.getString("owner"));
		setReg(rs.getString("reg"));
	}
	@Override
	public String toString() {
		return "Friendcomment [writer=" + writer + ", owner=" + owner + ", friendComment=" + friendComment + ", reg="
				+ reg + "]";
	}
	
}
