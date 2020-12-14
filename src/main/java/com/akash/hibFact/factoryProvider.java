package com.akash.hibFact;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

// Singleton

public class factoryProvider {

	private static SessionFactory factory;
	
	public static SessionFactory getFactory(){
		
		try {
			
			if(factory == null) {
				factory = new Configuration().configure().buildSessionFactory();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return factory;
	}
}
