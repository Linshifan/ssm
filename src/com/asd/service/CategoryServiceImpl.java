package com.asd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asd.domain.Category;
import com.asd.mapper.CategoryMapper;
import com.asd.mapper.UserMapper;
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{

	@Resource(name="categoryMapper")
	private CategoryMapper categoryMapper;
	
	public CategoryMapper getCategoryMapper() {
		return categoryMapper;
	}

	public void setCategoryMapper(CategoryMapper categoryMapper) {
		this.categoryMapper = categoryMapper;
	}
	//查找所有一级分类,并为其加上所有的子分类
	@Override
	public List<Category> findall() {
		 List<Category> list = categoryMapper.findall();//得到一级分类的集合
		 for (Category category : list) {
			List<Category> children = findByParent(category.getCid());//得到这个父分类的所有子分类
			for (Category child : children) {
				addParent(child);//给每个子分类加上个父分类parent
			}
			category.setChildren(children);
		}
		 return list;
	}
	//根据父分类查找子分类
	@Override
	public List<Category> findByParent(String pid) {
		return categoryMapper.findByParent(pid);
	}
	
	//子分类的pid是一样的，而父分类是没有pid的,父分类是没有父分类的
	private Category addParent(Category category){
		String pid = category.getPid();//如果有pid，那么就是子分类
		if(pid!=null){
			//是父分类
			Category parent = new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}
//------------------------后台管理的--------------------------------------	

	@Override
	public void add(Category category) {
		// 添加分类包括一级二级分类
		String pid = null;
		if(category.getParent() != null){
			//是二级分类
			pid = category.getParent().getCid();
		}
		categoryMapper.add(category.getCid(), category.getCname(), pid, category.getDesc());
		
	}

	@Override
	public List<Category> findParents() {
		// 查找所有的一级分类
		return categoryMapper.findParents();
	}

	@Override
	public Category load(String cid) {
		// 查询选中的一级分类
		return categoryMapper.load(cid);
	}

	@Override
	public void edit(Category category) {
		// 修改分类一级二级分类
		String pid = null;
		if(category.getParent() !=null){
			pid = category.getParent().getCid();
		}
		categoryMapper.edit(category.getCname(), pid, category.getDesc(), category.getCid());
		
	}

	@Override
	public int findChildrenCountByParent(String pid) {
		// 查询指定父分类中子分类的个数
		return categoryMapper.findChildrenCountByParent(pid);
	}

	@Override
	public void delete(String cid) {
		// 删除分类
		categoryMapper.delete(cid);
		
	}

	@Override
	public List<Category> findChildren(String pid) {
		// 查询指定父分类下的子分类
		return categoryMapper.findByParent(pid);
	}
	

}
