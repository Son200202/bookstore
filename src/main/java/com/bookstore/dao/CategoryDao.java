package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.CategoryEntity;

public interface CategoryDao extends GenericDao<Integer, CategoryEntity> {

	List<CategoryEntity> Search(String tuKhoa);

}
