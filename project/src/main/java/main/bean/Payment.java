package main.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Payment {
	private String tid;
	private String buyid;
	private int amount;
	private String reg;
	private String method;
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getBuyid() {
		return buyid;
	}
	public void setBuyid(String buyid) {
		this.buyid = buyid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	
	public Payment(ResultSet rs) throws SQLException{
		setTid(rs.getString("tid"));
		setBuyid(rs.getString("buyid"));
		setAmount(rs.getInt("amount"));
		setReg(rs.getString("reg"));
		setMethod(rs.getString("method"));
	}
	
	public Payment(HttpServletRequest request) {
		setTid(request.getParameter("tid"));
		setBuyid(request.getParameter("buyid"));
		String amount = request.getParameter("amount");
		setAmount(amount==null?0:Integer.parseInt(amount));
		setReg(request.getParameter("reg"));
		setMethod(request.getParameter("method"));
	}
	@Override
	public String toString() {
		return "Payment [tid=" + tid + ", buyid=" + buyid + ", amount=" + amount + ", reg=" + reg + ", method=" + method
				+ "]";
	}
}
