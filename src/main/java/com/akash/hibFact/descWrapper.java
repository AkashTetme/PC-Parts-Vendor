package com.akash.hibFact;

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
}
