package com.bookstore.dao;

import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.DonHangEntity;

import java.util.List;


public interface DonHangDao extends GenericDao<Integer, DonHangEntity> {
    List<DonHangEntity> Find_DHCG();

	void CancelByCustomer_DonHang();

	List<DonHangEntity> FindByMaCustomer(Integer ma_Customer);
	
	List<DonHangEntity> Search(String TuKhoa);
}

