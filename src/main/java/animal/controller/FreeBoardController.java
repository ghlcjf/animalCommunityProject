package animal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import animal.vo.SectionPage;

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




	@RequestMapping("/freeBoard/freeBoardList/{animal}/{section}/{pageNum}")
	public String boardList(@PathVariable("animal") String animal, @PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum, Model model,
			HttpServletRequest request) {
		List<FreeBoard> freeBoardList = null;;
		int totalCnt = 0;
//		String _section = request.getParameter("section");
//		String _pageNum = request.getParameter("pageNum");
//		
//		int section = Integer.parseInt(((_section==null)?"1":_section));
//		int pageNum = Integer.parseInt(((_pageNum==null)?"1":_pageNum));
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		
		
		
		if(animal.equals("main")) {
			sectionPage.setBoardCategory(animal);
			totalCnt = freeBoardService.selectAllNumFreeBoard();
			freeBoardList = freeBoardService.selectTargetFreeBoards(sectionPage);
		}else if(animal.equals("dog")) {
			sectionPage.setBoardCategory("강아지");
			totalCnt = freeBoardService.selectAnimalNumFreeBoard(sectionPage);
			freeBoardList = freeBoardService.selectAnimalTargetFreeBoards(sectionPage);
		}else if(animal.equals("cat")) {
			sectionPage.setBoardCategory("고양이");
			totalCnt = freeBoardService.selectAnimalNumFreeBoard(sectionPage);
			freeBoardList = freeBoardService.selectAnimalTargetFreeBoards(sectionPage);
		}else if(animal.equals("reptile")) {
			sectionPage.setBoardCategory("파충류");
			totalCnt = freeBoardService.selectAnimalNumFreeBoard(sectionPage);
			freeBoardList = freeBoardService.selectAnimalTargetFreeBoards(sectionPage);
		}else if(animal.equals("birds")) {
			sectionPage.setBoardCategory("조류");
			totalCnt = freeBoardService.selectAnimalNumFreeBoard(sectionPage);
			freeBoardList = freeBoardService.selectAnimalTargetFreeBoards(sectionPage);
		}else if(animal.equals("fish")) {
			sectionPage.setBoardCategory("어류");
			totalCnt = freeBoardService.selectAnimalNumFreeBoard(sectionPage);
			freeBoardList = freeBoardService.selectAnimalTargetFreeBoards(sectionPage);
		}else if(animal.equals("other")) {
			sectionPage.setBoardCategory("기타");
			totalCnt = freeBoardService.selectAnimalNumFreeBoard(sectionPage);
			freeBoardList = freeBoardService.selectAnimalTargetFreeBoards(sectionPage);
		}
		
		List<FreeBoard> noticeList = selectAllNoticeListService.selectAllNoticeList();
		
		model.addAttribute("animal", animal);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("sectionPage", sectionPage);
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
