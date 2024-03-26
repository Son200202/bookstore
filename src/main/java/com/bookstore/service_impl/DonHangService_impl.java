package com.bookstore.service_impl;

import com.bookstore.dao.DonHangDao;
import com.bookstore.dao_impl.DonHangDao_impl;
import com.bookstore.entity.DonHangEntity;
import com.bookstore.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class DonHangService_impl implements DonHangService {
    @Autowired
    DonHangDao donHangDao = new DonHangDao_impl();
    @Override
    public DonHangEntity findById(int var1) {
        return donHangDao.findById(var1);
    }

    @Override
    public DonHangEntity update(DonHangEntity donHangEntity) {
        return donHangDao.update(donHangEntity);
    }

    @Override
    public List<DonHangEntity> Find_DHCG() {
        return donHangDao.Find_DHCG();
    }

    @Override
    public DonHangEntity save(DonHangEntity T) {
        return donHangDao.save(T);
    }

    public List<DonHangEntity> findAll(){
        return donHangDao.findAll();
    }
    public Integer deleteList(List<Integer> ids){
        return donHangDao.deleteList(ids);
    }

	@Override
	public void CancelByCustomer_DonHang(Integer ma_Customer, Integer ma_DonHang) {
		// TODO Auto-generated method stub
		donHangDao.CancelByCustomer_DonHang();
	}

	@Override
	public List<DonHangEntity> FindByMaCustomer(Integer ma_Customer) {
		// TODO Auto-generated method stub
		return donHangDao.FindByMaCustomer(ma_Customer);
	}

	@Override
	public List<DonHangEntity> Search(String tuKhoa) {
		// TODO Auto-generated method stub
		return  donHangDao.Search(tuKhoa);
	}
}
