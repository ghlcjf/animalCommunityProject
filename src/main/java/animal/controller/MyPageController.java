package animal.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import animal.dao.AnimalDao;
import animal.service.ChangeInfoService;
import animal.service.FreeBoardService;
import animal.service.KakaoService;
import animal.service.SelectAllNoticeListService;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.LoginUserInfo;
import animal.vo.SectionPage;
import animal.vo.User;

@Controller
public class MyPageController {
	
	private KakaoService kakaoService;
	
	public void setKakaoService(KakaoService kakaoService) {
		this.kakaoService = kakaoService;
	}

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	private FreeBoardService freeBoardService;
	public void setFreeBoardService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}
	private ChangeInfoService changeInfoService;
	
	public void setChangeInfoService(ChangeInfoService changeInfoService) {
		this.changeInfoService = changeInfoService;
	}
	private SelectAllNoticeListService selectAllNoticeListService;
	public void setSelectAllNoticeListService(SelectAllNoticeListService selectAllNoticeListService) {
		this.selectAllNoticeListService = selectAllNoticeListService;
	}
	@GetMapping("/myPage/{section}/{pageNum}")
	public String myPage(@PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum,Model model,HttpSession session) {
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		
		if(userInfo==null){
			return "myPage/nullSession";
		}
		
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		
			
		User user = animalDao.selectByMemberName(userInfo.getName());
		session.setAttribute("user",user);
		
		sectionPage.setName(user.getName());
		
		
		List<FreeBoard> boardList = animalDao.selectTargetFreeBoardsByName(sectionPage);
		int totalCnt = animalDao.selectAllNumFreeBoardByName(sectionPage);
		
		
		for(int i=0;i<boardList.size();i++) {
			if(boardList.get(i).getBoardTitle().length()>=26) {
				String title = boardList.get(i).getBoardTitle().substring(0,26)+"...";
				boardList.get(i).setBoardTitle(title);
			}
		}
		
	
		session.setAttribute("sectionPage", sectionPage);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);

		return "myPage/myInfo";
	}
	
	@RequestMapping("/myPage/delete/{boardNum}")
	public String myPageDelete(@PathVariable("boardNum") long boardNum, Model model) {
		
		String name = animalDao.selectName(boardNum);
		animalDao.boardDelete(boardNum);
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		model.addAttribute("board",boardList);
		
		return "redirect:/myPage/1/1";
	}
	
	@RequestMapping("/checkPassword")
	public String checkPassword() {
		
		return "myPage/checkPassword";
	}
	
	@PostMapping("/checkPassword2/{name}")
	public String checkPassword2(@PathVariable("name") String name,Model model,HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		model.addAttribute("user",user );
		
		return "myPage/changeInfo";
	}
	
	@GetMapping("/newNameWindow/{name}")
	public String newNameWindow(@PathVariable("name") String name, Model model) {

		model.addAttribute("name",name);
		
		return"register/nameCheck";
	}
	@GetMapping("/myNameWindow/{name}")
	public String myNameWindow(@PathVariable("name") String name, Model model) {

		model.addAttribute("name",name);
		
		return"myPage/changeInfoNameCheck";
	}
	
	@GetMapping("/newIdWindow/{id}")
	public String newIdWindow(@PathVariable("id") String id, Model model) {

		model.addAttribute("id",id);
		
		return"register/idCheck";
	}
	
	@PostMapping("/changeInfo")
	public String changeInfo(@ModelAttribute("user") User user,HttpSession session,HttpServletRequest request) {
		
		changeInfoService.changeInfo(user);

		
		LoginUserInfo userInfo = new LoginUserInfo();
		userInfo.setName(user.getName());
		userInfo.setId(user.getId());
		userInfo.setEmail(user.getEmail());
		userInfo.setAdmin(user.getAdmin());
		
		session.setAttribute("userInfo", userInfo);
		
		return "redirect:/myPage/1/1";
	}
	@RequestMapping("/myPage/updeteForm/{boardNum}")
	public String myPageUpdate(@PathVariable("boardNum") long boardNum, Model model) {
		
		FreeBoard freeBoard = freeBoardService.selectFreeBoardByBoardNum(boardNum);
		
		model.addAttribute("freeBoard", freeBoard);
		return "myPage/updateMyBoardForm";
		
	}
	
	@PostMapping("/myPage/updateMyBoard")
	public String updateFreeBoard(@RequestParam(value="boardUrl2") MultipartFile file,
			FreeBoardCommand freeBoardCommand,
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
		
		
		
		
		freeBoardService.updateFreeBoard(freeBoardCommand);
		

		
		return "redirect:/myPage/1/1";
		
	}
	
	@RequestMapping("/mypage/{id}") //?????? ??????
	public String dropMember(@PathVariable("id") String id, HttpSession session, 
			HttpServletRequest request) {
		
		String access_Token = (String)session.getAttribute("access_Token");
		System.out.println(access_Token);
		if(access_Token!=null) {
			kakaoService.unlink(access_Token);
		}
		
		
		String userId = request.getParameter("userId");
		animalDao.dropMember(userId);
		session.invalidate();
		return "redirect:/main";
	}
	
	

	
	
	
}
