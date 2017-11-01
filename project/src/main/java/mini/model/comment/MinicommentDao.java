package mini.model.comment;

import org.springframework.stereotype.Repository;

@Repository
public interface MinicommentDao {

	void insert(String id, String comment);

	String check(String id);

	void update(String id, String comment);

}
