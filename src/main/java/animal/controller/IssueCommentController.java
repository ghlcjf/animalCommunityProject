package animal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	@RequestMapping("/comment") // http://localhost:8090/animalCommunity/comment
	public IssueComment addComment(@RequestParam("name") String name,
							@RequestParam("commentContent") String commentContent,
							@RequestParam("boardNum") String boardNum) {
//		System.out.println("호출 성공");
//		System.out.println(name);
//		System.out.println(commentContent);
//		System.out.println(boardNum);
		
		IssueComment issueComment = new IssueComment();
		
		issueComment.setCommentContent(commentContent);
		issueComment.setName(name);
		issueComment.setBoardNum(Integer.parseInt(boardNum));
		
		animalDao.insertIssueComment(issueComment);
		
		List<IssueComment> issueComments = animalDao.getIssueComments2(boardNum);
		
		return issueComments.get(0);
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
