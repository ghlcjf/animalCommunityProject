package animal.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String insertFreeBoard(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session
			) throws Exception, IOException {
		
		String uploadDir = "C:\\source\\workspace-spring\\animalCommunityProject\\src\\main\\webapp\\resources\\freeBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            String fullPath = uploadDir + filename;
            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	freeBoardCommand.setBoardUrl("null");
        }
		
		
		
		// bc에 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		freeBoardCommand.setName(userInfo.getName());
		
		
		System.out.println(freeBoardCommand.getBoardUrl());
		System.out.println(freeBoardCommand.getBoardContent());
		System.out.println(freeBoardCommand.getBoardCategory());
		System.out.println(freeBoardCommand.getName());
		System.out.println(freeBoardCommand.getBoardTitle());
		
		
		
		new FreeBoardCommandValidator().validate(freeBoardCommand, errors);
		
		if(errors.hasErrors()) {
			List<ObjectError> error = errors.getAllErrors();
			System.out.println(error.get(0).toString());
			return "redirect:/freeBoard/insertFreeBoardForm";
		}
		
		
		insertFreeBoardService.insertFreeBoard(freeBoardCommand);
		
		
		
		return "freeBoard/freeBoardSuccess";
	}

}
