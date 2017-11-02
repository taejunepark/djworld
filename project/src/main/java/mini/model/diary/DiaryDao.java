package mini.model.diary;

import org.springframework.stereotype.Repository;

import mini.bean.Diary;

@Repository
public interface DiaryDao {
	void insert(Diary d);
	void edit(Diary d);
	Diary info(String reg, String separate);
	void delete(String reg);
}
