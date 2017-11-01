package mini.model.count;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardcountDao {
	int visitorsCount(String id);

	int diaryCount(String id);

	int photoCount(String id);
}
