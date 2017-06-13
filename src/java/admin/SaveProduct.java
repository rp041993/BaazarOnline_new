package admin;


import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;
import org.json.simple.JSONObject;

@WebServlet(urlPatterns = {"/SaveProduct"})
public class SaveProduct extends HttpServlet {
/**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
public static String c_p_id;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("application/json");
        String ip = getServletContext().getInitParameter("ip");
        HttpSession session = request.getSession(true);
          PrintWriter  out = response.getWriter();
            JSONObject jsono = new  JSONObject();
            
            
            
            
           
            
         
       
               String  user  =   (String) session.getAttribute("User_Object_ID"); 
        try  {
               String l = request.getParameter("test");
              Object s = JSON.parse(l);
               
                    
              System.out.println("1111111111111111111111"+s);
            
                 
             
              // System.out.println("safasfsfsfsfsffs"+s);
              // String s = "{'Product_Name':'mobile','cid':'592c0bff7c63190bfdbecdd8','AttributeSet':'fation','Description':'mobile','Short_Discription':'mobile','Meta_key':'mobile','Status':'Enable','Price':'12',Special_price':'12','Special_price_from_date':'05/06/2017','Special_price_to_date':'05/06/2017','SKU':'12','Stock_qty':'2','Product_weight':'121','Product_lenght':'2','Product_width':'12','Product_height':'12','Product_shipment_weight':'121','Stock':'In_stock','color':'red','name':'name'";
               DBObject obj = (DBObject) JSON.parse((String) s);
               System.out.println("222222222222222222"+obj);
               if (user.equals("Admin")) {
                obj.put("Product_Status", "Approved");
            } else {
                   obj.put("Product_Status", "Unapproved");
            }
               obj.put("Product_Status", "Unapproved");
               obj.put("Type", "Product");
               obj.put("User_Object_ID",user );
               System.out.println("333333333333333"+obj.get("Product_Name"));
               String price=(String) obj.removeField("Price");
               String stock_qty=(String) obj.removeField("Stock_qty");
               String group_Price =(String) obj.removeField("group_Price");
               String Stock =(String) obj.removeField("Stock");
               String special_price =(String) obj.removeField("Special_price");
               String Special_price_from =(String) obj.removeField("Special_price_from_date");
               String Special_price_to =(String) obj.removeField("Special_price_to_date");
               String tier_price =(String) obj.removeField("tier_price");
               String sku =(String) obj.removeField("SKU");
               String AttributeSet =(String) obj.removeField("AttributeSet");
               String Product_Name = (String)obj.get("Product_Name");
            
                String URL=Product_Name.replaceAll("\\s+","_"); 
                obj.put("Product_url", URL);
           
                System.out.println("4444444444444444"+URL);
              if (!user.equals("null")) {
                 
                  
                  System.out.println("555555555555555");
                 Mongo mg = new Mongo(ip,27017);
                 DB db = mg.getDB("baazaronline");
                 DBCollection collection = db.getCollection("products");
                 collection.insert(obj);
                 ObjectId Product_id = (ObjectId)obj.get( "_id" );
                                     c_p_id=Product_id.toString();
            
               DBObject doc1 = new BasicDBObject("_id",new ObjectId(c_p_id));
                DBCollection collection2=db.getCollection("product_varient_relations");
                DBObject doc2 = new BasicDBObject();
                                     doc2.put("Product_id",c_p_id);
                                     doc2.put("Varient_id",c_p_id );
                                     collection2.insert(doc2);
               
               DBCollection collection1 = db.getCollection("product_prices");
               DBObject doc = new BasicDBObject();
               doc.put("Product_id",c_p_id);
               doc.put("User_Object_ID",user );
               doc.put("Price",price);
               doc.put("Stock_qty",stock_qty);
               doc.put("group_Price",group_Price );
               doc.put("Special_price",special_price );
               doc.put("Special_price_from_date",Special_price_from );
               doc.put("Special_price_to_date",Special_price_to);
               doc.put("tier_price",tier_price);
               doc.put("SKU",sku);
               doc.put("Type", "Product");
               doc.put("Stock" , Stock);
               collection1.insert(doc);
               
                  System.out.println("i am in side the if condiondion");

                 jsono.put("amit", "succuss"); 
                 jsono.put("type", "product"); 
                 out.print(jsono);     
               mg.close(); 
             } else {
                  System.out.println("i am in side the else condion s");
      jsono.put("amit", "fail");
      out.print(jsono);        
              }
        
        }
        catch(Exception e){
        
        }
     
    }
    
       
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
       

}
}