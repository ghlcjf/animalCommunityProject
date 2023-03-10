package animal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.service.MessageService;
import animal.vo.LoginUserInfo;
import animal.vo.Message;

@Controller
public class MessageController {

	private MessageService messageService;
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	@GetMapping("/message/list")
	public String messageList() {
		
		return "message/messageList";
	}
	
	@RequestMapping("/message/replyForm/{num}")
	public String replyMessageForm(@PathVariable("num") int messageNum,Model model,HttpSession session) {
		
		messageService.readCheckByMessageNum(messageNum);
		Message message = messageService.selectMessageByMessageNum(messageNum);
		// 메세지 안읽은 개수 저장하는 세션
		if(session != null) {
			Object obj = session.getAttribute("userInfo");
			if(obj !=null) {
				LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
				int num = messageService.getUnReadCheck(userInfo.getName());
				session.setAttribute("unReadCheck", num);
				
			}
		}
		
		
		model.addAttribute("message", message);
		return "message/replyMessageForm";
	}
	
	@RequestMapping("/message/sendForm/{receiverName}")
	public String sendMessageForm(@PathVariable("receiverName") String receiverName, Model model,
			HttpSession session) {
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		Message message = new Message();
		message.setReceiverName(receiverName); // 받는 사람
		message.setSenderName(userInfo.getName()); // 보내는 사람
		
		model.addAttribute("message",message);
		
		return "message/sendMessageForm";
	}
	
	
	
}
