package com.asd.domain;

public class OrderItems {
	private String orderItemId;//主键
	private int quantity;//数量
	private double subtotal;//小计
	private String bid;
	private String bname;
	private double currPrice;
	private String image_b;
	private String oid;
	public OrderItems(String orderItemId, int quantity, double subtotal, String bid, String bname, double currPrice,
			String image_b, String oid) {
		this.orderItemId = orderItemId;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.bid = bid;
		this.bname = bname;
		this.currPrice = currPrice;
		this.image_b = image_b;
		this.oid = oid;
	}
	public OrderItems() {
	}
	public String getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getCurrPrice() {
		return currPrice;
	}
	public void setCurrPrice(double currPrice) {
		this.currPrice = currPrice;
	}
	public String getImage_b() {
		return image_b;
	}
	public void setImage_b(String image_b) {
		this.image_b = image_b;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
}
