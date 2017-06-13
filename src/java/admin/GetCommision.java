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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author baazaronline4
 */
public class GetCommision extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    response.setContentType("application/json");
    PrintWriter out  = response.getWriter();
    
           String ip = getServletContext().getInitParameter("ip");   
               String cid = request.getParameter("cid");
               System.out.println("this is checking that  i am getting cid or not"+cid);
               Mongo mg = new Mongo(ip,27017);
               DB db = mg.getDB("baazaronline");
               DBCollection collection = db.getCollection("baazarCommision");
               DBObject doc = new BasicDBObject("cid", cid);
               DBCursor cursor = collection.find(doc);
               while (cursor.hasNext()) {
                   DBObject data = cursor.next();
                   int  Commission = (int) data.get("Commission");
                   int Shippment = (int) data.get("Shippment");
                   int Packaging_Cost = (int) data.get("Packaging_Cost");
                   int Labour_salary = (int) data.get("Labour_salary");
                   int Services_Tax = (int) data.get("Services_Tax");
             
                   
                     JSONObject jsonObject =  new JSONObject();
                     jsonObject.put("Commission", Commission);
                     jsonObject.put("Shippment", Shippment);
                     jsonObject.put("Packaging_Cost", Packaging_Cost);
                     jsonObject.put("Labour_salary", Labour_salary);
                     jsonObject.put("Services_Tax", Services_Tax);
                     
                     out.print(jsonObject);
                     System.out.println("sdfjdafklsjfjsaflaskls"+jsonObject);
                     
               
               }
               

 
    }
}