package main.model.image;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.bean.Content;


@Repository
public interface ImageBoardDao {
	//3가지 : 추가, 목록, 1개정보 추출
	boolean insert(String id, String savename);
	List<Content> list();
	Content get(String savename);
}
