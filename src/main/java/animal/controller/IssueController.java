package animal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import animal.dao.AnimalDao;
import animal.exception.MemberNotFoundException;
import animal.vo.Issue;
import animal.vo.IssueComment;
import animal.vo.SectionPage;

@Controller
public class IssueController {
	
	private AnimalDao animalDao;
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}



	@GetMapping("/issue/{section}/{pageNum}")
	public String issueBoard(@PathVariable("section") int section,@PathVariable("pageNum") int pageNum,Model model) {
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		List<Issue> issueList = animalDao.selectTargetIssueList(sectionPage);

		for(int i=0;i<issueList.size();i++) {
			if(issueList.get(i).getIssueTitle().length()>=26) {
				String title = issueList.get(i).getIssueTitle().substring(0,26)+"...";
				issueList.get(i).setIssueTitle(title);
			}
		}
		
		int totalCnt = animalDao.selectAllNumIssue();
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("sectionPage", sectionPage);
		model.addAttribute("issue",issueList);
		
		return "issue/issueBoard";
	}
	
	@GetMapping("/issue/detail/{issueNum}")
	public String issueDetail(@PathVariable("issueNum") long issueNum, Model model) {
				

		// 조회수 증가
		Issue updateIssue = animalDao.selectByIssueNum(issueNum);
		animalDao.updateViewCount(updateIssue);
		
		
		// 상세보기
		Issue issue = animalDao.selectByIssue(issueNum);
		
		if(issue == null) {
			throw new MemberNotFoundException();
		}
		
		model.addAttribute("issue",issue);
		
		// 댓글 가져오기
		List<IssueComment> issueComment = animalDao.getIssueComments(issueNum);
		
		model.addAttribute("issueComment",issueComment);
		
		
		
		return "issue/issueDetail";
	}
	
}
