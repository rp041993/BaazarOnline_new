/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package seller;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baazarteam2
 */
@WebServlet(name = "Seller_commission_AJAX", urlPatterns = {"/Seller_commission_AJAX"})
public class Seller_commission_AJAX extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
                    String  cid=request.getParameter("val");
              System.out.println("cid"+cid);
            try{  
            Mongo mg = new Mongo(Seller_Login.Database,27017);
                              DB db = mg.getDB("baazaronline");
                             DBCollection collection = db.getCollection("baazarCommision");
               DBCursor cursor = collection.find();
               while (cursor.hasNext()) {
                  DBObject str=cursor.next();
                   if(str.get("cid").equals(cid))    
                   {
                       out.print(str);
                   }
              mg.close();
            }}
            catch(Exception e){e.printStackTrace();} 
        }
    }

}
