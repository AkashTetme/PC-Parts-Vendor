package com.akash.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.akash.entities.Product;

public class productDao {
	private SessionFactory factory;

	public productDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveProduct(Product prod) {
		boolean saved = false;
		
		try {
			
			Session s = this.factory.openSession();
			Transaction tx = s.beginTransaction();
			
			s.save(prod);
			
			tx.commit();
			s.close();
			saved = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			saved = false;
		}
		return saved;
	}
	
	public List<Product> getAllProducts(){
		List<Product> list = null;
		
		try {
			
			Session s = this.factory.openSession();
			Query q = s.createQuery("from Product");
			list = q.list();

			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Product> getAllProductsById(int cid){
		List<Product> list = null;
		
		try {
			
			Session s = this.factory.openSession();
			Query q = s.createQuery("from Product as p where p.catagory.categoryId =: id");
			q.setParameter("id", cid);
			list = q.list();

			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
