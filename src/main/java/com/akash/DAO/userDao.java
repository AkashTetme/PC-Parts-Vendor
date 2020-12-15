package com.akash.DAO;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.akash.entities.User;

public class userDao {
	
	private SessionFactory factory;

	public userDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// get user by email and password;
	
	public User getUserByEmailAndPass(String email, String password) {
		User user = null;
		
		try {
			
			String query = "from User where userEmail =: e and userPassword =: p";
			Session s = this.factory.openSession();
			Query<?> q = s.createQuery(query);
			
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user = (User) q.uniqueResult();
			
			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
