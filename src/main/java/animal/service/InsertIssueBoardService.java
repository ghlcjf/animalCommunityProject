package animal.service;

import animal.dao.AnimalDao;
import animal.vo.IssueBoardCommand;

public class InsertIssueBoardService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public void insertIssueBoard(IssueBoardCommand issueBoardCommand) {
		
		
		animalDao.insertIssueBoard(issueBoardCommand);
		
	}
	
	
}
