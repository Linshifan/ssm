package com.asd.domain;

import java.math.BigDecimal;


public class CartItem {
	//购物车条目
	private String cartItemId;//主键id
	private int quantity;//数量
	private User user;//所属用户
	private Book book;//条目对应的图书
	
	//添加小计方法
	public double getSubtotal(){
		BigDecimal b1 = new BigDecimal(book.getCurrPrice()+"");
		BigDecimal b2 = new BigDecimal(quantity+"");
		BigDecimal b3 = b1.multiply(b2);
 		return b3.doubleValue();
	}
	
	public CartItem() {
		super();
	}


	public String getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
}
