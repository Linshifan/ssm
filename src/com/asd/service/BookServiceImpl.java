package com.asd.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asd.domain.Book;
import com.asd.domain.BookPid;
import com.asd.domain.Category;
import com.asd.mapper.BookMapper;
import com.asd.pager.PageBean;
import com.asd.pager.PageConstants;

@Service("bookService")
public class BookServiceImpl implements BookService {
	
	@Resource(name="bookMapper")
	private BookMapper bookMapper;
	public BookMapper getBookMapper() {
		return bookMapper;
	}
	public void setBookMapper(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}
	//删除图书
	@Override
	public void delete(String bid) {
		bookMapper.delete(bid);
	}
	//修改图书
	@Override
	public void edit(Book book) {
		bookMapper.edit(book);
	}
	//按分类查询有多少本数
	@Override
	public int findBookCountByCategory(String cid) {
		return bookMapper.findBookCountByCategory(cid);
	}
	//加入新的图书
	@Override
	public void add(Book book) {
		bookMapper.add(book);
	}
	//
	@Override
	public Book load(String bid) {
		//这是接受的bookid类，其中包括book全部属性和pid，方便映射新建的
		BookPid all = bookMapper.findByBid(bid);
		//通过查询的数据得到了两个类的所有数据
		Book book = new Book(all.getBid(), all.getBname(), all.getPlace(), all.getPrice(), all.getCurrPrice(), all.getDiscount(), all.getPress(), all.getPublishtime(),all.getEdition(), 
				//all.getPageNum(), all.getWordNum(), all.getPrinttime(), all.getBooksize(), all.getPaper(), 
				all.getImage_w(), all.getImage_b());
		Category category =new Category(all.getCid(), all.getCname(), all.getDesc(), all.getPid(), all.getOrderBy());
		book.setCategory(category);//两者建立联系
		if(all.getPid()!=null){
			Category parent = new Category();
			parent.setCid(all.getPid());
			category.setParent(parent);
		}
		return book;
	}
	
//---------------------------------------------------------------------------	
	//模糊查询后得到的是集合
	//按分类模糊查询
	//每页分页数为PageConstants.BOOK_PAGE_SIZE;
	//按分类查询所有的数据
	@Override
	public PageBean<Book> findByCategory(String cid,int pc) {
		//先查询模糊查询得到的所有数据
		//得到ps
		int ps = PageConstants.BOOK_PAGE_SIZE;
		int min = (pc-1)*ps;
		int max = ps;
		//得到beanList
		List<Book> beanLsit = bookMapper.findByCategory(cid, min, max);
		//得到所有的记录数
		int tr = bookMapper.findByCategorys(cid).size();
		PageBean<Book> pb = new PageBean<>();
		pb.setBeanList(beanLsit);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}
	
	@Override
	public PageBean<Book> findByBname(String bname,int pc) {
		//先查询模糊查询得到的所有数据
		//得到ps
		int ps = PageConstants.BOOK_PAGE_SIZE;
		int min = (pc-1)*ps;
		int max = ps;
		//得到beanList
		List<Book> beanLsit = bookMapper.findByBname("%"+bname+"%", min, max);
		System.out.println(beanLsit.size());
		//得到所有的记录数
		int tr = bookMapper.findByBnames("%"+bname+"%").size();
		PageBean<Book> pb = new PageBean<>();
		pb.setBeanList(beanLsit);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}
	@Override
	public PageBean<Book> findByPlace(String place,int pc) {
		//先查询模糊查询得到的所有数据
		//得到ps
		int ps = PageConstants.BOOK_PAGE_SIZE;
		int min = (pc-1)*ps;
		int max = ps;
		//得到beanList
		List<Book> beanList = bookMapper.findByPlace("%"+place+"%", min, max);
		//得到所有的记录数
		int tr = bookMapper.findByPlaces("%"+place+"%").size();
		PageBean<Book> pb = new PageBean<>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}
	@Override
	public PageBean<Book> findByPress(String press,int pc) {
		//先查询模糊查询得到的所有数据
		//得到ps
		int ps = PageConstants.BOOK_PAGE_SIZE;
		int min = (pc-1)*ps;
	    int max = ps;
		//得到beanList
		List<Book> beanList = bookMapper.findByPress("%"+press+"%", min, max);
		//得到所有的记录数
		int tr = bookMapper.findByPresss("%"+press+"%").size();
		PageBean<Book> pb = new PageBean<>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}
	@Override
	public PageBean<Book> findByCombination(String bname, String place, String press,int pc) {
		//先查询模糊查询得到的所有数据
		//得到ps
		int ps = PageConstants.BOOK_PAGE_SIZE;
		int min = (pc-1)*ps;
	    int max = ps;
		//得到beanList
		List<Book> beanList = bookMapper.findByCombination("%"+bname+"%","%"+place+"%","%"+press+"%", min, max);
		//得到所有的记录数
		int tr = bookMapper.findByCombinations("%"+bname+"%","%"+place+"%","%"+press+"%").size();
		PageBean<Book> pb = new PageBean<>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}

//-----------------------以上使用来分页用的--------------------------------
	

}
