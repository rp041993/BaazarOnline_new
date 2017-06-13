package seller;
import com.mongodb.BasicDBList;
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
import org.bson.types.ObjectId;
import static seller.Seller_SaveProduct.c_p_id;

@WebServlet(urlPatterns = {"/Add_product_price"})
public class Add_product_price extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
            String Product_shipment_weight="";
           double Product_shipment_weight1=0;
           String Product_id=(String)request.getParameter("Product_id");
           String SKU=(String)request.getParameter("SKU");
          String price=(String) request.getParameter("price");
          String Stock_qty=(String) request.getParameter("stock_qty");
          String Stock=(String)request.getParameter("Stock");
          String Special_price=request.getParameter("special_price");
          String Special_price_from_date=(String)request.getParameter("Special_price_from_date");
          String Special_price_to_date=(String)request.getParameter("Special_price_to_date");
          HttpSession session = request.getSession(true);
             String User_Object_ID = (String) session.getAttribute("Object_ID");
                 Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection1 = db.getCollection(Seller_Login.Product_price_collection);
                
                DBObject doc1 = new BasicDBObject();
                
                doc1.put("Product_id", Product_id);
                doc1.put("User_Object_ID",User_Object_ID);
                doc1.put("SKU", SKU);
                doc1.put("Price", price);
                doc1.put("Stock", Stock);
                doc1.put("Special_price", Special_price);
                doc1.put("Special_price_from_date", Special_price_from_date);
                doc1.put("Special_price_to_date", Special_price_to_date);
                doc1.put("Stock_qty", Stock_qty);
                        collection1.insert(doc1);
                   
                        //###########################Product shipment pincode table##########################
                        DBCollection collection = db.getCollection(Seller_Login.Product_collection);
                            BasicDBObject doc5= new BasicDBObject("_id",new ObjectId(Product_id));
                                     DBCursor cursor6=collection.find(doc5);
                                       while(cursor6.hasNext())
                                       {
                                           DBObject str6=cursor6.next();
                                           Product_shipment_weight=(String)str6.get("Product_shipment_weight");
                                            Product_shipment_weight1=Double.parseDouble(Product_shipment_weight);
                                       }
                                    String Pincode="";
                                if(Product_shipment_weight1>5)
                                {
                                    DBCollection collection11 = db.getCollection(Seller_Login.seller);
                                 BasicDBObject doc11= new BasicDBObject("_id",new ObjectId(User_Object_ID));
                                 DBCursor cursor11=collection11.find(doc11);
                                 while(cursor11.hasNext())
                                 {
                                   DBObject str11 = cursor11.next();
                                   Pincode=(String)str11.get("Pincode");
                                 }
                                 DBCollection collection10 = db.getCollection(Seller_Login.Product_Availablity_pincode);
                                 BasicDBObject doc10= new BasicDBObject();
                                 doc10.put("Product_ID",c_p_id);
                                 doc10.put("Product_Availablity_pincode", Pincode);
                                 doc10.put("Vendor_Object_ID", User_Object_ID);
                                 collection10.insert(doc10);
                                }
                        
                        
                 mg.close();
                RequestDispatcher rs = request.getRequestDispatcher("Select_category_for_show_product.jsp");
                rs.include(request, response);
                out.print("<script>alert('Product price added successfully');</script>");
          
        }
        catch(Exception e)
        {
            RequestDispatcher rs = request.getRequestDispatcher("Update_my_product.jsp");
                rs.include(request, response);
                out.print("<script>alert('Problem occured');</script>");
        }
        
    }

   
}
