package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;
import org.json.simple.JSONObject;

/**
 *
 * @author baazaronline4
 */
public class UpdateProduct extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
     //response.setContentType("text/plain");
         HttpSession session = request.getSession(true);
         PrintWriter out = response.getWriter();
              // String  User_Object_ID  =   (String) session.getAttribute("User_Object_ID"); 
        try  {
            String ip = getServletContext().getInitParameter("ip");
                    String l = request.getParameter("test");
                    Object s = JSON.parse(l);
               
               System.out.println("sssssssssssssssssssssssssssssssssssss"+s);
               DBObject obj = (DBObject) JSON.parse((String) s);
               String price=(String) obj.removeField("price");
               String stock_qty=(String) obj.removeField("Stock_qty");
               String group_Price =(String) obj.removeField("group_Price");
               String special_price =(String) obj.removeField("special_price");
               String Special_price_from =(String) obj.removeField("Special_price_from");
               String Special_price_to =(String) obj.removeField("Special_price_to");
               String tier_price =(String) obj.removeField("tier_price");
                String Stock =(String) obj.removeField("Stock");
               String sku =(String)  obj.removeField("SKU");
               String Aprrovecheck =(String)  obj.removeField("Aprrovecheck");
               String pid = (String) obj.removeField("pid");
               String cid = (String) obj.get("cid");
               String AttributeSet =(String) obj.removeField("AttributeSet");
                String User_Object_ID =(String) obj.get("User_Object_ID");
               obj.put("Type" , "Product");
//               if (User_Object_ID.equals("Admin")) {
//                obj.removeField("User_Object_ID");
//                }
//               else if(!User_Object_ID.equals("Admin")){
//        
//                  obj.put("User_Object_ID" , User_Object_ID);
//                   }
               
               if (Aprrovecheck.equals("yes")) {
                   System.out.println("%%%%%%%%%%%%%%%");
                obj.put("Product_Status","Approved");
               }
             
               Mongo mg = new Mongo(ip,27017);
               DB db =  mg.getDB("baazaronline");
               DBCollection productcollection = db.getCollection("products");
           
               BasicDBObject searchQuery = new BasicDBObject("_id", new ObjectId(pid));
               productcollection.update(searchQuery, obj);
               System.out.println("putting values in the obje object"+pid+" ddffdffd"+AttributeSet);
               
               obj.put("pid", pid);
               obj.put("AttributeSet", AttributeSet);
               obj.put("set", "set");
                       
               System.out.println("product insert suc");
          
//            ObjectId Product_id = (ObjectId)obj.get( "pid" );
 
               
               DBCollection collection1 = db.getCollection("product_prices");
               DBObject find = new BasicDBObject("Product_id",new ObjectId(pid));
               DBObject doc = new BasicDBObject();
               doc.put("Product_id", new ObjectId(pid));
               doc.put("User_Object_ID",User_Object_ID );
               doc.put("Price",price);
               doc.put("Stock" , Stock);
               doc.put("Stock_qty",stock_qty);
               doc.put("group_Price",group_Price );
               doc.put("Special_price",special_price );
               doc.put("Special_price_from_date",Special_price_from );
               doc.put("Special_price_to_date",Special_price_to);
               doc.put("tier_price",tier_price);
               doc.put("SKU",sku);
               collection1.update(find,doc);
               JSONObject json = new JSONObject();
               json.put("amit", "sucess");
               
               out.print(json);
               System.out.println(" this is my joson objec  "+json);
               mg.close();  
               
        }
        catch(Exception e){
            
            System.out.println("this  is main eerrr   "+e);
            
        }
    }

}