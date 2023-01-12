package animal.vo;

public class HospitalInfoCommand {
	private String hospitalName;
    private String hospitalLoc;
    private String hospitalTel;
    private String hospitalInfo;
    private String name;
    private String detailedAddress;
    private int boardNum;
    
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getDetailedAddress() {
		return detailedAddress;
	}
	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getHospitalLoc() {
		return hospitalLoc;
	}
	public void setHospitalLoc(String hospitalLoc) {
		this.hospitalLoc = hospitalLoc;
	}
	public String getHospitalTel() {
		return hospitalTel;
	}
	public void setHospitalTel(String hospitalTel) {
		this.hospitalTel = hospitalTel;
	}
	public String getHospitalInfo() {
		return hospitalInfo;
	}
	public void setHospitalInfo(String hospitalInfo) {
		this.hospitalInfo = hospitalInfo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
    
    
}
