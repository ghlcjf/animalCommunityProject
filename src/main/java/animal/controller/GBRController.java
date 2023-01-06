package animal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;

@RestController
public class GBRController {

	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	

	@RequestMapping("/good/{boardNum}")   //  http://localhost:8085/animalCommunity/good/4
	public int good(@PathVariable("boardNum") long boardNum) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
		animalDao.addGoodCount(updateFreeBoard);
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		int num = freeBoard.getGood();
		
		return num;
		// request.getRequestDispatcher("/freeBoard/readFreeBoard/"+boardNum).forward(request, response);
	}
	
	
	@RequestMapping("/bad/{boardNum}")   //  http://localhost:8085/animalCommunity/good/4
	public int bad(@PathVariable("boardNum") long boardNum) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
		animalDao.addBadCount(updateFreeBoard);
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		int num = freeBoard.getBad();
		
		return num;
		// request.getRequestDispatcher("/freeBoard/readFreeBoard/"+boardNum).forward(request, response);
	}
	
	@RequestMapping("/report/{boardNum}")   //  http://localhost:8085/animalCommunity/good/4
	public int report(@PathVariable("boardNum") long boardNum) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
		animalDao.addReportCount(updateFreeBoard);
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		int num = freeBoard.getReport();
		
		return num;
		// request.getRequestDispatcher("/freeBoard/readFreeBoard/"+boardNum).forward(request, response);
	}
	
	
	
}
