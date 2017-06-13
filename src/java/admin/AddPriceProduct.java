package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author baazaronline4
 */
@WebServlet(urlPatterns = {"/AddPriceProduct"})
public class AddPriceProduct extends HttpServlet {
  
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
          String ip = getServletContext().getInitParameter("ip");
          
          String status = request.getParameter("product_status");
          System.out.println("this is testing for "+status);
        String Product_id = request.getParameter("Product_id");
        String User_ID = request.getParameter("User_ID");
        String Stock= request.getParameter("Stock");
        String price = request.getParameter("price");
        String stock_qty = request.getParameter("Stock_qty");
        String group_Price = request.getParameter("group_Price");
        String special_price= request.getParameter("special_price");
        String Special_price_from = request.getParameter("Special_price_from");
        String Special_price_to = request.getParameter("Special_price_to");  
        String tier_price = request.getParameter("tier_price");
        String sku = request.getParameter("SKU");
          HttpSession session = request.getSession(true);
               String  user  =   (String) session.getAttribute("User_Object_ID"); 
               System.out.println("thsis is session user for testing  "+user);
        
        
         
                                   
               Mongo mg = new Mongo(ip,27017);
               DB db = mg.getDB("baazaronline");        
               DBCollection collection1 = db.getCollection("product_price");
               DBObject doc1 = new BasicDBObject("User_Object_ID",user);
               DBObject doc2 = new BasicDBObject("Product_id", Product_id);
               DBCursor cursor = collection1.find(doc1, doc2);
                   if (cursor.hasNext()) {
                       System.out.println("condion is true data can not be save");
                         
               out.println("<script>alert('already added');"+" location='Show_Products.jsp' ;</script>");  
                
        }else{
              
                       
               DBObject doc = new BasicDBObject();
               doc.put("Product_id",Product_id);
               doc.put("User_Object_ID",user );
               doc.put("Price",price);
               doc.put("Stock_qty",stock_qty);
               doc.put("group_Price",group_Price );
               doc.put("special_price",special_price );
               doc.put("Special_price_from_date",Special_price_from);
               doc.put("Special_price_to_date",Special_price_to);
               doc.put("tier_price",tier_price);
               doc.put("Stock" , Stock);
               doc.put("sku",sku);
                       if (status.equals("Unapproved")) {
                            out.println("<script>alert('wait for product approvel');"+" location='Show_Products.jsp' ;</script>");   
                       } else {
                       
               collection1.insert(doc);
               System.out.println("price id added succuss");
                       }
               out.println("<script>alert('Success');"+" location='Show_Products.jsp' ;</script>");  
                
    }
  }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
