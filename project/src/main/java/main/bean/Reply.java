package main.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Reply {
	private int no;
	private String writer;
	private String detail;
	private String reg;
	private int parent;
	
	public Reply(HttpServletRequest request) {
			String no = request.getParameter("no");
			setNo(no==null?0:Integer.parseInt(no));
			setWriter(request.getParameter("writer"));
			setDetail(request.getParameter("detail"));
			setReg(request.getParameter("reg"));
			String parent = request.getParameter("parent");
			setParent(parent==null?0:Integer.parseInt(parent));
	}

	public Reply(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setWriter(rs.getString("writer"));
		setDetail(rs.getString("detail"));
		setReg(rs.getString("reg"));
		setParent(rs.getInt("parent"));
}
	
	public Reply() {
		super();
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
	
	public String getWeb() {
		return detail.replace("\n", "<br>");
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return "Reply [no=" + no + ", writer=" + writer + ", detail=" + detail + ", reg=" + reg
				+ ", parent=" + parent + "]";
	}
}
