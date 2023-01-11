package animal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.SectionPage;

public class FreeBoardService {
	// 자유게시판 글 등록 
	
	
	
	private AnimalDao animalDao;
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	public void insertFreeBoard(FreeBoardCommand bc) {
		
		animalDao.insertFreeBoard(bc);
		
		
	}



	public void updateFreeBoard(FreeBoardCommand freeBoardCommand) {
		
	
		
		animalDao.updateFreeBoard(freeBoardCommand);
		
	}
	
	public FreeBoard selectFreeBoardByBoardNum(long BoardNum) {
		
		return animalDao.selectByFreeBoardNum(BoardNum);
	}



	public void deleteFreeBoardByBoardNum(long boardNum) {
		animalDao.boardDelete(boardNum);
	}



	public int selectAllNumFreeBoard() {
		return animalDao.selectAllNumFreeBoard();
	}
	public int selectAnimalNumFreeBoard(SectionPage sectionPage) {
		return animalDao.selectAnimalNumFreeBoard(sectionPage);
	}
	
	


	public List<FreeBoard> selectTargetFreeBoards(SectionPage sectionPage) {
		
		return animalDao.selectTargetFreeBoards(sectionPage);
	}



	public List<FreeBoard> selectAnimalTargetFreeBoards(SectionPage sectionPage) {
		// TODO Auto-generated method stub
		return animalDao.selectAnimalTargetFreeBoards(sectionPage);
	}



	



	
	

}
