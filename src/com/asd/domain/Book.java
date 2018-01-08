package com.asd.domain;

public class Book {
	private String bid;//主键
	private String bname;//图名
	private String place;//作者
	private double price;//定价
	private double currPrice;//当前价
	private double discount;//折扣
	private String press;//出版社
	private String publishtime;//出版时间
	private String edition;//版次
//	private int pageNum;//页数
//	private int wordNum;//字数
//	private String printtime;//刷新时间
//	private int booksize;//开本
//	private String paper;//纸质
	private Category category;//所属分类
	private String image_w;//大图路径
	private String image_b;//小图路径
	public Book(String bid, String bname, String place, double price, double currPrice, double discount, String press,
			String publishtime, String edition, 
			//int pageNum, int wordNum, String printtime, int booksize, String paper,
			String image_w, String image_b) {
		this.bid = bid;
		this.bname = bname;
		this.place = place;
		this.price = price;
		this.currPrice = currPrice;
		this.discount = discount;
		this.press = press;
		this.publishtime = publishtime;
		this.edition = edition;
//		this.pageNum = pageNum;
//		this.wordNum = wordNum;
//		this.printtime = printtime;
//		this.booksize = booksize;
//		this.paper = paper;
		this.image_w = image_w;
		this.image_b = image_b;
	}
	
	public Book() {
		super();
	}

	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getCurrPrice() {
		return currPrice;
	}
	public void setCurrPrice(double currPrice) {
		this.currPrice = currPrice;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
//	public int getPageNum() {
//		return pageNum;
//	}
//	public void setPageNum(int pageNum) {
//		this.pageNum = pageNum;
//	}
//	public int getWordNum() {
//		return wordNum;
//	}
//	public void setWordNum(int wordNum) {
//		this.wordNum = wordNum;
//	}
//	public String getPrinttime() {
//		return printtime;
//	}
//	public void setPrinttime(String printtime) {
//		this.printtime = printtime;
//	}
//	public int getBooksize() {
//		return booksize;
//	}
//	public void setBooksize(int booksize) {
//		this.booksize = booksize;
//	}
//	public String getPaper() {
//		return paper;
//	}
//	public void setPaper(String paper) {
//		this.paper = paper;
//	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getImage_w() {
		return image_w;
	}
	public void setImage_w(String image_w) {
		this.image_w = image_w;
	}
	public String getImage_b() {
		return image_b;
	}
	public void setImage_b(String image_b) {
		this.image_b = image_b;
	}
}
