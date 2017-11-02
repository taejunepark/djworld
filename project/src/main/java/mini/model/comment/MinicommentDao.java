package mini.model.comment;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Friendcomment;

@Repository
public interface MinicommentDao {

	void insert(String id, String comment);

	String check(String id);

	void update(String id, String comment);

	void friendCommentInsert(String writer, String id, String comment);

	List<Friendcomment> friendCommentList(String id);

}
