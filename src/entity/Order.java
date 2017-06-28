package entity;

public class Order {
	private int id;
	private User user;
	private Product product;
	private int num;
	private String orderNum;
	private int payment;
	private int send;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getSend() {
		return send;
	}

	public void setSend(int send) {
		this.send = send;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", product=" + product
				+ ", num=" + num + ", orderNum=" + orderNum + ", payment="
				+ payment + ", send=" + send + "]";
	}

}
