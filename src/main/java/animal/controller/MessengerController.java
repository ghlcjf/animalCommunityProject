package animal.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.service.MessageService;
import animal.vo.Message;

@RestController
public class MessengerController {
	
	private MessageService messageService;
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}


	@RequestMapping("/messenger/receiveList")
	public List<Message> receiveMessageList(@RequestParam("name") String name) {
		
		List<Message> receiveList = messageService.getAllReceiveList(name);
		
		
		return receiveList;
	}

	
	@RequestMapping("/messenger/sendList")
	public List<Message> sendMessageList(@RequestParam("name") String name){
		
		List<Message> sendList = messageService.getAllSendLsit(name);
		return sendList;
		
	}
	
	@RequestMapping("/messenger/sendMessage")
	public void sendMessage(@RequestParam("senderName") String senderName,
			@RequestParam("receiverName") String receiverName,
			@RequestParam("content") String messageContent) {
		

		Message message = new Message();
		message.setSenderName(senderName);
		message.setReceiverName(receiverName);
		message.setMessageContent(messageContent);
		messageService.sendMessage(message);
		
	}
	
	
	@RequestMapping("/messenger/deleteReceiveBoxMessage")
	public void deleteReceiveBoxMessage(@RequestParam("messageNum") String messageNum) {
		
		messageService.deleteReceiveBoxMessage(Integer.parseInt(messageNum));
		
		
	}
	
	
	
	
	@RequestMapping("/messenger/deleteSendBoxMessage")
	public void deleteSendBoxMessage(@RequestParam("messageNum") String messageNum) {
		
		messageService.deleteSendBoxMessage(Integer.parseInt(messageNum));
		
		
	}
	
}
