package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;

public class ReportBoardService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	public List<FreeBoard> reportFreeBoard() {
		
		List<FreeBoard> freeBoard = animalDao.reportFreeBoard();
		
		return freeBoard;
	}
	
	
}
