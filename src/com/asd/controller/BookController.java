package com.asd.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asd.domain.Book;
import com.asd.pager.PageBean;
import com.asd.service.BookService;


@Controller
@RequestMapping(value="/book")
public class BookController {
	
	@Resource(name="bookService")
	private BookService bookService;

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	
	//获取当前页的页码
	private int getPc(HttpServletRequest req){
		int pc =1 ;
		String param = req.getParameter("pc");
		if(param!=null&&!param.trim().isEmpty()){
			try {
				pc = Integer.parseInt(param);
			} catch (RuntimeException e) {
				
			}
		}
		return pc;
	}
	//截取url，页面中的分页导航中要使用它作为超链接的目标
	private String getUrl(HttpServletRequest req){
		String url = req.getRequestURL()+"?"+req.getQueryString();//ShopBook/BookServlet
		//如果url中存在pc参数
		int index = url.lastIndexOf("&pc=");
		if(index!=-1){
			url = url.substring(0, index);
		}
		return url;
	}
	
	@RequestMapping(value="/findByCategory")
	public String findByCategory(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		//的奥pc
		int pc = getPc(req);
		//得到url
		String url = getUrl(req);
		//获取查询条件，本条件是cid
		String cid = req.getParameter("cid");
		//使用pc和cid调用findByCategory得到pagebean
		PageBean<Book> pb = bookService.findByCategory(cid, pc);
		//给pb设置url
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "book/list";
	}
	
	@RequestMapping(value="/load")
	public String load(String bid,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		Book book = bookService.load(bid);//通过bid得到book
		req.setAttribute("book", book);
		return "book/desc";
	}
	//根据作者查询
	@RequestMapping(value="/findByPlace")
	public String findByPlace(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		int pc = getPc(req);
		String url = getUrl(req);
		String place = req.getParameter("place");
		place = new String(place.getBytes("ISO-8859-1"),"UTF-8");
		PageBean<Book> pb = bookService.findByPlace(place, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "book/list";
	}
	//根据出版社查询
	@RequestMapping(value="/findByPress")
	public String findByPress(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		int pc = getPc(req);
		String url = getUrl(req);
		String press = req.getParameter("press");
		press = new String(press.getBytes("ISO-8859-1"),"UTF-8");
		PageBean<Book> pb = bookService.findByPress(press, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "book/list";
	}
	//根据书名
	@RequestMapping(value="/findByBname")
	public String findByBname(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		int pc = getPc(req);
		String url = getUrl(req);
		String bname = req.getParameter("bname");
		bname = new String(bname.getBytes("ISO-8859-1"),"UTF-8");
		PageBean<Book> pb = bookService.findByBname(bname, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "book/list";
	}
	
	@RequestMapping(value="/findByCombination")
	public String findByCombination(String bname,String place,String press,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		int pc = getPc(req);
		String url = getUrl(req);
		bname = new String(bname.getBytes("ISO-8859-1"),"UTF-8");
		place = new String(place.getBytes("ISO-8859-1"),"UTF-8");
		press = new String(press.getBytes("ISO-8859-1"),"UTF-8");
		PageBean<Book> pb = bookService.findByCombination(bname, place, press, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "book/list";
	}
	
	//特殊查询
	@RequestMapping(value="/findByBnames")
	public String findByBnames(String bname,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		int pc = getPc(req);
		bname = new String(bname.getBytes("ISO-8859-1"),"UTF-8");
		PageBean<Book> pb = bookService.findByBname(bname, pc);
		String url = "http://localhost:8080/JustDoit/book/findByBnames?bname="+bname;
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "book/list";
	}
}
