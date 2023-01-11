package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.service.SelectFreeBoardByBoardNumService;
import animal.vo.FreeBoard;

@Controller
public class UpdateFreeBoardController {
	
	private SelectFreeBoardByBoardNumService selectFreeBoardByBoardNumService;
	
	public void setSelectFreeBoardByBoardNumService(SelectFreeBoardByBoardNumService selectFreeBoardByBoardNumService) {
		this.selectFreeBoardByBoardNumService = selectFreeBoardByBoardNumService;
	}



	@RequestMapping("/freeBoard/updateFreeBoardForm/{boardNum}")
	public String updateFreeBoardForm(@PathVariable("boardNum") long BoardNum,Model model) {
		
		FreeBoard freeBoard = selectFreeBoardByBoardNumService.selectFreeBoardByBoardNum(BoardNum);
		
		
		model.addAttribute("freeBoard", freeBoard);
		return "freeBoard/updateFreeBoardForm";
	}
	
	
	
	@PostMapping("/freeBoard/updateFreeBoard")
	public String updateFreeBoard() {
		System.out.println("ghcnfdhks");
		
		return "freeBoard/freeBoardSuccess";
		
	}
	
	

}
