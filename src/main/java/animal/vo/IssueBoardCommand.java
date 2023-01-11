package animal.vo;

public class IssueBoardCommand {
	
	private String issueTitle;
    private String issueContent;
    private String name;
    private String issueUrl;
    private int issueNum;
    
    
	public int getIssueNum() {
		return issueNum;
	}
	public void setIssueNum(int issueNum) {
		this.issueNum = issueNum;
	}
	public String getIssueTitle() {
		return issueTitle;
	}
	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
	}
	public String getIssueContent() {
		return issueContent;
	}
	public void setIssueContent(String issueContent) {
		this.issueContent = issueContent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIssueUrl() {
		return issueUrl;
	}
	public void setIssueUrl(String issueUrl) {
		this.issueUrl = issueUrl;
	}
    
    
	
	
	
}
