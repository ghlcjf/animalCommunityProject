package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;
import animal.vo.User;

@Controller
public class OtherInfoController {
	
	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("/other/detail/{name}")
	public String otherDetail(@PathVariable("name") String name, HttpSession session, Model model) {
		
		User user = animalDao.selectbyBoardName(name);
		session.setAttribute("other", user);
		
		List<FreeBoard> otherFreeboard = animalDao.selectAllOtherFreeBoard(name);
		session.setAttribute("board", otherFreeboard);
		
		return "freeBoard/otherInfo";
	}
}
