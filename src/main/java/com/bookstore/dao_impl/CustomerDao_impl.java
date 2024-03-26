package com.bookstore.dao_impl;

import com.bookstore.dao.CustomerDao;
import com.bookstore.entity.CustomerEntity;
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
public class CustomerDao_impl extends GenericDao_impl<Integer, CustomerEntity> implements CustomerDao {
    @Autowired
    SessionFactory factory;

    public boolean checkCustomerLogin(String username, String password) {
        boolean exist = false;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity ");
            sql.append("where taikhoan_Customer = :value1");
            sql.append(" and matkhau_Customer = :value2");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", username);
            query.setParameter("value2", password);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            if (c == 1) {
                exist = true;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return exist;
    }

    @Override

    public List<CustomerEntity> findByUser(String user) {
        List<CustomerEntity> results = new ArrayList<CustomerEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("FROM CustomerEntity P WHERE P.taikhoan_Customer = :user");
            Query query = session.createQuery(sql.toString());
            query.setParameter("user", user);
            results = query.getResultList();


            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return results;
    }

    public boolean checkAddCustomer(String username, String gmail, String sdt) {
        boolean exist = true;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity");
            sql.append(" where taikhoan_Customer =:value1");
            sql.append(" or sdt_Customer =:value2");
            sql.append(" or gmail_Customer =:value3");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", username);
            query.setParameter("value2", sdt);
            query.setParameter("value3", gmail);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            if (c > 0) {
                exist = false;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return exist;
    }

    @Override
    public boolean checkUserName(String username) {
        boolean exist = true;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity");
            sql.append(" where taikhoan_Customer =:value1");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", username);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            if (c == 1) {
                exist = false;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;

        } finally {
            session.close();
        }
        return exist;
    }

    @Override
    public boolean checkGmail(String gmail) {
        boolean exist = true;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity");
            sql.append(" where gmail_Customer =:value1");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", gmail);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            if (c == 1) {
                exist = false;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return exist;
    }

    @Override
    public boolean checkSdt(String sdt) {
        boolean exist = true;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity");
            sql.append(" where sdt_Customer =:value1");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", sdt);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            if (c == 1) {
                exist = false;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return exist;
    }

    @Override
    public boolean checkActiveAccount(String key1, String key2) {
        boolean exist = false;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity");
            sql.append(" where gmail_Customer =:value1");
            sql.append(" and sdt_Customer =:value2");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", key1);
            query.setParameter("value2",key2);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            if (c == 1) {
                exist = false;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return exist;
    }

	@Override
	public boolean checkEditCustomer(String username, String gmail, String sdt, int ma_tk) {
		boolean exist = true;
        Object a = new Object();
        Session session = factory.openSession();
        Transaction transaction = null;
        transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder("select count(*) from CustomerEntity");
            sql.append(" where ma_Customer <>:value4 and (");
            sql.append("sdt_Customer =:value2");
            sql.append(" or gmail_Customer =:value3");
            sql.append(" or taikhoan_Customer =:value1)");
            Query query = session.createQuery(sql.toString());
            query.setParameter("value1", username);
            query.setParameter("value2", sdt);
            query.setParameter("value3", gmail);
            query.setParameter("value4", ma_tk);
            a = query.list().get(0);
            int c = Integer.parseInt((a).toString());
            System.out.print(c);
            if (c > 0) {
                exist = false;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return exist;
	}

	@Override
	public List<CustomerEntity> findByEmail(String gmail) {
		List<CustomerEntity> results = new ArrayList<CustomerEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("FROM CustomerEntity P WHERE P.gmail_Customer = :gmail");
            Query query = session.createQuery(sql.toString());
            query.setParameter("gmail", gmail);
            results = query.getResultList();


            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return results;
	}

	@Override
	public List<CustomerEntity> Search(String TuKhoa) {
		List<CustomerEntity> results =new ArrayList<CustomerEntity>();
        Transaction transaction = null;
        Session session = factory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();

            // get an cuonSachEntity object
            StringBuilder sql = new StringBuilder("from CustomerEntity a where a.sdt_Customer like :TuKhoa or a.taikhoan_Customer like :TuKhoa or a.hoten_Customer like :TuKhoa or a.gmail_Customer like :TuKhoa");
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
