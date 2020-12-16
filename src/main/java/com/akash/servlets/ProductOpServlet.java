package com.akash.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.akash.DAO.categoryDao;
import com.akash.DAO.productDao;
import com.akash.entities.Catagory;
import com.akash.entities.Product;
import com.akash.hibFact.factoryProvider;

@MultipartConfig
public class ProductOpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductOpServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		try {
			
			
			String operation = request.getParameter("operation");
			
			if(operation.trim().equals("addCategory")) {
				
				//fetching category data
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				
				Catagory category = new Catagory(title, description);
				
				//save category to database
				
				categoryDao catD = new categoryDao(factoryProvider.getFactory());
				
				int catId = catD.saveCategory(category);
				
				HttpSession hs = request.getSession();
				hs.setAttribute("messege", "Category Added Successfully with ID : "+catId);
				response.sendRedirect("admin.jsp");
				return;
				
			}else 
				if(operation.trim().equals("addProduct")){
					
					//fetching product data
					String Pname = request.getParameter("prodName");
					String Pdescription = request.getParameter("prodDescription");
					int Pprice = Integer.parseInt(request.getParameter("prodPrice"));
					int Pdisc = Integer.parseInt(request.getParameter("prodDisc"));
					int Pqnt = Integer.parseInt(request.getParameter("prodQuant"));
					int Pcid = Integer.parseInt(request.getParameter("catId"));
					Part part = request.getPart("prodPic");
					
					//get category by id
					categoryDao cDao = new categoryDao(factoryProvider.getFactory());
					Catagory cat = cDao.getCatById(Pcid);
					
					Product product = new Product();
					product.setProductName(Pname);
					product.setProductDesc(Pdescription);
					product.setProductPrice(Pprice);
					product.setProductDiscount(Pdisc);
					product.setProductQuantity(Pqnt);
					product.setProductPic(part.getSubmittedFileName());
					product.setCatagory(cat);
					
					//save product to database
					
					productDao pDao = new productDao(factoryProvider.getFactory());
					boolean b = pDao.saveProduct(product);
					
					//upload photo
					String path = request.getRealPath("IMAGES")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
					System.out.println(path);
					
					try {
						
					//photo upload code
					
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = part.getInputStream();
					
					//reading data
					byte[] data = new byte[is.available()];
					is.read(data);
					
					//writing data
					fos.write(data);
					fos.close();
					
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					HttpSession hs = request.getSession();
					hs.setAttribute("messege", "Product Added with status : "+b);
					response.sendRedirect("admin.jsp");
					return;
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
