package com.asd.mapper;

import java.util.List;

import com.asd.domain.CartItem;

public interface CartItemMapper {
	//查找本用户的购物车
	public List<CartItem> findByUser(String uid);
	//根据uid和bid查找cartitem
	public CartItem findByUidAndBid(String uid,String bid);
	//根据购物条目的id进行修改数量
	public void updateQuantity(int quantity,String cartItemId);
	//按照cartitemid进行查找
	public CartItem findByCartItemId(String cartItemId);
	//增加购物车的条目
	public void addCartItem(String cartItemId,int quantity,String bid,String uid);
	//批量删除购物车的条目
	public void batchDelete(List<String> list);
	//批量查找cartitem
	public List<CartItem> loadCartItems(List<String> list);
}
