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
	
	
	@RequestMapping("/comment") 
	public IssueComment addComment(@RequestParam("name") String name,
							@RequestParam("commentContent") String commentContent,
							@RequestParam("boardNum") String boardNum) {

		
		IssueComment issueComment = new IssueComment();
		
		issueComment.setCommentContent(commentContent);
		issueComment.setName(name);
		issueComment.setBoardNum(Integer.parseInt(boardNum));
		
		animalDao.insertIssueComment(issueComment);
		
		List<IssueComment> issueComments = animalDao.getIssueComments2(boardNum);
		
		return issueComments.get(0); // 리스트 가장 첫번째 댓글을 리턴 => jsp파일에 새로 등록한 댓글 끼워 넣기 위함
	}
	



}
