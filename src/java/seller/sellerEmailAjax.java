package seller;

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

/**
 *
 * @author baazarteam3
 */
@WebServlet(urlPatterns = {"/sellerEmailAjax"})
public class sellerEmailAjax extends HttpServlet {
 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          
        try (PrintWriter out = response.getWriter()) {
          String  email=request.getParameter("val");
         System.out.print(email);
           
           
    try{  
    Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection(Seller_Login.seller);
                      BasicDBObject doc = new BasicDBObject();
     DBCursor cursor=collection.find(doc);
     
    while(cursor.hasNext()){
    DBObject str=cursor.next();
     if(str.get("Email").equals(email) || str.get("Number").equals(email))
     {
         out.print("Email already exists");
     }
     else
     {
            out.print("");
    }
      mg.close();
    }}
    catch(Exception e){e.printStackTrace();}  
    }}  
        }
    

