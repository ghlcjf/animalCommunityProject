package animal.vo;

import java.util.Date;

public class Message {
	private int messageNum;
	private int room;
	private String senderName;
	private String receiverName;
	private Date sendTime;
	private Date readTime;
	private String messageContent;
	private int readCheck; 
	
	
	private String otherNick;
	private String profile;
	private String nick;
	private int unRead;
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public Date getReadTime() {
		return readTime;
	}
	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public int getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}
	public String getOtherNick() {
		return otherNick;
	}
	public void setOtherNick(String otherNick) {
		this.otherNick = otherNick;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getUnRead() {
		return unRead;
	}
	public void setUnRead(int unRead) {
		this.unRead = unRead;
	}
	
	
	
	
	
}
