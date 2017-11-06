package mini.bean;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Board {
	private int no, read, reply;
	private String writer, title, detail, reg, type, owner;
	private List<Reply> replyList;
	
	
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getReg() {
		return reg.substring(0, reg.lastIndexOf('.'));
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getDate() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return reg.substring(0, 10).equals(today)?reg.substring(11, reg.lastIndexOf('.')):reg.substring(0, 10);
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", read=" + read + ", reply=" + reply + ", writer=" + writer + ", title=" + title
				+ ", detail=" + detail + ", reg=" + reg + ", type=" + type + ", owner=" + owner + ", replyList="
				+ replyList + "]";
	}
	
}
