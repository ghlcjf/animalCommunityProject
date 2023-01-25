package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.service.ImageService;
import animal.service.MessageService;
import animal.service.SelectAllFreeBoardListService;
import animal.vo.FreeBoard;
import animal.vo.Image;
import animal.vo.Issue;
import animal.vo.LoginCommand;
import animal.vo.LoginUserInfo;

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
	
	private ImageService imageService;
	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}
	
	private MessageService messageService;
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	@RequestMapping("/")
	public String mainLogin(Model model,HttpSession session) {
		
		List<FreeBoard> freeBoardList = selectAllFreeBoardListService.selectAllFreeBoardList();
		List<Image> imageList = imageService.selectAllImageList();
		List<Issue> issueList = animalDao.selectAllIssueList(); //이슈게시판 정보 

		
		//메인-인기글 10개 띄우는거 
		List<FreeBoard> freeBoardTopTen = selectAllFreeBoardListService.selectFreeBoardTop();

		
		// 안 읽은 메세지 개수 불러오기
		if(session != null) {
			Object obj = session.getAttribute("userInfo");
			if(obj !=null) {
				LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
				int num = messageService.getUnReadCheck(userInfo.getName());
				session.setAttribute("unReadCheck", num);
				
			}
		}
		
		


		for(int i=0;i<freeBoardTopTen.size();i++) {
			if(freeBoardTopTen.get(i).getBoardTitle().length()>=10) {
				String title = freeBoardTopTen.get(i).getBoardTitle().substring(0,10)+"...";
				freeBoardTopTen.get(i).setBoardTitle(title);
			}
		}
		for(int i=0;i<freeBoardList.size();i++) {
			if(freeBoardList.get(i).getBoardTitle().length()>=10) {
				String title = freeBoardList.get(i).getBoardTitle().substring(0,10)+"...";
				freeBoardList.get(i).setBoardTitle(title);
			}
		}
		for(int i=0;i<issueList.size();i++) {
			if(issueList.get(i).getIssueTitle().length()>=10) {
				String title = issueList.get(i).getIssueTitle().substring(0,10)+"...";
				issueList.get(i).setIssueTitle(title);
			}
		}


		model.addAttribute("imageList", imageList);
		model.addAttribute("issue",issueList);
		model.addAttribute("freeBoardTopTen",freeBoardTopTen);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("loginCommand", new LoginCommand());
		return "main"; 
	}
	
	@RequestMapping("/main")
	public String main( Model model,HttpSession session) {
		List<FreeBoard> freeBoardList = selectAllFreeBoardListService.selectAllFreeBoardList();
		List<Issue> issueList = animalDao.selectAllIssueList(); //이슈게시판 정보 
		List<Image> imageList = imageService.selectAllImageList();
		List<FreeBoard> freeBoardTopTen = selectAllFreeBoardListService.selectFreeBoardTop();

		
		// 안 읽은 메세지 개수 불러오기
		if(session != null) {
			Object obj = session.getAttribute("userInfo");
			if(obj !=null) {
				LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
				int num = messageService.getUnReadCheck(userInfo.getName());
				session.setAttribute("unReadCheck", num);
				
			}
		}
		


		for(int i=0;i<freeBoardTopTen.size();i++) {
			if(freeBoardTopTen.get(i).getBoardTitle().length()>=10) {
				String title = freeBoardTopTen.get(i).getBoardTitle().substring(0,10)+"...";
				freeBoardTopTen.get(i).setBoardTitle(title);
			}
		}
		for(int i=0;i<freeBoardList.size();i++) {
			if(freeBoardList.get(i).getBoardTitle().length()>=10) {
				String title = freeBoardList.get(i).getBoardTitle().substring(0,10)+"...";
				freeBoardList.get(i).setBoardTitle(title);
			}
		}
		for(int i=0;i<issueList.size();i++) {
			if(issueList.get(i).getIssueTitle().length()>=10) {
				String title = issueList.get(i).getIssueTitle().substring(0,10)+"...";
				issueList.get(i).setIssueTitle(title);
			}
		}

		
		model.addAttribute("imageList", imageList);
		model.addAttribute("issue",issueList); //이슈게시판 정보
		model.addAttribute("freeBoardTopTen",freeBoardTopTen);
		model.addAttribute("freeBoardList", freeBoardList); //자유게시판 정보
		model.addAttribute("loginCommand", new LoginCommand()); //로그인 정보
		return "main"; 
	}

	//자유게시판, 이슈게시판 글 메인에 불러오기 ->spring-controller.xml에 property등록해야함 
	
	
	
}




