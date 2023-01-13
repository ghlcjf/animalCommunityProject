package animal.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.service.SelectAllFreeBoardListService;
import animal.vo.FreeBoard;
import animal.vo.Issue;
import animal.vo.LoginCommand;

@Controller
public class MainController {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	private SelectAllFreeBoardListService selectAllFreeBoardListService;
	
	public void setSelectAllFreeBoardListService(SelectAllFreeBoardListService selectAllFreeBoardListService) {
		this.selectAllFreeBoardListService = selectAllFreeBoardListService;
	}
	
	
	@RequestMapping("/")
	public String mainLogin(Model model) {
		
		List<FreeBoard> freeBoardList = selectAllFreeBoardListService.selectAllFreeBoardList();
		List<Issue> issueList = animalDao.selectAllIssueList(); //이슈게시판 정보 
		//메인-인기글 10개 띄우는거 
		List<FreeBoard> freeBoardTopTen = selectAllFreeBoardListService.selectFreeBoardTop();
		
		model.addAttribute("issue",issueList);
		model.addAttribute("freeBoardTopTen",freeBoardTopTen);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("loginCommand", new LoginCommand());
		return "main"; //	/WEB-INF/views/   +main  +.jsp 로이동하라 
	}
	
	@RequestMapping("/main")
	public String main( Model model) {
		List<FreeBoard> freeBoardList = selectAllFreeBoardListService.selectAllFreeBoardList();
		List<Issue> issueList = animalDao.selectAllIssueList(); //이슈게시판 정보 
		List<FreeBoard> freeBoardTopTen = selectAllFreeBoardListService.selectFreeBoardTop();
		
		model.addAttribute("issue",issueList); //이슈게시판 정보
		model.addAttribute("freeBoardTopTen",freeBoardTopTen);
		model.addAttribute("freeBoardList", freeBoardList); //자유게시판 정보
		model.addAttribute("loginCommand", new LoginCommand()); //로그인 정보
		return "main"; //	/WEB-INF/views/   +main  +.jsp 로이동하라 
	}

	//자유게시판, 이슈게시판 글 메인에 불러오기 ->spring-controller.xml에 property등록해야함 
	
	
	
}




