package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.service.MessageService;
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
	
	@RequestMapping("/message/sendForm/{num}")
	public String sendMessageForm(@PathVariable("num") int messageNum,Model model) {
		
		messageService.readCheckByMessageNum(messageNum);
		Message message = messageService.selectMessageByMessageNum(messageNum);
		
		model.addAttribute("message", message);
		return "message/sendMessageForm";
	}
	
	
	
	
	
	
}
