package com.asd.service;

import java.util.List;

import com.asd.domain.Category;

public interface CategoryService {
		
	//查询出所有的一级分类，一级分类没有pid
	public List<Category> findall();
		
	//根据一级分类查询出所有的子分类
	public List<Category> findByParent(String pid);
	
	//添加分类
	public void add(Category category);
	
	//获取所有父分类
	public List<Category> findParents();
	
	//加载方法
	public Category load(String cid);
	
	//修改分类
	public void edit(Category category);
	
	//查询指定父分类下子分类的个数
	public int findChildrenCountByParent(String pid);
	
	//删除分类
	public void delete(String cid);
	
	//查询指定父分类下的子分类
	public List<Category> findChildren(String pid);
}
