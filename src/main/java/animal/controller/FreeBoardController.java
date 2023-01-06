package animal.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.service.SelectAllFreeBoardListService;
import animal.vo.FreeBoard;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;

@Controller
public class FreeBoardController {
	
	private SelectAllFreeBoardListService selectAllFreeBoardListService;
	
	public void setSelectAllFreeBoardListService(SelectAllFreeBoardListService selectAllFreeBoardListService) {
		this.selectAllFreeBoardListService = selectAllFreeBoardListService;
	}
	
	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}




	@RequestMapping("/freeBoard/freeBoardList")
	public String boardList(Model model) {
		
		List<FreeBoard> freeBoardList = selectAllFreeBoardListService.selectAllFreeBoardList();
		
		model.addAttribute("freeBoardList", freeBoardList);
		return "freeBoard/freeBoardList";
		
	}
	
	
	
	
	@GetMapping("/freeBoard/readFreeBoard/{boardNum}")
	public String readFreeBoard(@PathVariable("boardNum") long boardNum,Model model) {
		
		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);//올리기 전
		animalDao.addViewConutFreeBoard(updateFreeBoard);// 가져온 걸로 조회수 올리는 메서드
		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);// 올려진 게시글 가져오는 메서드
		
		
		// 댓글 가져오기
		List<FreeComment> freeComments = animalDao.selectAllFreeComment(boardNum);
		
		model.addAttribute("freeCommentCommand", new FreeCommentCommand());
		model.addAttribute("freeComments", freeComments);
		model.addAttribute("freeBoard", freeBoard);
		
		return "freeBoard/freeBoardDetail";
	}
	
	
	
	
	
	
	

}
