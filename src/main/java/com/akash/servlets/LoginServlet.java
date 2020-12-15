package com.akash.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.akash.DAO.userDao;
import com.akash.entities.User;
import com.akash.hibFact.factoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public LoginServlet() {
	        super();
	    }

	    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    	try {
				
	    		PrintWriter out = response.getWriter();
	    		
	    		String userEmail = request.getParameter("email");
	    		String userPassword = request.getParameter("password");
	    		
	    		//Authenticate
	    		
	    		userDao userD = new userDao(factoryProvider.getFactory());
	    		
	    		User user =  userD.getUserByEmailAndPass(userEmail, userPassword);
	    		
	    		HttpSession sess = request.getSession();

	    		if((userEmail.isEmpty())) {
	    			sess.setAttribute("messege", "Please Enter Email");
	    			response.sendRedirect("login.jsp");
	    			
	    			if(user == null) {
		    			
			    		sess.setAttribute("messege", "Invalid Details, try again");
			    		response.sendRedirect("login.jsp");
			    		return;
			    		
		    		}
	    			
	    			return;
	    			
	    		}else {
	    			out.println("<h1> Welcome "+ user.getUserName() +"</h1>");
	    			
	    			//login
	    			sess.setAttribute("current-user", user);
	    			
	    			if(user.getUserType().equals("admin")) {
	    				//admin.jsp
	    				response.sendRedirect("admin.jsp");
	    			}else if (user.getUserType().equals("NORMAL")) {
	    				//normal.jsp
	    				response.sendRedirect("normal.jsp");
					}else {
						out.print("Un-Identified User");
					}
	    			
	    		}
	    		
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
