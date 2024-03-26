package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.AdminsEntity;

public interface AdminDao extends GenericDao<Integer, AdminsEntity>{
    boolean checkAdminLogin(String username, String password);
    boolean checkDelete(String username, Integer id);
	List<AdminsEntity> Search(String tuKhoa);
}
