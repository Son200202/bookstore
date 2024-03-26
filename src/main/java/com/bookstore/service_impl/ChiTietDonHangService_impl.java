package com.bookstore.service_impl;

import com.bookstore.dao.ChiTietDonHangDao;
import com.bookstore.dao_impl.ChiTietDonHangDao_impl;
import com.bookstore.entity.ChiTietDonHangEntity;
import com.bookstore.service.ChiTietDonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ChiTietDonHangService_impl implements ChiTietDonHangService {
    @Autowired
    public ChiTietDonHangDao chiTietDonHangDao_impl = new ChiTietDonHangDao_impl();

    @Override
    public List<Object[]> FindHot() {
        return chiTietDonHangDao_impl.FindHot();
    }

    @Override
    public List<ChiTietDonHangEntity> findAll() {
        return chiTietDonHangDao_impl.findAll();
    }

    @Override
    public Integer deleteList(List<Integer> ids) {
        return chiTietDonHangDao_impl.deleteList(ids);
    }

    @Override
    public ChiTietDonHangEntity save(ChiTietDonHangEntity T) {
        return chiTietDonHangDao_impl.save(T);
    }

    @Override
    public ChiTietDonHangEntity update(ChiTietDonHangEntity T) {
        return chiTietDonHangDao_impl.update(T);
    }

    @Override
    public ChiTietDonHangEntity findById(int var1) {
        return chiTietDonHangDao_impl.findById(var1);
    }

    @Override

    public List<ChiTietDonHangEntity> findSpec() {
        return chiTietDonHangDao_impl.FindSpecify();
    }

    @Override
    public List<ChiTietDonHangEntity> FindDetails(Integer id) {
        return chiTietDonHangDao_impl.FindDetails(id);
    }

    public List<Object[]> ReportDoanhThu_DauSach() {
        return chiTietDonHangDao_impl.ReportDoanhThu_DauSach();

    }

	@Override
	public List<ChiTietDonHangEntity> findByMa_DH(Integer ma_DonHang) {
		return chiTietDonHangDao_impl.FindByMa_DH(ma_DonHang);
	}
}
