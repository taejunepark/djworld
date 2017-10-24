package mini.model.visitors;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Visitors;

@Repository
public interface VisitorsDao {

	void write(String detail, String writer);

	List<Visitors> list();
	
}
