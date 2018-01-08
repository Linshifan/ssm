package com.asd.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asd.domain.Category;
import com.asd.service.CategoryService;

@Controller
@RequestMapping(value="/category")
public class CategoryController {
	
	@Resource(name="categoryService")
	private CategoryService categoryService;
	
	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	//main.jsp一加载就调用这个方法
	@RequestMapping(value="/findAll")
	public String findAll(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		//通过service得到所有分类
		try {
			List<Category> parent = categoryService.findall();
			req.setAttribute("parents", parent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "left";
	}

}
