package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import animal.dao.AnimalDao;
import animal.vo.FreeBoard;
import animal.vo.SectionPage;
import animal.vo.User;

@Controller
public class OtherInfoController {
	
	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("/other/detail/{name}/{section}/{pageNum}")
	public String otherDetail(@PathVariable("name") String name,
			@PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum, Model model, HttpSession session) {
		
		
		User user = animalDao.selectbyBoardName(name);
		session.setAttribute("other", user);
		
		SectionPage sectionPage = new SectionPage(section, pageNum);
		
		List<FreeBoard> otherFreeboard = animalDao.selectAllOtherFreeBoard(name, sectionPage);
		session.setAttribute("board", otherFreeboard);
		
		int totalCnt = animalDao.selectAllNumOtherFreeboard();
		
		model.addAttribute("totalCnt", totalCnt);
		session.setAttribute("sectionPage", sectionPage);
		
		return "freeBoard/otherInfo";
	}
}
