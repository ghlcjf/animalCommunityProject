package animal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.IssueComment;

@RestController
public class IssueCommentController {
	
	private AnimalDao animalDao;
	
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	@PostMapping("/comment") // http://localhost:8090/animalCommunity/comment
	public String addComment(@RequestParam("commentContent") String commentContent,
							@RequestParam("name") String name,
							@RequestParam("boardNum") String boardNum) {
		System.out.println("호출 성공");
		IssueComment issueComment = new IssueComment();
		issueComment.setCommentContent(commentContent);
		issueComment.setName(name);
		issueComment.setBoardNum(Integer.parseInt(boardNum));
		
		animalDao.insertComment(issueComment);
		
		return "/main";
	}
	
//	@PostMapping("/comment/{boardNum}")
//	public String addComment(@PathVariable("boardNum") long boardNum,Errors errors) {
//		
////		AnimalDao.insertComment(icc);
//		
//		return "/main";
//	}
//	
//	@RequestMapping("/good/{boardNum}")  
//	public int good(@PathVariable("boardNum") long boardNum) {
//		FreeBoard updateFreeBoard = animalDao.selectByFreeBoardNum(boardNum);
//		animalDao.addGoodCount(updateFreeBoard);
//		FreeBoard freeBoard = animalDao.selectByFreeBoardNum(boardNum);
//		
//		int num = freeBoard.getGood();
//		
//		return num;
//		// request.getRequestDispatcher("/freeBoard/readFreeBoard/"+boardNum).forward(request, response);
//	}


}
