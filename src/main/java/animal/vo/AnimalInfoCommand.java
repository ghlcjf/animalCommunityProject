package animal.vo;

public class AnimalInfoCommand {
	private String animalTitle;
    private String animalContent;
    private String animalCategory;
    private String animalUrl;
    private String name;
    private int animalNum;
	public int getAnimalNum() {
		return animalNum;
	}
	public void setAnimalNum(int animalNum) {
		this.animalNum = animalNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAnimalTitle() {
		return animalTitle;
	}
	public void setAnimalTitle(String animalTitle) {
		this.animalTitle = animalTitle;
	}
	public String getAnimalContent() {
		return animalContent;
	}
	public void setAnimalContent(String animalContent) {
		this.animalContent = animalContent;
	}
	public String getAnimalCategory() {
		return animalCategory;
	}
	public void setAnimalCategory(String animalCategory) {
		this.animalCategory = animalCategory;
	}
	public String getAnimalUrl() {
		return animalUrl;
	}
	public void setAnimalUrl(String animalUrl) {
		this.animalUrl = animalUrl;
	}
    
}
