package mini.model.reply;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Reply;

@Repository
public interface ReplyDao {

	void insert(String writer, String detail, int parent);
	List<Reply> list(int parent);
	
}
