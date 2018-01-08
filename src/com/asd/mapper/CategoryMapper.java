package com.asd.mapper;

import java.util.List;

import com.asd.domain.Category;

public interface CategoryMapper {
	
	//查询出所有的一级分类，一级分类没有pid
	public List<Category> findall();
	
	//根据一级分类查询出所有的子分类
	public List<Category> findByParent(String pid);
	
	//增加一级分类
	public void add(String cid,String cname,String pid,String desc);
	
	//得到所有一级分类
	public List<Category> findParents();
	
	//加载选中的一级分类中的数据
	public Category load(String cid);
	
	//修改分类
	public void edit(String cname,String pid,String desc,String cid);
	
	//查询指定父分类下子分类的个数
	public int findChildrenCountByParent(String pid);
	
	//删除分类
	public void delete (String cid);
}
