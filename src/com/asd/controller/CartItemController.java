package com.asd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asd.domain.Book;
import com.asd.domain.CartItem;
import com.asd.domain.User;
import com.asd.domain.Xiugai;
import com.asd.service.CartItemService;

@Controller
@RequestMapping(value="/cartitem")
public class CartItemController {
	
	@Resource(name="cartItemService")
	private CartItemService cartItemService;
	
	public CartItemService getCartItemService() {
		return cartItemService;
	}

	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}

	//查找该用户的所有cartitem
	@RequestMapping(value="/myCart")
	public String myCart(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		User user = (User) req.getSession().getAttribute("sessionUser");
		String uid = user.getUid();
		List<CartItem> cartItemList = cartItemService.myCart(uid);
		req.setAttribute("cartItemList", cartItemList);
		return "cart/list";
	}
	//添加条目
	@RequestMapping(value="/add")
	public String add(int quantity,String bid,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		Book book = new Book();
		book.setBid(bid);
		CartItem cartItem = new CartItem();
		cartItem.setQuantity(quantity);
		User user = (User) req.getSession().getAttribute("sessionUser");
		cartItem.setBook(book);
		cartItem.setUser(user);
		cartItemService.add(cartItem);
		return myCart(req, resp);
	}
	
	//批量删除
	@RequestMapping(value="/batchDelete")
	public String batchDelete(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		//得到cartItemIds参数
		String cartItemIds = req.getParameter("cartItemIds");
		//将之转化为集合
		String[] strings = cartItemIds.split(",");
		List<String> list = new ArrayList<>();
		for (int i = 0; i < strings.length; i++) {
			list.add(strings[i]);
		}
		//调用service方法
		cartItemService.batchDelete(list);
		return myCart(req, resp);
	}
	
	//修改数量
	@RequestMapping(value="/updateQuantity",method=RequestMethod.POST)
	@ResponseBody
	public Xiugai updateQuantity(String cartItemId,int quantity,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		CartItem cartItem = cartItemService.updateQuantity(quantity, cartItemId);
		Xiugai xiugai = new Xiugai(quantity, cartItem.getSubtotal());
		return xiugai;
	}
	
	//批量加载
	@RequestMapping(value="/loadCartItems")
	public String loadCartItems(String cartItemIds,String total,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		double totals = Double.parseDouble(total);
		String[] strings = cartItemIds.split(",");
		List<String> list = new ArrayList<>();
		for (int i = 0; i < strings.length; i++) {
			list.add(strings[i]);
		}
		List<CartItem> cartItemList = cartItemService.loadCartItems(list);
		//保存转发
		req.setAttribute("cartItemList", cartItemList);
		req.setAttribute("total", total);
		req.setAttribute("cartItemIds", cartItemIds);
		return  "cart/showitem";
	}
		
}
