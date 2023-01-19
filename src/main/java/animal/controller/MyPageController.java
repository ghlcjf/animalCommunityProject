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
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.LoginUserInfo;
import animal.vo.User;

@Controller
public class MyPageController {

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

	@GetMapping("/myPage")
	public String myPage(HttpSession session) {
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		
		if(userInfo==null){
			return "myPage/nullSession";
		}
			
		User user = animalDao.selectByMemberName(userInfo.getName());
		session.setAttribute("user",user);
		
		List<FreeBoard> boardList = animalDao.getboardList(user.getName());
		session.setAttribute("board",boardList);
//		System.out.println(user.getName());
		return "myPage/myInfo";
	}
	
	@RequestMapping("/myPage/delete/{boardNum}")
	public String myPageDelete(@PathVariable("boardNum") long boardNum, Model model) {
		
		System.out.println("하이");
		String name = animalDao.selectName(boardNum);
		animalDao.boardDelete(boardNum);
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		model.addAttribute("board",boardList);
		
		return "myPage/myInfo";
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
	
	@GetMapping("/newIdWindow/{id}")
	public String newIdWindow(@PathVariable("id") String id, Model model) {

		model.addAttribute("id",id);
		
		return"register/idCheck";
	}
	
	@PostMapping("/changeInfo")
	public String changeInfo(@ModelAttribute("user") User user,HttpSession session,HttpServletRequest request) {
		
		changeInfoService.changeInfo(user);

//		session.invalidate();
		LoginUserInfo userInfo = new LoginUserInfo();
		userInfo.setName(user.getName());
		userInfo.setId(user.getId());
		userInfo.setEmail(user.getEmail());
		userInfo.setAdmin(user.getAdmin());
		
		session.setAttribute("userInfo", userInfo);
		
		return "redirect:/myPage";
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
		
		
		String uploadDir = "C:\\Users\\GREEN\\git\\animalCommunityProject\\src\\main\\webapp\\resources\\freeBoardImage";
		
		
		
		if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();

            freeBoardCommand.setBoardUrl(filename);
            file.transferTo(new File(uploadDir,filename));
        }else {
        	String filename = request.getParameter("originPic");
        	freeBoardCommand.setBoardUrl(filename);
        	
        }
		
		
		
		
		freeBoardService.updateFreeBoard(freeBoardCommand);
		

		
		return "redirect:/myPage";
		
	}
	
	@RequestMapping("/mypage/{id}") //회원 탈퇴
	public String dropMember(@PathVariable("id") String id, HttpSession session) {
		System.out.println(id);
		animalDao.dropMember(id);
		session.invalidate();
		return "redirect:/main";
	}
}
