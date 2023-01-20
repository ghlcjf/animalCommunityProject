package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;
import animal.vo.SectionPage;

public class SelectAllNoticeListService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public List<FreeBoard> selectAllNoticeList(){
		
		List<FreeBoard> noticeList = animalDao.selectAllNoticeList();
		
		return noticeList;
	}


	public int selectAllNoticeNum() {
		
		return animalDao.selectAllNoticeNum();
	}


	public List<FreeBoard> selectTargetNoticeList(SectionPage sectionPage) {
		
		return animalDao.selectTargetNoticeList(sectionPage);
	}
	
	
	
}
