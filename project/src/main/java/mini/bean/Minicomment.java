package mini.bean;

public class Minicomment {
	private String owner_id;
	private String minicomment;
	private String reg;
	
	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	public String getMinicomment() {
		return minicomment;
	}

	public void setMinicomment(String minicomment) {
		this.minicomment = minicomment;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	@Override
	public String toString() {
		return "Minicomment [owner_id=" + owner_id + ", minicomment=" + minicomment + ", reg=" + reg + "]";
	}
}
