package animal.vo;

import java.util.Date;

public class Message {
	
	private int messageNum;
    private String receiverName;
    private String senderName;
    private String messageTitle;
    private String messageContent;
    private int distinction;
    private int readYN;
    private Date writeDate;
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public int getDistinction() {
		return distinction;
	}
	public void setDistinction(int distinction) {
		this.distinction = distinction;
	}
	public int getReadYN() {
		return readYN;
	}
	public void setReadYN(int readYN) {
		this.readYN = readYN;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
    
    
    
	
}
