package com.bookstore.dao_impl;

import com.bookstore.dao.DonHangDao;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.DonHangEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class DonHangDao_impl extends GenericDao_impl<Integer, DonHangEntity> implements DonHangDao {
    @Autowired
    SessionFactory factory;
    @Override
    public List<DonHangEntity> Find_DHCG() {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        List<DonHangEntity> userEntities = new ArrayList<DonHangEntity>();
        String a = "Chưa giao";
        try {
            StringBuilder sql = new StringBuilder("From DonHangEntity ");
            sql.append(" where activeDH = :value");
            sql.append(" and ma_DH not in (select id.ma_DH from GiaoHangEntity) ");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value", a);
            userEntities = query.list();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return userEntities;
    }
	@Override
	public void CancelByCustomer_DonHang() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<DonHangEntity> FindByMaCustomer(Integer ma_Customer) {
		List<DonHangEntity> results =new ArrayList<DonHangEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("from DonHangEntity a where a.ma_Customer =:TuKhoa");
            Query query = session.createQuery(sql.toString());
            query.setParameter("TuKhoa", ma_Customer);
            results = query.list();


            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return results;
	}
	@Override
	public List<DonHangEntity> Search(String TuKhoa) {
		List<DonHangEntity> results =new ArrayList<DonHangEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("from DonHangEntity a where a.activeDH like :TuKhoa");
            Query query = session.createQuery(sql.toString());
            query.setParameter("TuKhoa", "%"+TuKhoa+"%");
            results = query.list();


            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return results;
	}
}
