package com.akash.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.akash.entities.User;
import com.akash.hibFact.factoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	try {
			
    		PrintWriter out = response.getWriter();
    		
    		String userName = request.getParameter("user_name");
    		String userEmail = request.getParameter("user_email");
    		String userPassword = request.getParameter("user_password");
    		String userPhone = request.getParameter("user_phone");
    		String userAddress = request.getParameter("user_address");
    		
    		if((userName.isEmpty())) {
    			out.println("User name is empty");
    			return;
    		}
    		
    		// Creating User obj to store data
    		
    		User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "NORMAL");
    		
    		Session sess = factoryProvider.getFactory().openSession();
    		Transaction tx = sess.beginTransaction();
    		
    		int userId = (Integer) sess.save(user);
    		
    		tx.commit();
    		sess.close();
    		
    		HttpSession httpsess =  request.getSession();
    		httpsess.setAttribute("messege", "Registered successfully");
    		
    		response.sendRedirect("register.jsp");
    		return;

    		
		} catch (Exception e) {

		}
    	
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
