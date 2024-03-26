package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.ReviewEntity;

public interface ReviewDao extends GenericDao<Integer, ReviewEntity> {

	List<ReviewEntity> Search(String tuKhoa);
}
