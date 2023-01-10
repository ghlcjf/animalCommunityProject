package animal.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import animal.vo.AnimalInfo;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;
import animal.vo.HospitalInfo;
import animal.vo.HospitalInfoCommand;
import animal.vo.Issue;
import animal.vo.IssueBoardCommand;
import animal.vo.IssueComment;
import animal.vo.SearchMemberCommand;
import animal.vo.User;

//import spring.vo.Member;

public class AnimalDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//----------------------------------------------------------------------------

	public List<FreeBoard> selectAllFreeBoardList() {
		
		return sqlSession.selectList("mybatis.mapper.member.selectAllFreeBoard");
	}

	public FreeBoard selectByFreeBoardNum(long boardNum) {
		
		return sqlSession.selectOne("mybatis.mapper.member.selectByFreeBoardNum", boardNum);
	}

	public void addViewConutFreeBoard(FreeBoard freeBoard) {
		
		sqlSession.update("mybatis.mapper.member.updateViewCountFreeBoard", freeBoard);
	}

	public void addGoodCount(FreeBoard updateFreeBoard) {
		
		sqlSession.update("mybatis.mapper.member.updateGoodCountFreeBoard", updateFreeBoard);
		
	}

	public void addBadCount(FreeBoard updateFreeBoard) {
		
		sqlSession.update("mybatis.mapper.member.updateBadCountFreeBoard", updateFreeBoard);
		
	}

	public void addReportCount(FreeBoard updateFreeBoard) {
		
		sqlSession.update("mybatis.mapper.member.updateReportCountFreeBoard", updateFreeBoard);
	}

	public List<FreeComment> selectAllFreeComment(long boardNum) {
		// 자유 게시글의 글 번호를 이용해 해당 게시글의 댓글을 리스트로 반환하는 메서드
		return sqlSession.selectList("mybatis.mapper.member.selectAllFreeComment",boardNum);
	}

	public void insertFreeComment(FreeCommentCommand fcc) {
		
		sqlSession.insert("mybatis.mapper.member.insertFreeComment", fcc);
		
	}

	public List<FreeComment> selectAllFreeComment2(String boardNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mybatis.mapper.member.selectAllFreeComment2",boardNum);
	}
	public void insertFreeBoard(FreeBoardCommand bc) {
		sqlSession.insert("mybatis.mapper.member.insertFreeBoard", bc);
	}

	public List<FreeBoard> selectDogFreeBoardList() {
		// 강아지 게시글 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectDogFreeBoardList");
	}

	public List<FreeBoard> selectCatFreeBoardList() {
		// 고양이 게시글 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectCatFreeBoardList");
	}

	public List<FreeBoard> selectReptileFreeBoardList() {
		// 파충류 게시글 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectReptileFreeBoardList");
	}

	public List<FreeBoard> selectBirdsFreeBoardList() {
		// 조류 게시글 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectBirdsFreeBoardList");
	}
	public List<FreeBoard> selectFishFreeBoardList() {
		// 어류 게시글 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectFishFreeBoardList");
	}
	public List<FreeBoard> selectOtherFreeBoardList() {
		// 기타 게시글 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectOtherFreeBoardList");
	}
	public List<FreeBoard> selectAllNoticeList() {
		// 공지사항 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectAllNoticeList");
	}
	
//-------------------이슈-------------------------------------------------------------------------
	public List<Issue> selectAllIssueList() {
		
		return sqlSession.selectList("mybatis.mapper.member.selectAllIssueList");
	}

	public List<IssueComment> getIssueComments(long issueNum) {
		
		return sqlSession.selectList("mybatis.mapper.member.getIssueComments",issueNum);
	}

	public Issue selectByIssueNum(long issueNum) {
		
		return sqlSession.selectOne("mybatis.mapper.member.selectByIssueNum",issueNum);
	}

	public void updateViewCount(Issue updateIssue) {
		
		sqlSession.update("mybatis.mapper.member.updateViewCount",updateIssue);
	}
	
	public Issue selectByIssue(long issueNum) {
		
		return sqlSession.selectOne("mybatis.mapper.member.selectByIssue",issueNum);
	}

	public void insertIssueComment(IssueComment issueComment) {
		
		sqlSession.insert("mybatis.mapper.member.insertIssueComment",issueComment);
	}

	public List<IssueComment> getIssueComments2(String boardNum) {
		
		return sqlSession.selectList("mybatis.mapper.member.getIssueComments2",boardNum);
	}
	
	//--------------------동물 소개------------------------------------------------------
	
	public List<AnimalInfo> selectAllAniaml() {
		return sqlSession.selectList("mybatis.mapper.member.selectAllAniaml");
	}
	
	public AnimalInfo selectByNum(long animalNum) {
		return sqlSession.selectOne("mybatis.mapper.member.selectByAnimalNum", animalNum);
	}

	public int addViewCount(AnimalInfo updateAnimalInfo) {
		return sqlSession.update("mybatis.mapper.member.addViewCount", updateAnimalInfo);
	}
	
	
	//------------------------로그인----------------------------------------------------------
	public List<User> selectAll(){
		return sqlSession.selectList("mybatis.mapper.member.selectAll");
	}
	
	public User selectByEmail(String email) {
		return sqlSession.selectOne("mybatis.mapper.member.selectByEmail", email);
	}
	
	public int admin() {
		return sqlSession.selectOne("mybatis.mapper.member.selectAdmin");
	}
	
	public void insertUser(User u) {
		sqlSession.update("mybatis.mapper.member.insertMember",u);
	}	
	
	public void update(User u) {
		sqlSession.update("mybatis.mapper.member.updateMember",u);
	}

	public User selectById(String id) {
		return sqlSession.selectOne("mybatis.mapper.member.selectById", id);
	}
	
	

	//-----------------------------병원소개-------------------------------------------------
	
	public List<HospitalInfo> selectAllHospital() {
		return sqlSession.selectList("mybatis.mapper.member.selectAllHospital");
	}

	public HospitalInfo selectByHospitalNum(long boardNum) { 
		return sqlSession.selectOne("mybatis.mapper.member.selectByHospitalNum", boardNum);
	}
	 
	public void addGoodCount(HospitalInfo updateHospitalInfo) {
		sqlSession.update("mybatis.mapper.member.updateGoodCountHospitalInfo", updateHospitalInfo);
	}

	public void addBadCount(HospitalInfo updateHospitalInfo) {
		sqlSession.update("mybatis.mapper.member.updateBadCountHospitalInfo", updateHospitalInfo);
	}

	public List<HospitalInfo> selectHospitalSeoul() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalSeoul");
	}

	public List<HospitalInfo> selectHospitalGyeongi() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalGyeongi");
	}

	public List<HospitalInfo> selectHospitalIncheon() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalIncheon");
	}

	public List<HospitalInfo> selectHospitalDaejeon() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalDaejeon");
	}


		

	//--------------------------------매니저 페이지----------------------------------------------
		
	public void insertIssueBoard(IssueBoardCommand issueBoardCommand) {
		
		sqlSession.insert("mybatis.mapper.member.insertIssueBoard", issueBoardCommand);
	}

	public void insertHospitalInfo(HospitalInfoCommand hospitalInfoCommand) {
		sqlSession.insert("mybatis.mapper.member.insertHospitalInfo", hospitalInfoCommand);
	}
		


	
	

	
	//----------------------------관리자 회원관리----------------------------------------
	public List<User> memberList() {
		
		return sqlSession.selectList("mybatis.mapper.member.memberList");
	}

	public List<User> searchMember(SearchMemberCommand search) {

		return sqlSession.selectList("mybatis.mapper.member.searchMember", search);
	}

	public User selectByMemberName(String name) {
		
		return sqlSession.selectOne("mybatis.mapper.member.selectByMemberName", name);
	}

	public List<FreeBoard> getboardList(String name) {
		
		return sqlSession.selectList("mybatis.mapper.member.getboardList", name);
	}

	public void boardDelete(long boardNum) {
		
		sqlSession.delete("mybatis.mapper.member.boardDelete", boardNum);
	}

	public String selectName(long boardNum) {
		 
		return sqlSession.selectOne("mybatis.mapper.member.selectName", boardNum);
		
	}

	

	
	
	
	
}
