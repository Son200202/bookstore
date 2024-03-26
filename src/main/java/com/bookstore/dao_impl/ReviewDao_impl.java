package com.bookstore.dao_impl;

import com.bookstore.dao.ReviewDao;
import com.bookstore.entity.CategoryEntity;
import com.bookstore.entity.ReviewEntity;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao_impl extends GenericDao_impl<Integer, ReviewEntity> implements ReviewDao {
	@Autowired
    SessionFactory factory;
	@Override
	public List<ReviewEntity> Search(String TuKhoa) {
		List<ReviewEntity> results =new ArrayList<ReviewEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("from ReviewEntity a where a.binhluan like :TuKhoa");
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
