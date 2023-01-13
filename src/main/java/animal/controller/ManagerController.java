package animal.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import animal.dao.AnimalDao;
import animal.service.AnimalInfoService;
import animal.service.FreeBoardService;
import animal.service.HospitalInfoService;
import animal.service.IssueBoardService;
import animal.service.SelectAllNoticeListService;
import animal.vo.AnimalInfo;
import animal.vo.AnimalInfoCommand;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.HospitalInfo;
import animal.vo.HospitalInfoCommand;
import animal.vo.Issue;
import animal.vo.IssueBoardCommand;
import animal.vo.LoginUserInfo;
import animal.vo.SearchMemberCommand;
import animal.vo.User;


@Controller
public class ManagerController {
	

	private AnimalDao animalDao;
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	private FreeBoardService freeBoardService;
	public void setFreeBoardService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}
	
	private AnimalInfoService animalInfoService;
	public void setAnimalInfoService(AnimalInfoService animalInfoService) {
		this.animalInfoService = animalInfoService;
	}
	
	private HospitalInfoService hospitalInfoService;
	public void setHospitalInfoService(HospitalInfoService hospitalInfoService) {
		this.hospitalInfoService = hospitalInfoService;
	}
	

	private IssueBoardService issueBoardService;
	public void setIssueBoardService(IssueBoardService issueBoardService) {
		this.issueBoardService = issueBoardService;
	}
	
	private SelectAllNoticeListService selectAllNoticeService;
	public void setSelectAllNoticeService(SelectAllNoticeListService selectAllNoticeService) {
		this.selectAllNoticeService = selectAllNoticeService;
	}
	
	

	@GetMapping("/manager/managerMain")
	public String manager(HttpSession session) {
	
		
		return "manager/managerMain";
	}
	

	@GetMapping("/memberManagement") //회원조회
	public String memberManagement(Model model) {
		
		List<User> memberList = animalDao.memberList();
		model.addAttribute("member",memberList);
		model.addAttribute("searchData", new SearchMemberCommand());
		
		return "manager/memberManagement";
	}
	
	@PostMapping("/search")
	public String searchMember(@ModelAttribute("searchData")SearchMemberCommand smc,Model model) {
		
		List<User> user = animalDao.searchMember(smc);
		model.addAttribute("member",user);
		
		
		return "manager/memberManagement";
	}
	
	@GetMapping("/member/detail/{name}") //회원 상세보기
	public String memberDetail(@PathVariable("name") String name, HttpSession session) {
		
		User user = animalDao.selectByMemberName(name);
		session.setAttribute("member",user);
//		model.addAttribute("member",user);
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		session.setAttribute("board",boardList);
//		model.addAttribute("board",boardList);
		
		return "manager/memberDetail";
	}
	
	@GetMapping("/board/delete/{boardNum}") //회원게시물 삭제
	public String delete(@PathVariable("boardNum") long boardNum,Model model) {
		
//		System.out.println("삭제?");
//		System.out.println(boardNum);
		String name = animalDao.selectName(boardNum);
		animalDao.boardDelete(boardNum);
		
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		model.addAttribute("board",boardList);
		
		return "manager/memberDetail";
	}
					
	@RequestMapping("/{id}") //회원삭제
	public String dropMember(@PathVariable("id") String id) {
		System.out.println(id);
		animalDao.dropMember(id);
		return "redirect:memberManagement";
	}

	
	
	
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	@GetMapping("/boardManagement/animalInfo") //동물소개 게시판 
	public String animalInfoMenu(Model model) {
		
		List<AnimalInfo> animalInfoList = animalInfoService.selectAllAnimalInfoList();
		
		model.addAttribute("animalInfoList", animalInfoList);
		
		return "manager/animalInfoMenu";
	}
	
	@GetMapping("/boardManagement/hospitalInfo") //동물병원 게시판
	public String hospitalInfoMenu(Model model) {
		
		List<HospitalInfo> hospitalInfoList = hospitalInfoService.selectAllHospitalInfoList();
		
		
		model.addAttribute("hospitalInfoList", hospitalInfoList);
		return "manager/hospitalInfoMenu";
	}
	
	@GetMapping("/boardManagement/issue") //이슈게시판
	public String issueBoardMenu(Model model) {
		
		List<Issue> issueBoardList = issueBoardService.selectAllIssueBoardList();
		
		
		model.addAttribute("issueBoardList", issueBoardList);
		return "manager/issueBoardMenu";
	}
	
	
	@GetMapping("/boardManagement/notice") //공지게시판
	public String noticeMenu(Model model) {
		
		List<FreeBoard> noticeList = selectAllNoticeService.selectAllNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		return "manager/noticeMenu";
	}
	
	
	
	
//-----------------------------------글 작성--------------------------------------
	
	@GetMapping("/manager/writeForm/{kind}")
	public String writeBoard(@PathVariable("kind") String kind, Model model) {
		String url = null;
		
		if(kind.equals("notice")) {
			model.addAttribute("freeBoardCommand", new FreeBoardCommand());
			url = "manager/noticeForm";
		}else if(kind.equals("issue")) {
			model.addAttribute("issueBoardCommand", new IssueBoardCommand());
			url = "manager/issueForm";
		}else if(kind.equals("hospitalInfo")) {
			model.addAttribute("hospitalInfoCommand", new HospitalInfoCommand());
			url = "manager/hospitalInfoForm";
		}else if(kind.equals("animalInfo")) {
			model.addAttribute("animalInfoCommand", new AnimalInfoCommand());
			url = "manager/animalInfoForm";
		}else {
			return "redirect:/manager/managerMain";
		}
		
		
		return url;
	}
	
			
	@PostMapping("/manager/writeNotice") //공지사항 글쓰기
	public String insertFreeBoard(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session
			) throws Exception, IOException {
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\freeBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	freeBoardCommand.setBoardUrl("null");
        }
		
		// 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			freeBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		freeBoardService.insertFreeBoard(freeBoardCommand);
		
		
		return "redirect:/boardManagement/notice";
	}
	

			
	@PostMapping("/manager/writeIssue")	//이슈게시판 글쓰기
	public String insertIssueBoard(@RequestParam(value="issueUrl2") MultipartFile file,
			IssueBoardCommand issueBoardCommand,
			Errors errors,HttpSession session) throws Exception, IOException {
		
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\issueBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            issueBoardCommand.setIssueUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	issueBoardCommand.setIssueUrl("null");
        }
		
		
		// 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			issueBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		issueBoardService.insertIssueBoard(issueBoardCommand);
		
		
		return "redirect:/boardManagement/issue";
	}
	
	@PostMapping("/manager/writeHospitalInfo") //병원 정보 글쓰기
	public String insertHospitalInfo(HospitalInfoCommand hospitalInfoCommand,
			Errors errors,HttpSession session) {
		
		// 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			hospitalInfoCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		hospitalInfoService.insertHospitalInfo(hospitalInfoCommand);
		
		
		return "redirect:/boardManagement//hospitalInfo";
		
	}

	@PostMapping("/manager/writeAnimalInfo") //동물소개 글쓰기
	public String insertAnimalInfo(@RequestParam(value="animalUrl2") MultipartFile file,
			AnimalInfoCommand animalInfoCommand,
			Errors errors,
			HttpSession session) throws Exception, IOException {
		

		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\animalInfoImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            animalInfoCommand.setAnimalUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	animalInfoCommand.setAnimalUrl("null");
        }
		
		// 세션 정보 넣어주기
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			animalInfoCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		animalInfoService.insertAnimalInfo(animalInfoCommand);
		
		
		
		return "redirect:/boardManagement/animalInfo";
	}

//-------글 수정-----------------------------------------------------------------------------------------------
	@GetMapping("/manager/updateForm/{kind}/{boardNum}") 
	public String updateBoardForm(@PathVariable("kind") String kind,
			@PathVariable("boardNum") long boardNum, Model model) {
		String url = null;
		
		
		if(kind.equals("notice")) {
			FreeBoard freeBoard = freeBoardService.selectFreeBoardByBoardNum(boardNum);
			model.addAttribute("freeBoard", freeBoard);
			url =  "manager/updateNoticeForm";
		}else if(kind.equals("issue")) {
			Issue issueBoard = issueBoardService.selectIssueBoardByBoardNum(boardNum);
			model.addAttribute("issueBoard", issueBoard);
			url = "manager/updateIssueBoardForm";
		}else if(kind.equals("animalInfo")) {
			AnimalInfo animalInfo = animalInfoService.selectAnimalInfoByBoardNum(boardNum);
			model.addAttribute("animalInfo", animalInfo);
			url = "manager/updateAnimalInfoForm";
		}else if(kind.equals("hospitalInfo")) {
			HospitalInfo hospitalInfo = hospitalInfoService.selectHospitalInfoByBoardNum(boardNum);
			model.addAttribute("hospitalInfo", hospitalInfo);
			url = "manager/updateHospitalInfoForm";
		}else {
			return "redirect:/managerMain";
		}
		
		
		return url;
	}
	
	
	@PostMapping("/manager/updateNotice") //공지 수정
	public String updateNotice(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\freeBoardImage";
		
		
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	String filename = request.getParameter("originPic");
        	freeBoardCommand.setBoardUrl(filename);
        	
        }
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			freeBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		

		
		freeBoardService.updateFreeBoard(freeBoardCommand);
		
		return "redirect:/boardManagement/notice";
	}
	
	
	
	@PostMapping("/manager/updateIssueBoard")//이슈 수정
	public String updateIssueBoard(@RequestParam(value="issueUrl2") MultipartFile file,
			IssueBoardCommand issueBoardCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\issueBoardImage";
		
		
		
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            issueBoardCommand.setIssueUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	String filename = request.getParameter("originPic");
        	issueBoardCommand.setIssueUrl(filename);
        	
        }
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			issueBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		
		issueBoardService.updateIssueBoard(issueBoardCommand);
		
		return "redirect:/boardManagement/issue";
	}
	
	
	@PostMapping("/manager/updateAnimalInfo") //동물소개 수정
	public String updateAnimalInfo(@RequestParam(value="animalUrl2") MultipartFile file,
			AnimalInfoCommand animalInfoCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\animalInfoImage";
		
		
		
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            animalInfoCommand.setAnimalUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	String filename = request.getParameter("originPic");
        	animalInfoCommand.setAnimalUrl(filename);
        	
        }
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			animalInfoCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		animalInfoService.updateAnimalInfo(animalInfoCommand);
		
		return "redirect:/boardManagement/animalInfo";
	}
	
	@PostMapping("/manager/updateHospitalInfo") //병원 정보 수정
	public String updateHospitalInfo(HospitalInfoCommand hospitalInfoCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) {
		
		
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			hospitalInfoCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		hospitalInfoService.updateHospitalInfo(hospitalInfoCommand);
		
		return "redirect:/boardManagement/hospitalInfo";
	}
	
//----삭제-----------------------------------------------------------------------------------------------------	
	@GetMapping("/manager/delete/{kind}/{boardNum}") 
	public String deleteBoard(@PathVariable("kind") String kind,
			@PathVariable("boardNum") long boardNum) {
		
		
		if(kind.equals("notice")) {
			freeBoardService.deleteFreeBoardByBoardNum(boardNum);
			return "redirect:/boardManagement/notice";
		}else if(kind.equals("issue")){
			issueBoardService.deleteIssueBoardByBoardNum(boardNum);
			return "redirect:/boardManagement/issue";
		}else if(kind.equals("animalInfo")) {
			animalInfoService.deleteAnimalInfoByBoardNum(boardNum);
			return "redirect:/boardManagement/animalInfo";
		}else if(kind.equals("hospitalInfo")) {
			hospitalInfoService.deleteHospitalInfoByBoardNum(boardNum);
			return "redirect:/boardManagement/hospitalInfo";
		}else {
			return "redirect:/managerMain";
		}
		
	}
	
	
	
}
