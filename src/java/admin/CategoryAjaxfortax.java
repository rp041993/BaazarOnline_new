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
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

/**
 *
 * @author baazarteam3
 */
@WebServlet(urlPatterns = {"/CategoryAjaxfortax"})
public class CategoryAjaxfortax extends HttpServlet {
 

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
         String id=request.getParameter("val");
         String ip = getServletContext().getInitParameter("ip"); 
    
    try{  
        
     Mongo mg = new Mongo(ip,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection("vat_tax");
                      BasicDBObject doc = new BasicDBObject("category_id",id);
                      
                   
     
     DBCursor cursor=collection.find(doc);
     
    while(cursor.hasNext()){
    DBObject str=cursor.next();
    
    out.print(str);
    
    }
      mg.close();
   
    }catch(Exception e){e.printStackTrace();}  
    }}  
        }
    

