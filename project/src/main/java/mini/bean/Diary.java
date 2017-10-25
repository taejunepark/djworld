package mini.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Diary {
	private String reg, detail, filename, filetype, separate;
	private int read, filesize;
	
	public Diary(){}
	
	public Diary(ResultSet rs) throws SQLException {
		setReg(rs.getString("reg"));
		setDetail(rs.getString("detail"));
		setFilename(rs.getString("filename"));
		setFiletype(rs.getString("filetype"));
		setSeparate(rs.getString("separate"));
		setRead(rs.getInt("read"));
		setFilesize(rs.getInt("filesize"));
	}
	
	
	@Override
	public String toString() {
		return "Diary [reg=" + reg + ", detail=" + detail + ", filename=" + filename + ", filetype=" + filetype
				+ ", separate=" + separate + ", read=" + read + ", filesize=" + filesize + "]";
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getSeparate() {
		return separate;
	}
	public void setSeparate(String separate) {
		this.separate = separate;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
}
