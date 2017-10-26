package main.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.Format;

public class Content {
	private String title;
	private String savename;
	private String filename;
	private String filetype;
	private long filelen;
	private String reg;
	public Content(ResultSet rs) throws SQLException{
		setTitle(rs.getString("title"));
		setSavename(rs.getString("savename"));
		setFilename(rs.getString("filename"));
		setFiletype(rs.getString("filetype"));
		setFilelen(rs.getLong("filelen"));
		setReg(rs.getString("reg"));
	}
	public Content() {
		super();
	}
	@Override
	public String toString() {
		return "Content [title=" + title + ", savename=" + savename + ", filename=" + filename + ", filetype="
				+ filetype + ", filelen=" + filelen + ", reg=" + reg + "]";
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
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
	public long getFilelen() {
		return filelen;
	}
	public void setFilelen(long filelen) {
		this.filelen = filelen;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getLength() {
		//1024 미만이면 byte로 출력
		//1024(1kb) 이상 1024*1024(1mb) 미만일 경우 KB로 출력
		//나머지는 mb로 출력(gb 추가해도 됨)
		Format f = new DecimalFormat("#,###.##");
		if(filelen < 1024L) {
			return f.format(filelen)+" bytes";
		}
		else if(filelen < 1024L * 1024L) {
			return f.format(filelen / 1024.0) + " KB";
		}
		else if(filelen < 1024L * 1024L * 1024L) {
			return f.format(filelen / 1024.0 / 1024.0) + " MB";
		}
		else {
			return f.format(filelen / 1024.0 / 1024.0 / 1024.0) + " GB";
		}
	}
}
