package mini.bean;

import java.util.List;

public class Photo {
	private int no;
	private String title, detail, reg, separate, type;
	private List<Reply> reply;
	@Override
	public String toString() {
		return "Photo [no=" + no + ", title=" + title + ", detail=" + detail + ", reg=" + reg + ", separate=" + separate
				+ ", type=" + type + ", reply=" + reply + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getSeparate() {
		return separate;
	}
	public void setSeparate(String separate) {
		this.separate = separate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<Reply> getReply() {
		return reply;
	}
	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}
	
	
}
