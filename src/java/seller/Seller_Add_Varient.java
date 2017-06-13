package seller;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
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
import static seller.Seller_SaveProduct.c_p_id;

@WebServlet(urlPatterns = {"/Seller_Add_Varient"})
public class Seller_Add_Varient extends HttpServlet {
    public static String c_varient_id;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           System.out.println("fgsdg");
//            out.print("bhjbhjv");
      String s = request.getParameter("test");
      Object s1 = JSON.parse(s);
      System.out.println("dytdtydtydtytdytdy");
      DBObject obj =(DBObject) JSON.parse((String) s1);
          String Product_name="";
          String cid="";
//          String Product_shipment_weight="";
          double Product_shipment_weight1=0;
          //##############################################################################
          String SKU=(String) obj.removeField("SKU");
          
              if(Seller_Validate.checkSKU(SKU))
              {
                String Product_id=(String) obj.removeField("Product_id");
                String price=(String) obj.removeField("price");
                String Stock_qty=(String) obj.removeField("stock_qty");
                String Special_price=(String)obj.removeField("special_price");
                String Stock=(String)obj.removeField("Stock");
                 String DoubleV=("\\d+(\\.\\d+)?");
                 String regex = "\\d+";
                 if(Stock_qty.matches(regex))
                        {
                 if(price.matches(DoubleV) )
                  {
                      if(Special_price.matches(DoubleV) || Special_price.matches(""))
                      {
                        
                              String Special_price_from_date=(String)obj.removeField("Special_price_from_date2");
                              String Special_price_to_date=(String)obj.removeField("Special_price_to_date1");
                               HttpSession session = request.getSession(true);
                               String User_Object_ID=(String)session.getAttribute("Object_ID");
                              //############################Create URL########################################
                              
                              //####################################################################
                              
                                    Mongo mg = new Mongo(Seller_Login.Database,27017);
                                    DB db = mg.getDB("baazaronline");
                                    DBCollection collection = db.getCollection(Seller_Login.Product_collection);
                                    DBCollection collection1 = db.getCollection(Seller_Login.Product_price_collection);
                                    DBCollection collection2=db.getCollection(Seller_Login.Product_varient_relation);
                              ////////////////////SAVE PRODUCT//////////////////////////////////////

                                //product collection-        
                                    collection.insert(obj);
                                    ObjectId Varient_id = (ObjectId)obj.get( "_id" );
                                       c_varient_id=Varient_id.toString();
                                       session.setAttribute("c_varient_id", c_varient_id);
                                      DBObject doc1 = new BasicDBObject("_id",new ObjectId(c_varient_id));
                                //For product name
                                     DBCursor cursor4 = collection2.find();
                                     int count=0;
                                     while(cursor4.hasNext())
                                     {
                                         DBObject str4=cursor4.next();
                                         if(str4.get("Product_id").equals(Product_id))
                                         count++;
                                     }
                                    BasicDBObject doc5= new BasicDBObject("_id",new ObjectId(Product_id));
                                     DBCursor cursor6=collection.find(doc5);
                                       while(cursor6.hasNext())
                                       {
                                           DBObject str6=cursor6.next();
                                           Product_name=(String)str6.get("Product_Name");
                                           cid=(String)str6.get("cid");
                                           Product_shipment_weight1=(double)str6.get("Product_shipment_weight");
                                       }
                                     String Product_Name=Product_name+"#"+count;
                                   BasicDBObject updateFields = new BasicDBObject();
                                    updateFields.append("Product_Name", Product_Name );
                                    updateFields.append("cid", cid );
                                    updateFields.append("User_Object_ID",User_Object_ID );
                                    updateFields.append("Type","Product_Varient");
                                    updateFields.append("Product_Status","Unapproved");
                                        BasicDBObject setQuery = new BasicDBObject();
                                            setQuery.append("$set", updateFields);
                                            collection.update(doc1, setQuery);
                               //###########################Product shipment pincode table##########################
                            
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
                               /////////////////////////////////Product_Varient_relation///////////////////////
                                    DBObject doc2 = new BasicDBObject();
                                     doc2.put("Product_id",Product_id);
                                     doc2.put("Varient_id", c_varient_id);
                                     collection2.insert(doc2);
                              //////////////////////////////////product_price collection///////////////////////
                                   DBObject doc = new BasicDBObject();
                                   
                                   doc.put("SKU",SKU);
                                   doc.put("Product_id",c_varient_id);
                                   doc.put("User_Object_ID",User_Object_ID );
                                   doc.put("Price",price);
                                   doc.put("Stock",Stock);
                                   doc.put("Special_price",Special_price);
                                   doc.put("Special_price_from_date",Special_price_from_date);
                                   doc.put("Special_price_to_date",Special_price_to_date);
                                   doc.put("Stock_qty",Stock_qty);
                                   collection1.insert(doc);
                                   mg.close();
                      }
                      else{ out.print("Invalid Special price");}
                  }
                    else
                    {out.print("Invalid Price");}
                 }
                        else{out.print("Enter a valid stock quantity");}
        }
              else{out.print("SKU already Exists");}
    }
      
        
        catch(Exception e){
                System.out.print(e);}
    }

}  

