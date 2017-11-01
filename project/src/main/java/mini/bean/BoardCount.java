package mini.bean;

public class BoardCount {
	private int diaryCount;
	private int visitorsCount;
	private int photoCount;
	
	public int getDiaryCount() {
		return diaryCount;
	}
	public void setDiaryCount(int diaryCount) {
		this.diaryCount = diaryCount;
	}
	public int getVisitorsCount() {
		return visitorsCount;
	}
	public void setVisitorsCount(int visitorsCount) {
		this.visitorsCount = visitorsCount;
	}
	public int getPhotoCount() {
		return photoCount;
	}
	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}
	@Override
	public String toString() {
		return "BoardCount [diaryCount=" + diaryCount + ", visitorsCount=" + visitorsCount + ", photoCount="
				+ photoCount + "]";
	}
}
