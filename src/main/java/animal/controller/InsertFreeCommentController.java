package animal.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;
import oracle.net.aso.f;

@RestController
public class InsertFreeCommentController {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	
	
	


	@RequestMapping("/insertComment") 
	public FreeComment insertComment(@RequestParam("name") String name,
			@RequestParam("commentContent") String commentContent,
			@RequestParam("boardNum") String boardNum) {
		
		
		FreeCommentCommand fcc = new FreeCommentCommand();
		
		fcc.setBoardNum(Integer.parseInt(boardNum)); // 게시글 번호
		fcc.setCommentContent(commentContent); // 댓글 내용
		fcc.setName(name); // 댓글 작성자
		
		
		// 데이터 베이스로 보내기
		animalDao.insertFreeComment(fcc);
		animalDao.updateFreeBoardCommentCount(fcc.getBoardNum()); // 댓글 수를 올리는 메서드
		
		List<FreeComment> freeComments = animalDao.selectAllFreeComment2(boardNum); // 해당 게시글의 댓글 리스트 가져오기
		
		
		return freeComments.get(0); // 리스트 가장 첫번째 댓글을 리턴 => jsp파일에 새로 등록한 댓글 끼워 넣기 위함
		
	}

}
