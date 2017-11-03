package mini.model.visitors;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Visitors;

@Repository
public interface VisitorsDao {

	void write(String writer, String detail, String id);

	List<Visitors> list(String id);

	void delete(String id, int no);

	void edit(String id, int no, String detail);

	// 최근 방명록
	String detail(String id);
}
