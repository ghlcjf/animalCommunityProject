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
import animal.service.AuthorizeService;
import animal.service.FreeBoardService;
import animal.service.HospitalInfoService;
import animal.service.ImageService;
import animal.service.IssueBoardService;
import animal.service.ReportBoardService;
import animal.service.SelectAllNoticeListService;
import animal.vo.AnimalInfo;
import animal.vo.AnimalInfoCommand;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.HospitalInfo;
import animal.vo.HospitalInfoCommand;
import animal.vo.Image;
import animal.vo.ImageCommand;
import animal.vo.Issue;
import animal.vo.IssueBoardCommand;
import animal.vo.LoginUserInfo;
import animal.vo.SearchMemberCommand;
import animal.vo.SectionPage;
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
	

	private ImageService imageService;
	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}	
	private AuthorizeService authorizeService;
	public void setAuthorizeService(AuthorizeService authorizeService) {
		this.authorizeService = authorizeService;
	}
	
	private ReportBoardService reportBoardService;
	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}


	@GetMapping("/manager/managerMain")
	public String manager(HttpSession session) {
	
		
		return "manager/managerMain";
	}
	

	@GetMapping("/memberManagement/{section}/{pageNum}") //????????????
	public String memberManagement(@PathVariable("section") int section, @PathVariable("pageNum") int pageNum, Model model,
			HttpSession session) {

		SectionPage sectionPage = new SectionPage(section,pageNum);
		List<User> memberList = animalDao.selectTargetMemberList(sectionPage);
		int totalCnt = animalDao.selectAllNumMember();
		
		model.addAttribute("member",memberList);
		model.addAttribute("searchData", new SearchMemberCommand());
		model.addAttribute("totalCnt", totalCnt);
		session.setAttribute("sectionPage", sectionPage);
		
		return "manager/memberManagement";
	}
	
	@PostMapping("/search")
	public String searchMember(@ModelAttribute("searchData")SearchMemberCommand smc,Model model) {
		
		List<User> user = animalDao.searchMember(smc);
		model.addAttribute("member",user);
		
		return "manager/memberManagement";
	}
	
	@GetMapping("/member/detail/{name}") //?????? ????????????
	public String memberDetail(@PathVariable("name") String name, HttpSession session) {
		
		User user = animalDao.selectByMemberName(name);
		session.setAttribute("member",user);
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		session.setAttribute("board",boardList);
		
		return "manager/memberDetail";
	}
	
	@GetMapping("/board/delete/{boardNum}") //??????????????? ??????
	public String delete(@PathVariable("boardNum") long boardNum,Model model) {
		

		String name = animalDao.selectName(boardNum);
		animalDao.boardDelete(boardNum);
		
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		model.addAttribute("board",boardList);
		
		return "manager/memberDetail";
	}
			
	@RequestMapping("/{id}") //????????????
	public String dropMember(@PathVariable("id") String id,HttpServletRequest request) {
		System.out.println(id);
		String userId = request.getParameter("userId");
		animalDao.dropMember(userId);
		return "redirect:/memberManagement/1/1";
	}
	
	@RequestMapping("/authorize")
	public String authorize(HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		
		authorizeService.authorize(userId);
		
		return "redirect:/memberManagement/1/1";
	}
	

	//---------------------------------------------?????? ?????????----------------------------------------------
	@GetMapping("/reportBoard")
	public String reportBoard(Model model) {
		List<FreeBoard> freeBoard = reportBoardService.reportFreeBoard();
		
		for(int i=0;i<freeBoard.size();i++) {
			if(freeBoard.get(i).getBoardTitle().length()>=26) {
				String title = freeBoard.get(i).getBoardTitle().substring(0,26)+"...";
				freeBoard.get(i).setBoardTitle(title);
			}
		}
		
		model.addAttribute("freeBoard",freeBoard);
		
		return "/manager/reportBoardList";
	}
	
	@RequestMapping("/reportBoardDelete/{boardNum}")
	public String reportBoardDelete(@PathVariable("boardNum") long boardNum) {
		
		animalDao.boardDelete(boardNum);
		
		return "redirect:/reportBoard";
	}
	
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	@GetMapping("/boardManagement/animalInfo/{section}/{pageNum}") //???????????? ????????? 
	public String animalInfoMenu(@PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum, Model model,HttpSession session) {
		
	
		int totalCnt = animalInfoService.selectAllNumAnimalInfo();
		SectionPage sectionPage = new SectionPage(section,pageNum);
		List<AnimalInfo> animalInfoList = animalInfoService.selectTargetAnimalInfoList(sectionPage);
		
		
		
		
		for(int i=0;i<animalInfoList.size();i++) {
			if(animalInfoList.get(i).getAnimalTitle().length()>=26) {
				String title = animalInfoList.get(i).getAnimalTitle().substring(0,26)+"...";
				animalInfoList.get(i).setAnimalTitle(title);
			}
		}
		
		model.addAttribute("totalCnt", totalCnt);
		session.setAttribute("sectionPage", sectionPage);
		model.addAttribute("animalInfoList", animalInfoList);
		
		return "manager/animalInfoMenu";
	}
	
	@GetMapping("/boardManagement/hospitalInfo/{section}/{pageNum}") //???????????? ?????????
	public String hospitalInfoMenu(@PathVariable("section") int section, 
			@PathVariable("pageNum") int pageNum, Model model,HttpSession session) {
		
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		int totalCnt = hospitalInfoService.selectAllNumHospitalInfo();
		List<HospitalInfo> hospitalInfoList = hospitalInfoService.selectTargetHospitalInfoList(sectionPage);
		
		for(int i=0;i<hospitalInfoList.size();i++) {
			if(hospitalInfoList.get(i).getHospitalName().length()>=26) {
				String title = hospitalInfoList.get(i).getHospitalName().substring(0,26)+"...";
				hospitalInfoList.get(i).setHospitalName(title);
			}
		}
		
		
		model.addAttribute("totalCnt", totalCnt);
		session.setAttribute("sectionPage", sectionPage);
		model.addAttribute("hospitalInfoList", hospitalInfoList);
		return "manager/hospitalInfoMenu";
	}
	
	@GetMapping("/boardManagement/issue/{section}/{pageNum}") //???????????????
	public String issueBoardMenu(@PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum,Model model,
			HttpSession session) {
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		List<Issue> issueBoardList = animalDao.selectTargetIssueList(sectionPage);
		
		for(int i=0;i<issueBoardList.size();i++) {
			if(issueBoardList.get(i).getIssueTitle().length()>=26) {
				String title = issueBoardList.get(i).getIssueTitle().substring(0,26)+"...";
				issueBoardList.get(i).setIssueTitle(title);
			}
		}

		int totalCnt = animalDao.selectAllNumIssue();
		
		model.addAttribute("totalCnt", totalCnt);
		session.setAttribute("sectionPage", sectionPage);
		model.addAttribute("issueBoardList", issueBoardList);
		
		return "manager/issueBoardMenu";
	}
	
	
	@GetMapping("/boardManagement/notice/{section}/{pageNum}") //???????????????
	public String noticeMenu(@PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum, Model model,
			HttpSession session) {
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		int totalCnt = selectAllNoticeService.selectAllNoticeNum();
		List<FreeBoard> noticeList = selectAllNoticeService.selectTargetNoticeList(sectionPage);
		
		for(int i=0;i<noticeList.size();i++) {
			if(noticeList.get(i).getBoardTitle().length()>=26) {
				String title = noticeList.get(i).getBoardTitle().substring(0,26)+"...";
				noticeList.get(i).setBoardTitle(title);
			}
		}
		
		
		model.addAttribute("totalCnt", totalCnt);
		session.setAttribute("sectionPage", sectionPage);
		model.addAttribute("noticeList", noticeList);
		return "manager/noticeMenu";
	}
	
	@GetMapping("/boardManagement/image")
	public String imageMenu(Model model) { // ?????? ????????? ?????????
		
		List<Image> imageList = imageService.selectAllImageList();
		
		
		model.addAttribute("imageList", imageList);
		return "manager/imageMenu";
	}
	
	
	
	
//-----------------------------------??? ??????--------------------------------------
	
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
		}else if(kind.equals("image")) {
			model.addAttribute("imageCommand", new ImageCommand());
			url = "manager/imageForm";
		}else {
			return "redirect:/manager/managerMain";
		}
		
		
		return url;
	}
	
			
	@PostMapping("/manager/writeNotice") //???????????? ?????????
	public String insertFreeBoard(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session
			) throws Exception, IOException {
		
		String uploadDir = "C:\\upload\\freeBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	freeBoardCommand.setBoardUrl("null");
        }
		
		// ?????? ?????? ????????????
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			freeBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		freeBoardService.insertFreeBoard(freeBoardCommand);
		
		
		return "redirect:/boardManagement/notice/1/1";
	}
	

			
	@PostMapping("/manager/writeIssue")	//??????????????? ?????????
	public String insertIssueBoard(@RequestParam(value="issueUrl2") MultipartFile file,
			IssueBoardCommand issueBoardCommand,
			Errors errors,HttpSession session) throws Exception, IOException {
		
		
		String uploadDir = "C:\\upload\\issueBoardImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            issueBoardCommand.setIssueUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	issueBoardCommand.setIssueUrl("null");
        }
		
		
		// ?????? ?????? ????????????
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			issueBoardCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		issueBoardService.insertIssueBoard(issueBoardCommand);
		
		
		return "redirect:/boardManagement/issue/1/1";
	}
	
	@PostMapping("/manager/writeHospitalInfo") //?????? ?????? ?????????
	public String insertHospitalInfo(HospitalInfoCommand hospitalInfoCommand,
			Errors errors,HttpSession session) {
		
		// ?????? ?????? ????????????
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			hospitalInfoCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		hospitalInfoService.insertHospitalInfo(hospitalInfoCommand);
		
		
		return "redirect:/boardManagement//hospitalInfo/1/1";
		
	}

	@PostMapping("/manager/writeAnimalInfo") //???????????? ?????????
	public String insertAnimalInfo(@RequestParam(value="animalUrl2") MultipartFile file,
			AnimalInfoCommand animalInfoCommand,
			Errors errors,
			HttpSession session) throws Exception, IOException {
		

		String uploadDir = "C:\\upload\\animalInfoImage";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            animalInfoCommand.setAnimalUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	animalInfoCommand.setAnimalUrl("null");
        }
		
		// ?????? ?????? ????????????
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		if(userInfo!=null) {
			animalInfoCommand.setName(userInfo.getName());
		}else {
			return "redirect:/login";
		}
		
		
		animalInfoService.insertAnimalInfo(animalInfoCommand);
		
		
		
		return "redirect:/boardManagement/animalInfo/1/1";
	}

	@PostMapping("/manager/writeImage")
	public String insertImage(@RequestParam(value="imageUrl2") MultipartFile file,
			ImageCommand imageCommand,
			Errors errors) throws Exception, IOException {
		

		String uploadDir = "C:\\upload\\image";
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            imageCommand.setImageUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	imageCommand.setImageUrl("null");
        }
		
		
		
		imageService.insertImage(imageCommand);
		
		
		
		return "redirect:/boardManagement/image";
	}
	
	
	//----------------------------------------------------------------------------------
	
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
		}else if(kind.equals("image")){
			Image image = imageService.selectImageByBoardNum(boardNum);
			model.addAttribute("image", image);
			url = "manager/updateImageForm";
		}else {
			return "redirect:/managerMain";
		}
		
		
		return url;
	}
	
	
	@PostMapping("/manager/updateNotice") //?????? ??????
	public String updateNotice(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		String uploadDir = "C:\\upload\\freeBoardImage";
		
		
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
		
		SectionPage sectionPage = (SectionPage) session.getAttribute("sectionPage");
		
		freeBoardService.updateFreeBoard(freeBoardCommand);
		
		return "redirect:/boardManagement/notice/"+sectionPage.getSection()+"/"+sectionPage.getPageNum();
	}
	
	
	
	@PostMapping("/manager/updateIssueBoard")//?????? ??????
	public String updateIssueBoard(@RequestParam(value="issueUrl2") MultipartFile file,
			IssueBoardCommand issueBoardCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		String uploadDir = "C:\\upload\\issueBoardImage";
		
		
		
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
		
		SectionPage sectionPage = (SectionPage) session.getAttribute("sectionPage");
		return "redirect:/boardManagement/issue/"+sectionPage.getSection()+"/"+sectionPage.getPageNum();
	}
	
	
	@PostMapping("/manager/updateAnimalInfo") //???????????? ??????
	public String updateAnimalInfo(@RequestParam(value="animalUrl2") MultipartFile file,
			AnimalInfoCommand animalInfoCommand,
			Errors errors,HttpSession session,
			HttpServletRequest request) throws Exception, IOException {
		
		String uploadDir = "C:\\upload\\animalInfoImage";
		
		
		
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
		SectionPage sectionPage = (SectionPage) session.getAttribute("sectionPage");
		
		animalInfoService.updateAnimalInfo(animalInfoCommand);
		
		return "redirect:/boardManagement/animalInfo/"+sectionPage.getSection()+"/"+sectionPage.getPageNum();
	}
	

	@PostMapping("/manager/updateImage")
	public String updateImage(@RequestParam(value="imageUrl2") MultipartFile file,
			ImageCommand imageCommand, HttpServletRequest request) throws Exception, IOException {
		String uploadDir = "C:\\upload\\image";
		
		
		
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            imageCommand.setImageUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	String filename = request.getParameter("originPic");
        	imageCommand.setImageUrl(filename);
        	
        }
		
		imageService.updateImage(imageCommand);
		
		return "redirect:/boardManagement/image";
	}

	@PostMapping("/manager/updateHospitalInfo") //?????? ?????? ??????
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
		
		SectionPage sectionPage = (SectionPage) session.getAttribute("sectionPage");
		
		
		return "redirect:/boardManagement/hospitalInfo/"+sectionPage.getSection()+"/"+sectionPage.getPageNum();
	}
	
//----??????-----------------------------------------------------------------------------------------------------	
	@GetMapping("/manager/delete/{kind}/{boardNum}") 
	public String deleteBoard(@PathVariable("kind") String kind,
			@PathVariable("boardNum") long boardNum) {
		
		
		if(kind.equals("notice")) {
			freeBoardService.deleteFreeBoardByBoardNum(boardNum);
			return "redirect:/boardManagement/notice/1/1";
		}else if(kind.equals("issue")){
			issueBoardService.deleteIssueBoardByBoardNum(boardNum);
			return "redirect:/boardManagement/issue/1/1";
		}else if(kind.equals("animalInfo")) {
			animalInfoService.deleteAnimalInfoByBoardNum(boardNum);
			return "redirect:/boardManagement/animalInfo/1/1";
		}else if(kind.equals("hospitalInfo")) {
			hospitalInfoService.deleteHospitalInfoByBoardNum(boardNum);
			return "redirect:/boardManagement/hospitalInfo/1/1";

		}else if(kind.equals("image")){
			imageService.deleteImageByBoardNum(boardNum);
			return "redirect:/boardManagement/image";
		}else {
			return "redirect:/managerMain";
		}
		
	}
	
	
	
}
