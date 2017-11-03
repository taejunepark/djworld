package mini.model.board;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Board;

@Repository
public interface BoardDao {
	void insert(Board b);
	int newSeq(String separate);
	List<Board> list(String type, String separate);
	Board info(int no, String separate);
}
