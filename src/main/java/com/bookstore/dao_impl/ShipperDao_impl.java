package com.bookstore.dao_impl;

import com.bookstore.dao.ShipperDao;
import com.bookstore.entity.AdminsEntity;
import com.bookstore.entity.ShipperEntity;
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
public class ShipperDao_impl extends GenericDao_impl<Integer, ShipperEntity> implements ShipperDao{
    @Autowired
    SessionFactory factory;
    @Override
    public boolean checkShipperLogin(String username, String password) {

        boolean exist = false;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try{
            StringBuilder sql = new StringBuilder("select count(*) from ShipperEntity ");
            sql.append("where taikhoan_Shipper = :value1");
            sql.append(" and matkhau_Shipper = :value2");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", username);
            query.setParameter("value2", password);
            a = query.list().get(0);
            int c =  Integer.parseInt((a).toString());
            if(c == 1)
            {
                exist = true;
            }
            transaction.commit();
        }
        catch (HibernateException e)
        {
            transaction.rollback();
            throw e;
        }
        finally {
            session.close();
        }
        return exist;
    }

    @Override
    public List<ShipperEntity> findByUser(String user) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        List<ShipperEntity> userEntities = new ArrayList<ShipperEntity>();
        try {
            StringBuilder sql = new StringBuilder("From ShipperEntity ");
            sql.append(" where taikhoan_Shipper = :value");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value", user);
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
    public List<ShipperEntity> findID() {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        List<ShipperEntity> userEntities = new ArrayList<ShipperEntity>();
        try {
            StringBuilder sql = new StringBuilder("Select ma_Shipper From ShipperEntity ");
            Query query = session.createQuery(sql.toString());
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
	public List<ShipperEntity> Search(String TuKhoa) {
		List<ShipperEntity> results =new ArrayList<ShipperEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("from ShipperEntity a where a.taikhoan_Shipper like :TuKhoa or a.hoten_Shipper like :TuKhoa or a.gmail_Shipper like :TuKhoa");
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
