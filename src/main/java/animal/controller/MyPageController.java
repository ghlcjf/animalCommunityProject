package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.service.ChangeInfoService;
import animal.vo.FreeBoard;
import animal.vo.LoginUserInfo;
import animal.vo.User;

@Controller
public class MyPageController {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
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
	public String changeInfo(@ModelAttribute("user") User user,HttpSession session) {

		changeInfoService.changeInfo(user);
	
//		session.invalidate();
		
		LoginUserInfo userInfo = new LoginUserInfo();
		userInfo.setName(user.getName());
		userInfo.setId(user.getId());
		userInfo.setEmail(user.getEmail());
		userInfo.setAdmin(user.getAdmin());
		
		session.setAttribute("userInfo", userInfo);
		
		return "myPage/myInfo";
	}
}
