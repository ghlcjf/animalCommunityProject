package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.Image;
import animal.vo.ImageCommand;

public class ImageService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	public List<Image> selectAllImageList() {
		return animalDao.selectAllImageList();
	}

	public void insertImage(ImageCommand imageCommand) {
		animalDao.insertImage(imageCommand);
	}

	public Image selectImageByBoardNum(long imageNum) {
		return animalDao.selectImageByBoardNum(imageNum);
	}

	public void updateImage(ImageCommand imageCommand) {
		animalDao.updateImage(imageCommand);
	}

	public void deleteImageByBoardNum(long imageNum) {
		animalDao.deleteImageByBoardNum(imageNum);
	}
	

}
