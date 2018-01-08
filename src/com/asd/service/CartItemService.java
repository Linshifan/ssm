package com.asd.service;

import java.util.List;

import com.asd.domain.CartItem;

public interface CartItemService {
	//通过用户查找购物车
	public List<CartItem> myCart(String uid);
	//添加条目
	public void add(CartItem cartItem);
	//批量删除
	public void batchDelete(List<String> list);
	//修改数量
	public CartItem updateQuantity(int quantity,String cartItemId);
	//加载批量条目
	public List<CartItem> loadCartItems(List<String> list);
	
}
