package com.asd.mapper;

import java.util.List;

import com.asd.domain.Order;
import com.asd.domain.OrderItem;
import com.asd.domain.OrderItems;

public interface OrderMapper {
	//查询订单状态
	public int findStatus (String oid);
	//更改订单状态
	public void updateStatus(int status,String oid);
	//按照oid查询订单的
	public Order load(String oid);
	//为指定的order加载所有orderitem
	public List<OrderItems> loadOrderItem(String oid);
	//生成订单
	public void addOrder(String oid,String ordertime,double total,int status,String address,String uid);
	//生成子单
	public void addOrderitem(List<OrderItem> list);
//----------------------------------------------------------------
	//查询所有订单
	public List<Order> findAll();
	//按用户uid查询所有的订单
	public List<Order> findByUsers(String uid);
	//按状态查询所有订单
	public List<Order> findByStatuss(int status);
	//分页--按用户uid查询所有的订单
	public List<Order> findByUser(String uid,int min,int max);
	//分页--按状态查询所有订单
	public List<Order> findByStatus(int status,int min,int max);
	//分页--查询所有订单
	public List<Order> findAlls(int min,int max);
	
}
