package main.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Friend {
	private String rqid;
	private String rcid;
	private String rqtime;
	private String status;
	
	public Friend() {
		super();
	}
	
	public Friend(ResultSet rs) throws SQLException{
		setRqid(rs.getString("rqid"));
		setRcid(rs.getString("rcid"));
		setRqtime(rs.getString("rqtime"));
		setStatus(rs.getString("status"));
	}
	
	public Friend(HttpServletRequest request) {
		setRqid(request.getParameter("rqid"));
		setRcid(request.getParameter("rcid"));
		setRqtime(request.getParameter("rqtime"));
		setStatus(request.getParameter("status"));
	}

	public String getRqid() {
		return rqid;
	}

	public void setRqid(String rqid) {
		this.rqid = rqid;
	}

	public String getRcid() {
		return rcid;
	}

	public void setRcid(String rcid) {
		this.rcid = rcid;
	}

	public String getRqtime() {
		return rqtime;
	}

	public void setRqtime(String rqtime) {
		this.rqtime = rqtime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Friend [rqId=" + rqid + ", rcId=" + rcid + ", rqtime=" + rqtime + ", status=" + status + "]";
	}
}
