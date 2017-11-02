package mini.model.upload;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Diary;

@Repository
public interface UploadDao {
	void insert(List<String> list, int no, String separate);
	boolean overlap(String filename);
	void delete(Diary d);
}
