package animal.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessengerController {
	
	
	@RequestMapping("/messenger/list")
	public String messengerList() {
		return "성공";
	}

}
