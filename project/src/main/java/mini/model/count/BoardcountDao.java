package mini.model.count;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardcountDao {
	int visitorsCount(String id);
	int visitorsTodayCount(String id);
	
	int diaryCount(String id);
	int diaryTodayCount(String id);

	int photoCount(String id);
	int photoTodayCount(String id);
}
