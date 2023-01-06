package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import animal.vo.Issue;

@Controller
public class IssueWriteController {
	
	@GetMapping("/issueWrite")
	public String issueWrite(Model model) {
		
		model.addAttribute("issue",new Issue());
		
		return "/issueWriteForm";
	}
}
