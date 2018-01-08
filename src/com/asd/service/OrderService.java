package com.asd.service;

import com.asd.domain.Order;
import com.asd.pager.PageBean;

public interface OrderService {
	
	//我的订单
	public PageBean<Order> myOrders(String uid,int pc);
	//生成订单
	public void createOrder(Order order);
	//加载订单
	public Order load(String oid);
	//查询订单状态
	public int findStatus(String oid);
	//更改订单状态
	public void updateStatus(int status,String oid);
	//查询所有
	public PageBean<Order> findAll(int pc);
	//按状态查询
	public PageBean<Order> findByStatus(int status,int pc);

	
	
}
