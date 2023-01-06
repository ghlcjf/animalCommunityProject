package animal.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import animal.vo.AnimalInfo;
import animal.vo.FreeBoard;
import animal.vo.FreeComment;
import animal.vo.FreeCommentCommand;
import animal.vo.Issue;
import animal.vo.IssueComment;
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

	public void insertComment(IssueComment issueComment) {
		
		sqlSession.insert("mybatis.mapper.member.insertComment",issueComment);
	}
	
	//--------------------동물 소개------------------------------------------------------
	
	public List<AnimalInfo> selectAllAniaml() {
		return sqlSession.selectList("mybatis.mapper.member.selectAllAniaml");
	}
	
	public AnimalInfo selectByNum(int animalNum) {
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
	
	
	
	
}
