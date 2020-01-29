package jy.com.homedream.DTO;

public class JY_OrderlistDTO {
	
private int order_no;
private String orderdate;
private int status;
private int cost;
public int getOrder_no() {
	return order_no;
}
public void setOrder_no(int order_no) {
	this.order_no = order_no;
}
public String getOrderdate() {
	return orderdate;
}
public void setOrderdate(String orderdate) {
	this.orderdate = orderdate;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public int getCost() {
	return cost;
}
public void setCost(int cost) {
	this.cost = cost;
}

}
