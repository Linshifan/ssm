package com.asd.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asd.domain.Book;
import com.asd.domain.Order;
import com.asd.domain.OrderItem;
import com.asd.domain.OrderItems;
import com.asd.mapper.OrderMapper;
import com.asd.pager.PageBean;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource(name="orderMapper")
	private OrderMapper orderMapper;
	
	public OrderMapper getOrderMapper() {
		return orderMapper;
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	//我的订单
	@Transactional(rollbackFor=Exception.class)
	@Override
	public PageBean<Order> myOrders(String uid, int pc) {
		try {
			//先查询模糊查询得到的所有数据
			//得到ps
			int ps = 8;         //确定“我的订单”中订单每页的条数
			int min = (pc-1)*ps;
			int max = ps;
			//得到beanList
			List<Order> beanLsit = orderMapper.findByUser(uid, min, max);
			//得到所有的记录数
			int tr = orderMapper.findByUsers(uid).size();
			PageBean<Order> pb = new PageBean<>();
			pb.setBeanList(beanLsit);
			pb.setPc(pc);
			pb.setPs(ps);
			pb.setTr(tr);
			return pb;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//添加订单
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void createOrder(Order order) {
		try {
			orderMapper.addOrder(order.getOid(), order.getOrdertime(), order.getTotal(), order.getStatus(), order.getAddress(), order.getOwner().getUid());
			orderMapper.addOrderitem(order.getOrderItemList());
		}  catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	//加载订单详情
	@Transactional(rollbackFor=Exception.class)
	@Override
	public Order load(String oid) {
		try {
			Order order =orderMapper.load(oid);
			List<OrderItems> list = orderMapper.loadOrderItem(oid);
			List<OrderItem> listitem = new ArrayList<>();
			for (OrderItems Item : list) {
				Book book = new Book();book.setBid(Item.getBid());book.setBname(Item.getBname());book.setCurrPrice(Item.getCurrPrice());book.setImage_b(Item.getImage_b());
				OrderItem orderItem = new OrderItem();orderItem.setOrderItemId(Item.getOrderItemId());orderItem.setQuantity(Item.getQuantity());orderItem.setSubtotal(Item.getSubtotal());orderItem.setBook(book);orderItem.setOrder(order);
				listitem.add(orderItem);
			}
			order.setOrderItemList(listitem);
			return order;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//查询订单状态
	@Override
	public int findStatus(String oid) {
		try{
			return orderMapper.findStatus(oid);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//更改订单状态
	@Override
	public void updateStatus(int status, String oid) {
		try {
			orderMapper.updateStatus(status, oid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询所有订单
	@Transactional(rollbackFor=Exception.class)
	@Override
	public PageBean<Order> findAll(int pc) {
		try {
			//先查询模糊查询得到的所有数据
			//得到ps
			int ps = 2;
			int min = (pc-1)*ps;
			int max = ps;
			//得到beanList
			List<Order> beanLsit = orderMapper.findAlls(min, max);
			//得到所有的记录数
			int tr = orderMapper.findAll().size();
			PageBean<Order> pb = new PageBean<>();
			pb.setBeanList(beanLsit);
			pb.setPc(pc);
			pb.setPs(ps);
			pb.setTr(tr);
			return pb;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//按状态查询
	@Transactional(rollbackFor=Exception.class)
	@Override
	public PageBean<Order> findByStatus(int status, int pc) {
		try {
			//先查询模糊查询得到的所有数据
			//得到ps
			int ps = 2;
			int min = (pc-1)*ps;
			int max = ps;
			//得到beanList
			List<Order> beanLsit = orderMapper.findByStatus(status, min, max);
			//得到所有的记录数
			int tr = orderMapper.findByStatuss(status).size();
			PageBean<Order> pb = new PageBean<>();
			pb.setBeanList(beanLsit);
			pb.setPc(pc);
			pb.setPs(ps);
			pb.setTr(tr);
			return pb;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}



}
