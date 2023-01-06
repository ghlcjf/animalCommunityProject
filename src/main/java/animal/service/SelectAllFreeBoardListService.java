package animal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;

public class SelectAllFreeBoardListService {
	
	private AnimalDao animalDao;
	
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public List<FreeBoard> selectAllFreeBoardList(){
		
		List<FreeBoard> freeBoardList = animalDao.selectAllFreeBoardList();
		
		return freeBoardList;
	}
	
	

}
