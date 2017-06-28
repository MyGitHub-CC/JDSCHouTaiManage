package entity;

public class Product {
	private int id;
	private String name;
	private double price;
	private int repertory;
	private int num;
	private String photo;
	private String introduce;
	private String author;
	private Publishing publishing;
	private Kind kind;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getRepertory() {
		return repertory;
	}

	public void setRepertory(int repertory) {
		this.repertory = repertory;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Publishing getPublishing() {
		return publishing;
	}

	public void setPublishing(Publishing publishing) {
		this.publishing = publishing;
	}

	public Kind getKind() {
		return kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price
				+ ", repertory=" + repertory + ", num=" + num + ", photo="
				+ photo + ", introduce=" + introduce + ", author=" + author
				+ ", publishing=" + publishing + ", kind=" + kind + "]";
	}

}
