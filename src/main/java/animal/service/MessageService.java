package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.Message;

public class MessageService {

	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public int getUnReadCheck(String receiverName) {
		return animalDao.getUnReadCheck(receiverName);
	}


	public List<Message> getAllReceiveList(String receiverName) {
		
		return animalDao.selectAllReceiveList(receiverName);
	}


	public List<Message> getAllSendLsit(String senderName) {
		return animalDao.selectAllSendList(senderName);
	}



	public void readCheckByMessageNum(int messageNum) {
		animalDao.readCheckByMessageNum(messageNum);
	}


	public Message selectMessageByMessageNum(int messageNum) {
		return animalDao.selectMessageByMessageNum(messageNum);
	}


	public void sendMessage(Message message) {
		animalDao.sendMessage(message);
	}


	public void deleteReceiveBoxMessage(int messageNum) {
		animalDao.deleteReceiveBoxMessage(messageNum);
	}


	public void deleteSendBoxMessage(int messageNum) {
		animalDao.deleteSendBoxMessage(messageNum);
		
	}
	
}
