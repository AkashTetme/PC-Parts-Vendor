package com.akash.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
}
