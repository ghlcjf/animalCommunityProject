package animal.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;
import animal.vo.SearchMemberCommand;
import animal.vo.User;

@Controller
public class ManagerController {
	
	private AnimalDao animalDao;
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	@GetMapping("/manager/managerMain")
	public String manager() {
		
		return "manager/managerMain";
	}
	
	@GetMapping("/memberManagement")
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
	
	@GetMapping("/member/detail/{name}")
	public String memberDetail(@PathVariable("name") String name, HttpSession session) {
		
		User user = animalDao.selectByMemberName(name);
		session.setAttribute("member",user);
//		model.addAttribute("member",user);
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		session.setAttribute("board",boardList);
//		model.addAttribute("board",boardList);
		
		return "manager/memberDetail";
	}
	
	@GetMapping("/board/delete/{boardNum}")
	public String delete(@PathVariable("boardNum") long boardNum,Model model) {
		
//		System.out.println("삭제?");
//		System.out.println(boardNum);
		String name = animalDao.selectName(boardNum);
		animalDao.boardDelete(boardNum);
		
		
		List<FreeBoard> boardList = animalDao.getboardList(name);
		model.addAttribute("board",boardList);
		
		return "manager/memberDetail";
	}
	
	
}
