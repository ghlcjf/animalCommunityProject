package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.Issue;
import animal.vo.IssueBoardCommand;

public class IssueBoardService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	
	public List<Issue> selectAllIssueBoardList(){
		
		List<Issue> issueBoardList = animalDao.selectAllIssueList();
		
		return issueBoardList;
		
	}
	
	
	public void insertIssueBoard(IssueBoardCommand issueBoardCommand) {
		
		
		animalDao.insertIssueBoard(issueBoardCommand);
		
	}
	
	public Issue selectIssueBoardByBoardNum(long issueNum) {
		Issue issueBoard = animalDao.selectByIssue(issueNum);
		
		return issueBoard;
	}




	public void updateIssueBoard(IssueBoardCommand issueBoardCommand) {
		
		animalDao.updateIssueBoard(issueBoardCommand);
		
	}




	public void deleteIssueBoardByBoardNum(long issueNum) {
		
		animalDao.deleteIssueBoardByBoardNum(issueNum);
		
	}

}
