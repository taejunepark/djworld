package mini.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Diary {
	private String reg, detail, separate, type;
	private int no, read;
	
	public Diary(){}
	
	public Diary(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setReg(rs.getString("reg"));
		setDetail(rs.getString("detail"));
		setSeparate(rs.getString("separate"));
		setRead(rs.getInt("read"));
		setType(rs.getString("type"));
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	@Override
	public String toString() {
		return "Diary [reg=" + reg + ", detail=" + detail + ", separate=" + separate + ", type=" + type + ", no=" + no
				+ ", read=" + read + "]";
	}
	
}
