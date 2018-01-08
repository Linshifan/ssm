package com.asd.mapper;

import java.util.List;

import com.asd.domain.Book;
import com.asd.domain.BookPid;

public interface BookMapper {
	//删除图书
	public void delete(String bid);
	//修改图书
	public void edit(Book book);
	//查询指定分类下的图书的个数
	public int  findBookCountByCategory(String cid);
	//增加图书
	public void add(Book book);
	//按book的bid进行查询
	public BookPid findByBid(String bid);
	//分页--按分类查询
	public List<Book> findByCategory(String cid,int min,int max);
	//分页--按书名进行查询
	public List<Book> findByBname(String bname,int min,int max);
	//分页--按作者查询
	public List<Book> findByPlace(String place,int min,int max);
	//分页--按出版社查询
	public List<Book> findByPress(String press,int min,int max);
	//分页--多条件查询
	public List<Book> findByCombination(String bname,String place,String press,int min,int max);
	//按分类查询
	public List<Book> findByCategorys(String cid);
	//按书名进行查询
	public List<Book> findByBnames(String bname);
	//按作者查询
	public List<Book> findByPlaces(String place);
	//按出版社查询
	public List<Book> findByPresss(String press);
	//多调价查询
	public List<Book> findByCombinations(String bname,String place,String press);
}
