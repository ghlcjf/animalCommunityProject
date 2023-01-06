package animal.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonFormat;

import animal.dao.AnimalDao;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;

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
		
		
		System.out.println(name);
		System.out.println(commentContent);
		System.out.println(boardNum);
		
		FreeCommentCommand fcc = new FreeCommentCommand();
		
		fcc.setBoardNum(Integer.parseInt(boardNum));
		fcc.setCommentContent(commentContent);
		fcc.setName(name);
		
//		new FreeCommentCommandValidator().validate(fcc, errors);
//		
//		if(errors.hasErrors()) {
//			return null;
//		}
		
		
		// 데이터 베이스로 보내기
		animalDao.insertFreeComment(fcc);
		
		
		List<FreeComment> freeComments = animalDao.selectAllFreeComment2(boardNum);
		
		
		return freeComments.get(0);
		
		
		
		
		
		
		
		// request.getRequestDispatcher("/freeBoard/readFreeBoard/"+boardNum).forward(request, response);
	}

}
