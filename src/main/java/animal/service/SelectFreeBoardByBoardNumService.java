package animal.service;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;

public class SelectFreeBoardByBoardNumService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	public FreeBoard selectFreeBoardByBoardNum(long boardNum) {
		
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
		
		return freeBoard;
	}
	

}
