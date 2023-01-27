package animal.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import animal.service.FreeBoardService;
import animal.service.SelectFreeBoardByBoardNumService;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.LoginUserInfo;
import animal.vo.SectionPage;

@Controller
public class UpdateFreeBoardController {
	
	private SelectFreeBoardByBoardNumService selectFreeBoardByBoardNumService;
	
	public void setSelectFreeBoardByBoardNumService(SelectFreeBoardByBoardNumService selectFreeBoardByBoardNumService) {
		this.selectFreeBoardByBoardNumService = selectFreeBoardByBoardNumService;
	}

	private FreeBoardService freeBoardService;
	
	public void setFreeBoardService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}



	@RequestMapping("/freeBoard/updateFreeBoardForm/{boardNum}")
	public String updateFreeBoardForm(@PathVariable("boardNum") long BoardNum,Model model) {
		
		FreeBoard freeBoard = selectFreeBoardByBoardNumService.selectFreeBoardByBoardNum(BoardNum);
		
		
		model.addAttribute("freeBoard", freeBoard);
		return "freeBoard/updateFreeBoardForm";
	}
	
	
	
	@PostMapping("/freeBoard/updateFreeBoard")
	public String updateFreeBoard(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		
		String uploadDir = "C:\\upload\\freeBoardImage";
		
		
		
		if (!file.isEmpty()) { // 새로운 사진으로 변경할 때
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else { // 새로운 사진을 업로드하지 않았을 때
        	
        	// 기존 사진의 이름 값을 가져오기
        	String filename = request.getParameter("originPic"); 
        	
        	freeBoardCommand.setBoardUrl(filename);
        }
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			freeBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		SectionPage sectionPage = (SectionPage) session.getAttribute("sectionPage");
		
		freeBoardService.updateFreeBoard(freeBoardCommand);
		

		
		return "redirect:/freeBoard/freeBoardList/main/"+sectionPage.getSection()+"/"+sectionPage.getPageNum();
		
	}
	
	

}
