package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	
	@GetMapping("/messageList")
	public String messageList() {
		
		return "message/messageList";
	}
	
	
	@RequestMapping("/messenger/list")
	public String messengerList() {
		return "성공";
	}
}
