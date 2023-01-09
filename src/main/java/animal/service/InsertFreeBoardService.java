package animal.service;

import org.springframework.beans.factory.annotation.Autowired;

import animal.dao.AnimalDao;
import animal.vo.FreeBoardCommand;

public class InsertFreeBoardService {
	// 자유게시판 글 등록 
	
	
	
	private AnimalDao animalDao;
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	public void insertFreeBoard(FreeBoardCommand bc) {
		
		animalDao.insertFreeBoard(bc);
		
		
	}
	

}
