package animal.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import animal.service.FreeBoardService;
import animal.vo.FreeBoardCommand;
import animal.vo.LoginUserInfo;


@Controller
public class InsertFreeBoardController {
	
	private FreeBoardService freeBoardService;
	
	public void setFreeBoardService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
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
		
		String uploadDir = "C:\\upload\\freeBoardImage";
		if (!file.isEmpty()) { // 사진을 업로드한다면 사진의 이름을 저장
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else { // 업로드 하지 않으면 null로 저장
        	freeBoardCommand.setBoardUrl("null");
        }

		
		
		// bc에 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			freeBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		
		freeBoardService.insertFreeBoard(freeBoardCommand);
		
		
		
		return "redirect:/freeBoard/freeBoardList/main/1/1";
	}

}
