package mini.model.reply;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Reply;

@Repository
public interface ReplyDao {

	void insert(String writer, String detail, int parent, String friend);
	List<Reply> list(int parent, String friend);
	
	void delete(String id, int no);
	void edit(String writer, int no, String detail);
}
