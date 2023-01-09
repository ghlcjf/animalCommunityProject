package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerController {
	
	@GetMapping("/manager/managerMain")
	public String manager() {
		
		return "manager/managerMain";
	}
	
	
}
