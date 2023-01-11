package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.HospitalInfo;
import animal.vo.HospitalInfoCommand;


public class HospitalInfoService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	public List<HospitalInfo> selectAllHospitalInfoList(){
		
		List<HospitalInfo> hospitalInfoList = animalDao.selectAllHospital();
		
		return hospitalInfoList;
	}
	
	public void insertHospitalInfo(HospitalInfoCommand hospitalInfoCommand) {
		
		animalDao.insertHospitalInfo(hospitalInfoCommand);
		
		
	}



	public HospitalInfo selectHospitalInfoByBoardNum(long boardNum) {
		
		return animalDao.selectByHospitalNum(boardNum);
	}



	public void updateHospitalInfo(HospitalInfoCommand hospitalInfoCommand) {
		animalDao.updateHospitalInfo(hospitalInfoCommand);
	}



	public void deleteHospitalInfoByBoardNum(long boardNum) {
		animalDao.deleteHospitalInfoByBoardNum(boardNum);
	}
	

}
