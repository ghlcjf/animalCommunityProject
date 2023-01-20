package animal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import animal.vo.AnimalInfo;
import animal.vo.AnimalInfoCommand;
import animal.vo.FreeBoard;
import animal.vo.FreeBoardCommand;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;
import animal.vo.HospitalInfo;
import animal.vo.HospitalInfoCommand;
import animal.vo.Image;
import animal.vo.ImageCommand;
import animal.vo.Issue;
import animal.vo.IssueBoardCommand;
import animal.vo.IssueComment;
import animal.vo.Message;
import animal.vo.SearchMemberCommand;
import animal.vo.SectionPage;
import animal.vo.User;

//import spring.vo.Member;

public class AnimalDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//----------------------------------------------------------------------------

	public List<FreeBoard> selectFreeBoardTop(){
		return sqlSession.selectList("mybatis.mapper.member.selectFreeBoardTop");
		
	}
	public List<FreeBoard> selectAllFreeBoardList() {
		
		return sqlSession.selectList("mybatis.mapper.member.selectAllFreeBoard");
	}

	public FreeBoard selectByFreeBoardNum(long boardNum) {
		//
		return sqlSession.selectOne("mybatis.mapper.member.selectByFreeBoardNum", boardNum);
	}

	public void addViewConutFreeBoard(FreeBoard freeBoard) {
		// 조회수를 늘리는 메서드
		sqlSession.update("mybatis.mapper.member.updateViewCountFreeBoard", freeBoard);
	}

	public void addGoodCount(FreeBoard updateFreeBoard) {
		// 추천 수를 늘리는 메서드
		sqlSession.update("mybatis.mapper.member.updateGoodCountFreeBoard", updateFreeBoard);
		
	}

	public void addBadCount(FreeBoard updateFreeBoard) {
		// 반대 수를 늘리는 메서드
		sqlSession.update("mybatis.mapper.member.updateBadCountFreeBoard", updateFreeBoard);
		
	}

	public void addReportCount(FreeBoard updateFreeBoard) {
		// 신고 수를 늘리는 메서드
		sqlSession.update("mybatis.mapper.member.updateReportCountFreeBoard", updateFreeBoard);
	}

	public List<FreeComment> selectAllFreeComment(long boardNum) {
		// 자유 게시글의 글 번호를 이용해 해당 게시글의 댓글을 리스트로 반환하는 메서드
		return sqlSession.selectList("mybatis.mapper.member.selectAllFreeComment",boardNum);
	}

	public void insertFreeComment(FreeCommentCommand fcc) {
		// 댓글 저장하기
		sqlSession.insert("mybatis.mapper.member.insertFreeComment", fcc);
		
	}
	public void updateFreeBoardCommentCount(int boardNum) {
		// 댓글 저장한 게시글의 commentCount 올리는 메서드
		sqlSession.update("mybatis.mapper.member.updateFreeBoardCommentCount", boardNum);
	}

	
	

	public List<FreeComment> selectAllFreeComment2(String boardNum) {
		// 글 번호를 이용해 댓글 불러오기 (역순으로 불러와 index 0번만 쓸 용도)
		return sqlSession.selectList("mybatis.mapper.member.selectAllFreeComment2",boardNum);
	}
	public void insertFreeBoard(FreeBoardCommand bc) {
		// 게시글 저장하기
		sqlSession.insert("mybatis.mapper.member.insertFreeBoard", bc);
	}
	
	public void updateFreeBoard(FreeBoardCommand freeBoardCommand) {
		// 게시글 수정하기
		sqlSession.update("mybatis.mapper.member.updateFreeBoard", freeBoardCommand);
		
	}

	
	

//	public List<FreeBoard> selectDogFreeBoardList() {
//		// 강아지 게시글 불러오기
//		return sqlSession.selectList("mybatis.mapper.member.selectDogFreeBoardList");
//	}
//
//	public List<FreeBoard> selectCatFreeBoardList() {
//		// 고양이 게시글 불러오기
//		return sqlSession.selectList("mybatis.mapper.member.selectCatFreeBoardList");
//	}
//
//	public List<FreeBoard> selectReptileFreeBoardList() {
//		// 파충류 게시글 불러오기
//		return sqlSession.selectList("mybatis.mapper.member.selectReptileFreeBoardList");
//	}
//
//	public List<FreeBoard> selectBirdsFreeBoardList() {
//		// 조류 게시글 불러오기
//		return sqlSession.selectList("mybatis.mapper.member.selectBirdsFreeBoardList");
//	}
//	public List<FreeBoard> selectFishFreeBoardList() {
//		// 어류 게시글 불러오기
//		return sqlSession.selectList("mybatis.mapper.member.selectFishFreeBoardList");
//	}
//	public List<FreeBoard> selectOtherFreeBoardList() {
//		// 기타 게시글 불러오기
//		return sqlSession.selectList("mybatis.mapper.member.selectOtherFreeBoardList");
//	}
	public List<FreeBoard> selectAllNoticeList() {
		// 공지사항 불러오기
		return sqlSession.selectList("mybatis.mapper.member.selectAllNoticeList");
	}
	
	
	public int selectAllNumFreeBoard() {
		// 자유게시판 내의 게시글의 총 수를 불러오는 메서드
		return sqlSession.selectOne("mybatis.mapper.member.selectAllNumFreeBoard");
	}
	public int selectAnimalNumFreeBoard(SectionPage sectionPage) {
		
		return  sqlSession.selectOne("mybatis.mapper.member.selectAnimalNumFreeBoard", sectionPage);
	}
	
	public List<FreeBoard> selectTargetFreeBoards(SectionPage sectionPage) {
		
		return sqlSession.selectList("mybatis.mapper.member.selectTargetFreeBoards", sectionPage);
	}
	public List<FreeBoard> selectAnimalTargetFreeBoards(SectionPage sectionPage) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mybatis.mapper.member.selectAnimalTargetFreeBoards", sectionPage);
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

	public List<HospitalInfo> selectHospitalGyeonggi() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalGyeonggi");
	}

	public List<HospitalInfo> selectHospitalGangwon() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalGangwon");
	}

	public List<HospitalInfo> selectHospitalChungcheong() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalChungcheong");
	}

	public List<HospitalInfo> selectHospitalGyeongsang() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalGyeongsang");
	}

	public List<HospitalInfo> selectHospitalJeolla() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitalJeolla");
	}

	public List<HospitalInfo> selectHospitaljeju() {
		return sqlSession.selectList("mybatis.mapper.member.selectHospitaljeju");
	}



		

	//--------------------------------매니저 페이지----------------------------------------------
		
	public void insertIssueBoard(IssueBoardCommand issueBoardCommand) {
		
		sqlSession.insert("mybatis.mapper.member.insertIssueBoard", issueBoardCommand);
	}

	public void insertHospitalInfo(HospitalInfoCommand hospitalInfoCommand) {
		sqlSession.insert("mybatis.mapper.member.insertHospitalInfo", hospitalInfoCommand);
	}
		
	public void insertAnimalInfo(AnimalInfoCommand animalInfoCommand) {
		sqlSession.insert("mybatis.mapper.member.insertAniamlInfo", animalInfoCommand);
	}

	public void updateIssueBoard(IssueBoardCommand issueBoardCommand) {
		sqlSession.update("mybatis.mapper.member.updateIssueBoard", issueBoardCommand);
	}
	public void updateAnimalInfo(AnimalInfoCommand animalInfoCommand) {
		sqlSession.update("mybatis.mapper.member.updateAnimalInfo", animalInfoCommand);
	}
	public void updateHospitalInfo(HospitalInfoCommand hospitalInfoCommand) {
		sqlSession.update("mybatis.mapper.member.updateHospitalInfo", hospitalInfoCommand);
	}
	public void deleteIssueBoardByBoardNum(long issueNum) {
		sqlSession.delete("mybatis.mapper.member.deleteIssueBoardByBoardNum", issueNum);
	}
	public void deleteAnimalInfoByBoardNum(long animalNum) {
		sqlSession.delete("mybatis.mapper.member.deleteAnimalInfoByBoardNum", animalNum);
	}
	public void deleteHospitalInfoByBoardNum(long boardNum) {
		sqlSession.delete("mybatis.mapper.member.deleteHospitalInfoByBoardNum", boardNum);
	}
	public List<Image> selectAllImageList() {
		return sqlSession.selectList("mybatis.mapper.member.selectAllImageList");
	}
	public void insertImage(ImageCommand imageCommand) {
		sqlSession.insert("mybatis.mapper.member.insertImage", imageCommand);
	}
	public Image selectImageByBoardNum(long imageNum) {
		return sqlSession.selectOne("mybatis.mapper.member.selectImageByBoardNum", imageNum);
	}
	public void updateImage(ImageCommand imageCommand) {
		sqlSession.update("mybatis.mapper.member.updateImage", imageCommand);
	}
	public void deleteImageByBoardNum(long imageNum) {
		sqlSession.delete("mybatis.mapper.member.deleteImageByBoardNum", imageNum);
	}




	
	//----------------------------관리자 회원관리----------------------------------------

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


	public void dropMember(String id) {
		
		sqlSession.delete("mybatis.mapper.member.dropMember", id);
	}

	public String nameCheck(String name) {
		
		return sqlSession.selectOne("mybatis.mapper.member.nameCheck",name);
	}

	public void changeInfo(User user) {

		sqlSession.update("mybatis.mapper.member.changeInfo", user);
	}

	public void authorize(String id) {
		System.out.println(id);
		sqlSession.update("mybatis.mapper.member.authorize", id);
	}

	public List<FreeBoard> reportFreeBoard() {
		
		return sqlSession.selectList("mybatis.mapper.member.reportFreeBoard");
	}

	public String idCheck(String id) {
		
		return sqlSession.selectOne("mybatis.mapper.member.idCheck",id);
	}

	public int getUnReadCheck(String receiverName) {
		return sqlSession.selectOne("mybatis.mapper.member.getUnReadCheck", receiverName);
	}

	public List<Message> selectAllReceiveList(String receiverName) {
		return sqlSession.selectList("mybatis.mapper.member.selectAllReceiveList", receiverName);
	}

	public List<Message> selectAllSendList(String senderName) {
		return sqlSession.selectList("mybatis.mapper.member.selectAllSendList", senderName);
	}

	public void readCheckByMessageNum(int messageNum) {
		sqlSession.update("mybatis.mapper.member.readCheckByMessageNum", messageNum);
	}

	public Message selectMessageByMessageNum(int messageNum) {
		return sqlSession.selectOne("mybatis.mapper.member.selectMessageByMessageNum", messageNum);
	}

	public void sendMessage(Message message) {
		sqlSession.insert("mybatis.mapper.member.sendMessage", message);
	}

	public void deleteReceiveBoxMessage(int messageNum) {
		sqlSession.update("mybatis.mapper.member.deleteReceiveBoxMessage", messageNum);
		sqlSession.delete("mybatis.mapper.member.deleteAllBoxMessage");
	}

	public void deleteSendBoxMessage(int messageNum) {
		sqlSession.update("mybatis.mapper.member.deleteSendBoxMessage", messageNum);
		sqlSession.delete("mybatis.mapper.member.deleteAllBoxMessage");
	}

	public List<User> selectTargetMemberList(SectionPage sectionPage) {
		
		return sqlSession.selectList("mybatis.mapper.member.selectTargetMemberList",sectionPage);
	}

	public int selectAllNumMember() {
		
		return sqlSession.selectOne("mybatis.mapper.member.selectAllNumMember");
	}

	public List<Issue> selectTargetIssueList(SectionPage sectionPage) {
		
		return sqlSession.selectList("mybatis.mapper.member.selectTargetIssueList",sectionPage);
	}

	public int selectAllNumIssue() {
		
		return sqlSession.selectOne("mybatis.mapper.member.selectAllNumIssue");
	}


}
