package com.asd.service;

import java.util.List;

import com.asd.domain.Book;
import com.asd.domain.BookPid;
import com.asd.pager.PageBean;

public interface BookService {
	//删除图书
	public void delete(String bid);
	//修改图书
	public void edit(Book book);
	//查询指定分类下的图书的个数
	public int  findBookCountByCategory(String cid);
	//增加图书
	public void add(Book book);
	//按book的bid进行查询
	public Book load(String bid);
	//--------------------快速查询使用的带分页------------------------------
	//按分类查询
	public PageBean<Book> findByCategory(String cid,int pc);
	//按书名进行查询
	public PageBean<Book> findByBname(String bname,int pc);
	//按作者查询
	public PageBean<Book> findByPlace(String place,int pc);
	//按出版社查询
	public PageBean<Book> findByPress(String press,int pc);
	//多调价查询
	public PageBean<Book> findByCombination(String bname,String place,String press,int pc);

}
