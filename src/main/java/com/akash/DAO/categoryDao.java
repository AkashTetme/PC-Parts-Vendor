package com.akash.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.akash.entities.Catagory;

public class categoryDao {

	private SessionFactory factory;

	public categoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// get user by email and password;
	
	public int saveCategory(Catagory cat) {
		int catId = 0;
		
		try {
			
			Session s = this.factory.openSession();
			Transaction tx = s.beginTransaction();
			
			catId = (Integer) s.save(cat);
			
			tx.commit();
			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return catId;
	}
	
	public List<Catagory> getCategories(){
		List<Catagory> Clist = null;
		
		try {
			
			Session s = this.factory.openSession();
			String query = "from Catagory";
			Query<?> q = s.createQuery(query);
			
			Clist = (List<Catagory>) q.list(); 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Clist;
	}
	
	public Catagory getCatById(int cid) {
		Catagory cat = null;
		
		try {
			
			Session s = this.factory.openSession();
			cat = s.get(Catagory.class, cid);
			
			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
		
	}
	
}
