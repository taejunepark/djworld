package mini.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class Visitors {
	private int no;
	private String name;
	private String writer;
	private String reg;
	private String detail;
	private String type;
	private String friend;
	private List<Reply> reply;
	private String profile;
	
	public Visitors() {
		super();
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}

	public String getFriend() {
		return friend;
	}

	public void setFriend(String friend) {
		this.friend = friend;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReg() {
		return reg;
	}
	public String getTime() {
		return reg.substring(0, 16);
	}
	public String getDate() {
		return reg.substring(0, 10);
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Visitors(ResultSet rs) throws SQLException{
		setNo(rs.getInt("no"));
		setWriter(rs.getString("writer"));
		setReg(rs.getString("reg"));
		setDetail(rs.getString("detail"));
		setType(rs.getString("type"));
		setFriend(rs.getString("friend"));
	}
	
	public Visitors(HttpServletRequest request) {
		String no = request.getParameter("no");
		setNo(no==null?0:Integer.parseInt(no));
		setWriter(request.getParameter("writer"));
		setReg(request.getParameter("reg"));
		setDetail(request.getParameter("detail"));
		setType(request.getParameter("type"));
		setFriend(request.getParameter("friend"));
	}
	
	@Override
	public String toString() {
		return "Visitors [no=" + no + ", writer=" + writer + ", reg=" + reg + ", detail=" + detail + ", type=" + type
				+ ", friend=" + friend + ", reply=" + reply + ", profile=" + profile + "]";
	}
}
