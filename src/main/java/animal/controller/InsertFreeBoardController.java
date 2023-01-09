package animal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import animal.service.InsertFreeBoardService;
import animal.validator.FreeBoardCommandValidator;
import animal.vo.FreeBoardCommand;
import animal.vo.LoginUserInfo;


@Controller
public class InsertFreeBoardController {
	
	private InsertFreeBoardService insertFreeBoardService;
	
	public void setInsertFreeBoardService(InsertFreeBoardService insertFreeBoardService) {
		this.insertFreeBoardService = insertFreeBoardService;
	}
	
	private final String uploadDir = "";
	

	@GetMapping("/freeBoard/insertFreeBoardForm")
	public String insertFreeBoardForm(Model model, HttpSession session) {
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		
		if(userInfo ==null) {
			return "redirect:/login";
		}
		
		model.addAttribute("freeBoardCommand", new FreeBoardCommand());
		
		return "freeBoard/insertFreeBoardForm";
	}
	
	@PostMapping("/freeBoard/insertFreeBoard")
	public String insertFreeBoard(@ModelAttribute("freeBoardCommand") FreeBoardCommand bc,
			Errors errors,HttpSession session, MultipartHttpServletRequest request,
			@RequestParam MultipartFile file) {
		
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		bc.setName(userInfo.getName());
		
		new FreeBoardCommandValidator().validate(bc, errors);
		
		if(errors.hasErrors()) {
			return "redirect:/freeBoard/insertFreeBoardForm";
		}
		
		
		insertFreeBoardService.insertFreeBoard(bc);
		
		
		
		return "freeBoard/freeBoardSuccess";
	}

}
