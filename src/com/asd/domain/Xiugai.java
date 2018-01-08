package com.asd.domain;

public class Xiugai {
	private int quantity;
	private double subtotal;
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
	public Xiugai() {
		super();
	}
	public Xiugai(int quantity, double subtotal) {
		this.quantity = quantity;
		this.subtotal = subtotal;
	}
}
