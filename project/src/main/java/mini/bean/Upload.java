package mini.bean;

public class Upload {
	private String filename, type, separate;
	private int no;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
		return "Upload [filename=" + filename + ", type=" + type + ", separate=" + separate + ", no=" + no + "]";
	}
	
	
}
