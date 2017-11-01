package mini.model.total;

import org.springframework.stereotype.Repository;

@Repository
public interface TotalDao {
	void plus(String id);

	int count(String id);

}
