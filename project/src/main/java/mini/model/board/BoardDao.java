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
	void edit(String title, String detail, String separate, int no);
	void delete(String separate, int no);
}
