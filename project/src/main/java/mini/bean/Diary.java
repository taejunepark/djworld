package mini.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Diary {
	private String reg, detail, type, separate;
	private int no;
	
	public Diary(){}
	
	public Diary(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setReg(rs.getString("reg"));
		setDetail(rs.getString("detail"));
		setSeparate(rs.getString("separate"));
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSeparate() {
		return separate;
	}

	public void setSeparate(String separate) {
		this.separate = separate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "Diary [reg=" + reg + ", detail=" + detail + ", type=" + type + ", separate=" + separate + ", no=" + no
				+ "]";
	}
	
}
