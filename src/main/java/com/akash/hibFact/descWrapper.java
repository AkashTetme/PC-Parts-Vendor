package com.akash.hibFact;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class descWrapper {

	
	public static String descWrapp(String desc) {
		
		String[] strs = desc.split(" ");
		
		if(strs.length>10) {
			
			String res = " ";
			
			for(int i=0; i<10;i++) {
				res = res+strs[i]+" ";
			}
			
			return (res+"...");
			
		}else {
			return (desc+"...");
		}
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		
		Session sess = factory.openSession();
		
		String q1 = "Select count(*) from User";
		String q2 = "Select count(*) from Product";
		
		Query querry1 = sess.createQuery(q1);
		Query querry2 = sess.createQuery(q2);
		
		Long userCount = (Long) querry1.list().get(0);
		Long productCount = (Long) querry2.list().get(0);
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		
		sess.close();
		
		return map;
	}
}
