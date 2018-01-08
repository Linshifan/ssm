package com.asd.service;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asd.domain.CartItem;
import com.asd.mapper.CartItemMapper;

@Service("cartItemService")
public class CartItemServiceImpl implements CartItemService {

	@Resource(name="cartItemMapper")
	private CartItemMapper cartItemMapper;
	
	public CartItemMapper getCartItemMapper() {
		return cartItemMapper;
	}

	public void setCartItemMapper(CartItemMapper cartItemMapper) {
		this.cartItemMapper = cartItemMapper;
	}
	//加载我的购物车根据本用户登录的uid
	@Override
	public List<CartItem> myCart(String uid) {
		return cartItemMapper.findByUser(uid);
	}
	//增加购物车的数目
	@Override
	public void add(CartItem cartItem) {
		CartItem _cartItem =  cartItemMapper.findByUidAndBid(cartItem.getUser().getUid(),cartItem.getBook().getBid());
		if(_cartItem == null){
			//如果没有这个条目就添加
			cartItem.setCartItemId(UUID.randomUUID().toString().substring(0,3));
			cartItemMapper.addCartItem(cartItem.getCartItemId(), cartItem.getQuantity(), cartItem.getBook().getBid(), cartItem.getUser().getUid());;
		}else{
			//否则就修改数量
			int quantity = cartItem.getQuantity()+_cartItem.getQuantity();
			cartItemMapper.updateQuantity(quantity, _cartItem.getCartItemId());
		}
	}
	//批量删除
	@Override
	public void batchDelete(List<String> list) {
		cartItemMapper.batchDelete(list);
		
	}
	//更新数量
	@Override
	public CartItem updateQuantity(int quantity, String cartItemId) {
		cartItemMapper.updateQuantity(quantity, cartItemId);
		return cartItemMapper.findByCartItemId(cartItemId);
	}
	//批量加载
	@Override
	public List<CartItem> loadCartItems(List<String> list) {
		return cartItemMapper.loadCartItems(list);
	}

}
