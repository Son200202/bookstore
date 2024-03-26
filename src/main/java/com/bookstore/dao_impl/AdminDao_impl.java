package com.bookstore.dao_impl;

import com.bookstore.dao.AdminDao;
import com.bookstore.entity.AdminsEntity;
import com.bookstore.entity.CustomerEntity;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

@Repository
public class AdminDao_impl extends GenericDao_impl<Integer, AdminsEntity> implements AdminDao {
    @Autowired
    SessionFactory factory;

    public  boolean checkAdminLogin(String username, String password) {
        boolean exist = false;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try{
            StringBuilder sql = new StringBuilder("select count(*) from AdminsEntity ");
            sql.append("where taikhoan_Admin = :value1");
            sql.append(" and matkhau_Admin = :value2");
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

    public boolean checkDelete(String username, Integer id) {
        boolean exist = false;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try{
            StringBuilder sql = new StringBuilder("select count(*) from AdminsEntity ");
            sql.append("where taikhoan_Admin = :value1");
            sql.append(" and ma_Admin = :value2");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", username);
            query.setParameter("value2", id);
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
	public List<AdminsEntity> Search(String TuKhoa) {
		List<AdminsEntity> results =new ArrayList<AdminsEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("from AdminsEntity a where a.taikhoan_Admin like :TuKhoa or a.hoten_Admin like :TuKhoa or a.gmail_Admin like :TuKhoa");
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
