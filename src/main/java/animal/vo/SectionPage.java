package animal.vo;

public class SectionPage {
	
	private int section;
	private int pageNum;
	private String boardCategory;
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public SectionPage(int section, int pageNum) {
		super();
		this.section = section;
		this.pageNum = pageNum;
	}
	
	

}
