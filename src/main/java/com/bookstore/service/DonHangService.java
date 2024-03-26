package com.bookstore.service;

import com.bookstore.entity.DonHangEntity;

import java.util.List;

public interface DonHangService {
    DonHangEntity save(DonHangEntity T);
    List<DonHangEntity> findAll();
    Integer deleteList(List<Integer> ids);
    DonHangEntity findById(int var1);
    DonHangEntity update(DonHangEntity donHangEntity);
    List<DonHangEntity> Find_DHCG();
	void CancelByCustomer_DonHang(Integer ma_Customer, Integer ma_DonHang);
	List<DonHangEntity> FindByMaCustomer(Integer ma_Customer);
	List<DonHangEntity> Search(String tuKhoa);
}
