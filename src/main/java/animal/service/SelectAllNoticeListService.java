package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;

public class SelectAllNoticeListService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public List<FreeBoard> selectAllNoticeList(){
		
		List<FreeBoard> noticeList = animalDao.selectAllNoticeList();
		
		return noticeList;
	}
	
	
	
}
