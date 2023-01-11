package animal.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.service.FreeBoardService;
import animal.service.SelectAllFreeBoardListService;
import animal.service.SelectAllNoticeListService;
import animal.vo.FreeBoard;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;

@Controller
public class FreeBoardController {
	
	
	private FreeBoardService freeBoardService;
	public void setFreeBoardService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}
	
	
	

	private SelectAllFreeBoardListService selectAllFreeBoardListService;
	
	public void setSelectAllFreeBoardListService(SelectAllFreeBoardListService selectAllFreeBoardListService) {
		this.selectAllFreeBoardListService = selectAllFreeBoardListService;
	}
	
	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	private SelectAllNoticeListService selectAllNoticeListService;
	public void setSelectAllNoticeListService(SelectAllNoticeListService selectAllNoticeListService) {
		this.selectAllNoticeListService = selectAllNoticeListService;
	}




	@RequestMapping("/freeBoard/freeBoardList/{animal}")
	public String boardList(@PathVariable("animal") String animal, Model model) {
		List<FreeBoard> freeBoardList = null;;
		
		if(animal.equals("main")) {
			freeBoardList = selectAllFreeBoardListService.selectAllFreeBoardList();
		}else if(animal.equals("dog")) {
			freeBoardList = animalDao.selectDogFreeBoardList();
		}else if(animal.equals("cat")) {
			freeBoardList = animalDao.selectCatFreeBoardList();
		}else if(animal.equals("reptile")) {
			freeBoardList = animalDao.selectReptileFreeBoardList();
		}else if(animal.equals("birds")) {
			freeBoardList = animalDao.selectBirdsFreeBoardList();
		}else if(animal.equals("fish")) {
			freeBoardList = animalDao.selectFishFreeBoardList();
		}else if(animal.equals("other")) {
			freeBoardList = animalDao.selectOtherFreeBoardList();
		}
		
		List<FreeBoard> noticeList = selectAllNoticeListService.selectAllNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("freeBoardList", freeBoardList);
		return "freeBoard/freeBoardList";
		
	}
	
	
	
	
	@GetMapping("/freeBoard/readFreeBoard/{boardNum}")
	public String readFreeBoard(@PathVariable("boardNum") long boardNum,Model model) {
		
		FreeBoard updateFreeBoard = freeBoardService.selectFreeBoardByBoardNum(boardNum); //올리기 전
		animalDao.addViewConutFreeBoard(updateFreeBoard);// 가져온 걸로 조회수 올리는 메서드
		FreeBoard freeBoard = freeBoardService.selectFreeBoardByBoardNum(boardNum); // 올려진 게시글 가져오는 메서드
		
		
		// 댓글 가져오기
		List<FreeComment> freeComments = animalDao.selectAllFreeComment(boardNum);
		
		model.addAttribute("freeCommentCommand", new FreeCommentCommand());
		model.addAttribute("freeComments", freeComments);
		model.addAttribute("freeBoard", freeBoard);
		
		return "freeBoard/freeBoardDetail";
	}
	
	
	
	
	@RequestMapping("/freeBoard/deleteFreeBoard/{boardNum}")
	public String deleteFreeBoard(@PathVariable("boardNum") long boardNum) {
		
		freeBoardService.deleteFreeBoardByBoardNum(boardNum);
		
		return "redirect:/freeBoard/freeBoardList/main";
	}
	
	

}
