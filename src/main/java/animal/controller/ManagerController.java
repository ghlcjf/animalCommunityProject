package animal.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import animal.service.InsertFreeBoardService;
import animal.service.InsertIssueBoardService;
import animal.validator.FreeBoardCommandValidator;
import animal.validator.IssueBoardCommandValidator;
import animal.vo.FreeBoardCommand;
import animal.vo.IssueBoardCommand;
import animal.vo.LoginUserInfo;

@Controller
public class ManagerController {
	
	
	private InsertFreeBoardService insertFreeBoardService;
	
	public void setInsertFreeBoardService(InsertFreeBoardService insertFreeBoardService) {
		this.insertFreeBoardService = insertFreeBoardService;
	}
	
	private InsertIssueBoardService insertIssueBoardService;

	public void setInsertIssueBoardService(InsertIssueBoardService insertIssueBoardService) {
		this.insertIssueBoardService = insertIssueBoardService;
	}

	@GetMapping("/manager/managerMain")
	public String manager(HttpSession session) {
	
		
		return "manager/managerMain";
	}
	
	@GetMapping("/manager/writeForm/{kind}")
	public String writeNotice(@PathVariable("kind") String kind, Model model) {
		String url = null;
		
		if(kind.equals("notice")) {
			model.addAttribute("freeBoardCommand", new FreeBoardCommand());
			url = "manager/noticeForm";
		}else if(kind.equals("issue")) {
			model.addAttribute("issueBoardCommand", new IssueBoardCommand());
			url = "manager/issueForm";
		}
		
		
		
		
		
		return url;
	}
	
	
	@PostMapping("/manager/writeNotice")
	public String insertFreeBoard(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session
			) throws Exception, IOException {
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\freeBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	freeBoardCommand.setBoardUrl("null");
        }
		
		
		
		// bc에 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		freeBoardCommand.setName(userInfo.getName());
		
		
		
		new FreeBoardCommandValidator().validate(freeBoardCommand, errors);
		
		if(errors.hasErrors()) {
			return "redirect:manager/writeForm/notice";
		}
		
		
		insertFreeBoardService.insertFreeBoard(freeBoardCommand);
		
		
		
		return "manager/success";
	}
	
	
	@PostMapping("/manager/writeIssue")
	public String insertIssueBoard(@RequestParam(value="issueUrl2") MultipartFile file,
			IssueBoardCommand issueBoardCommand,
			Errors errors,HttpSession session) throws Exception, IOException {
		
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\issueBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            issueBoardCommand.setIssueUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	issueBoardCommand.setIssueUrl("null");
        }
		
		
		// bc에 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		issueBoardCommand.setName(userInfo.getName());
		
		new IssueBoardCommandValidator().validate(issueBoardCommand, errors);
		
		if(errors.hasErrors()) {
			return "redirect:/manager/writeForm/issue";
		}
		
		insertIssueBoardService.insertIssueBoard(issueBoardCommand);
		
		
		return "manager/success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
