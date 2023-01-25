package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.service.MessageService;
import animal.vo.LoginUserInfo;
import animal.vo.Message;

@RestController
public class MessengerController {
	
	private MessageService messageService;
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}


	@RequestMapping("/messenger/receiveList")
	public List<Message> receiveMessageList(@RequestParam("name") String name) {
		// 닉네임을 이용해 받은 메세지 전부 가져오기
		List<Message> receiveList = messageService.getAllReceiveList(name);
		
		return receiveList;
	}

	
	@RequestMapping("/messenger/sendList")
	public List<Message> sendMessageList(@RequestParam("name") String name){
		// 닉네임을 이용해 보낸 메세지 전부 가져오기
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
	public void deleteReceiveBoxMessage(@RequestParam("messageNum") String messageNum,HttpSession session) {
		
		messageService.deleteReceiveBoxMessage(Integer.parseInt(messageNum));
		// 받은 메세지 삭제 시 읽지 않은 메세지 개수 업데이트
		if(session != null) {
			Object obj = session.getAttribute("userInfo");
			if(obj !=null) {
				LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
				int num = messageService.getUnReadCheck(userInfo.getName());
				session.setAttribute("unReadCheck", num);
				
			}
		}
		
	}
	
	
	
	
	@RequestMapping("/messenger/deleteSendBoxMessage")
	public void deleteSendBoxMessage(@RequestParam("messageNum") String messageNum) {
		
		messageService.deleteSendBoxMessage(Integer.parseInt(messageNum));
		
		
	}
	
}
