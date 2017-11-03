package mini.bean;

public class BoardCount {
	private int diaryCount;
	private int visitorsCount;
	private int photoCount;
	
	private int diaryTodayCount;
	private int visitorsTodayCount;
	private int photoTodayCount;
	
	public int getDiaryTodayCount() {
		return diaryTodayCount;
	}
	public void setDiaryTodayCount(int diaryTodayCount) {
		this.diaryTodayCount = diaryTodayCount;
	}
	public int getVisitorsTodayCount() {
		return visitorsTodayCount;
	}
	public void setVisitorsTodayCount(int visitorsTodayCount) {
		this.visitorsTodayCount = visitorsTodayCount;
	}
	public int getPhotoTodayCount() {
		return photoTodayCount;
	}
	public void setPhotoTodayCount(int photoTodayCount) {
		this.photoTodayCount = photoTodayCount;
	}
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
