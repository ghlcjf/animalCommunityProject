package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;
import animal.vo.LoginUserInfo;
import animal.vo.RegisterRequest;
import animal.vo.User;

@Controller
public class MyPageController {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("/myPage")
	public String myPage(HttpSession session, Model model) {
			
		if(session.getAttribute("userInfo")==null){
			return "myPage/nullSession";
		}
		
		LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
		
		User user = animalDao.selectByMemberName(userInfo.getName());
		session.setAttribute("user",user);
		
		List<FreeBoard> boardList = animalDao.getboardList(userInfo.getName());
		model.addAttribute("board",boardList);
		
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
	
	@GetMapping("/newWindow/{name}")
	public String newWindow(@PathVariable("name") String name, Model model) {

		model.addAttribute("name",name);
		
		return"register/nameCheck";
	}
	
	@PostMapping("/changeInfo")
	public String changeInfo(@ModelAttribute("user") User user) {
		
		
		
		return "myPage/myInfo";
	}
}
