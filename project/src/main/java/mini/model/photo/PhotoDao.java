package mini.model.photo;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Photo;

@Repository
public interface PhotoDao {
	List<Photo> list(String type, String separate);
	void insert(String title, String detail, String separate);
	Photo info(int no);
	int newSeq(String separate);
	void edit(String title, String detail, String separate, int no);
	void delete(String separate, int no);
	String title(String id);
}
