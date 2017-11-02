package mini.model.count;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardcountDao {
	int visitorsCount(String id);
	int visitorsTodayCount();
	
	int diaryCount(String id);
	int diaryTodayCount();

	int photoCount(String id);
	int photoTodayCount();
}
