package animal.controller;



import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;

@RestController
public class GBRController {
	// 추천, 반대, 신고 수를 올리는 레스트컨트롤러
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	

	@RequestMapping("/good/{boardNum}")   
	public int good(@PathVariable("boardNum") long boardNum) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
		animalDao.addGoodCount(updateFreeBoard);
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		int num = freeBoard.getGood();
		
		return num;
	}
	
	
	@RequestMapping("/bad/{boardNum}")   
	public int bad(@PathVariable("boardNum") long boardNum) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
		animalDao.addBadCount(updateFreeBoard);
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		int num = freeBoard.getBad();
		
		return num;
	}
	
	@RequestMapping("/report/{boardNum}")   
	public int report(@PathVariable("boardNum") long boardNum) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
		animalDao.addReportCount(updateFreeBoard);
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		int num = freeBoard.getReport();
		
		return num;
	}
	
	
	
}
