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
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;

@WebServlet(urlPatterns = {"/Seller_SaveProduct"})
public class Seller_SaveProduct extends HttpServlet {
    public static String c_p_id;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
           System.out.println("fgsdg");
//            out.print("bhjbhjv");
      String s = request.getParameter("test");
      Object s1 = JSON.parse(s);
      DBObject obj =(DBObject) JSON.parse((String) s1);
          
          
          //##############################################################################
          String SKU=(String) obj.removeField("SKU");
          String Product_Name=(String) obj.removeField("Product_Name");
          
          if(Seller_Validate.checkProduct(Product_Name))
          {
              if(Seller_Validate.checkSKU(SKU))
              {
                String price=(String) obj.removeField("price");
                String Wholesale=(String) obj.removeField("whole_sal_price");
                String Min_Wholesale_price=(String) obj.removeField("Min_Wholsale_price");
                String Max_Wholesale_price=(String) obj.removeField("Max_Wholsale_price");
                String Stock_qty=(String) obj.removeField("stock_qty");
                String Stock=(String)obj.removeField("Stock");
                String Special_price=(String)obj.removeField("special_price");
                 String DoubleV=("\\d+(\\.\\d+)?");
                 String regex = "\\d+";
                 
                 if(Stock_qty.matches(regex))
                        {
                 if(price.matches(DoubleV) )
                  {
                      if(Special_price.matches(DoubleV) || Special_price.matches(""))
                      {
                         if(Wholesale.matches(DoubleV) || Wholesale.matches(""))
                         {
                             if(Min_Wholesale_price.matches(DoubleV) || Min_Wholesale_price.matches(""))
                             {
                                 if(Max_Wholesale_price.matches(DoubleV) || Max_Wholesale_price.matches(""))
                                 {
                              String Special_price_from_date=(String)obj.removeField("Special_price_from_date");
                              String Special_price_to_date=(String)obj.removeField("Special_price_to_date");
                               HttpSession session = request.getSession(true);
                               String User_Object_ID = (String) session.getAttribute("Object_ID");
                              //############################Create URL########################################
                             
                                String URL=Product_Name.replaceAll("\\s+","_");

                              //############################weigth calculater########################################
                              String Product_weight=(String)obj.removeField("Product_weight");
                                  if(Product_weight.matches(DoubleV))
                                  {
                              String Product_width=(String)obj.removeField("Product_width");
                                  if(Product_width.matches(DoubleV))
                                  {
                              String Product_height=(String)obj.removeField("Product_height");
                                  if(Product_height.matches(DoubleV))
                                  {
                              String Product_length=(String)obj.removeField("Product_length");
                                  if(Product_length.matches(DoubleV))
                                  {
                                  double weight = Double.parseDouble(Product_weight);
                                  double length = Double.parseDouble(Product_length);
                                  double width = Double.parseDouble(Product_width);
                                  double height = Double.parseDouble(Product_height);
                                  double Product_shipment_weight=0;
                                  double x=(height*length*width)/5000;
                                  int integr=(int)x;
                                  double decimal=x-integr;
                                 if (decimal<.5 && decimal>0) 
                                 {
                                     Product_shipment_weight=integr+.5;
                                 } else 
                                 {
                                     Product_shipment_weight=integr+1;
                                }

                                  Product_shipment_weight=Math.max(weight,Product_shipment_weight);
                              System.out.print("121212121212121212121"+Product_shipment_weight);
                               //###########################Price Calculater########################################




                              //####################################################################
                                    Mongo mg = new Mongo(Seller_Login.Database,27017);
                                    DB db = mg.getDB("baazaronline");
                                    DBCollection collection = db.getCollection(Seller_Login.Product_collection);
                                    DBCollection collection1 = db.getCollection(Seller_Login.Product_price_collection);
                                    DBCollection collection2=db.getCollection(Seller_Login.Product_varient_relation);
                              ////////////////////SAVE PRODUCT//////////////////////////////////////

                                //product collection-        
                                    collection.insert(obj);
                                    ObjectId Product_id = (ObjectId)obj.get( "_id" );
                                     c_p_id=Product_id.toString();
                                     session.setAttribute("c_p_id", c_p_id);
                                   DBObject doc1 = new BasicDBObject("_id",new ObjectId(c_p_id));


                                   BasicDBObject updateFields = new BasicDBObject();
                                    updateFields.append("Product_Name",Product_Name );
                                    updateFields.append("User_Object_ID",User_Object_ID );
                                   // updateFields.append("Meta_key", Meta_key);
                                    updateFields.append("Product_url", URL);
                                    updateFields.append("Product_Status","Unapproved");
                                    updateFields.append("Product_weight", Product_weight);
                                    updateFields.append("Product_width", Product_width);
                                    updateFields.append("Product_height", Product_height);
                                    updateFields.append("Product_length", Product_length);
                                    updateFields.append("Product_shipment_weight", Product_shipment_weight);
                                    updateFields.append("Type","Product");
                                    
                                        BasicDBObject setQuery = new BasicDBObject();
                                            setQuery.append("$set", updateFields);
                                            collection.update(doc1, setQuery);
                                //###########################Product shipment pincode table##########################
                            
                                    String Pincode="";
                                if(Product_shipment_weight>5)
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
                                     doc2.put("Product_id",c_p_id);
                                     doc2.put("Varient_id",c_p_id );
                                     collection2.insert(doc2);
                              //////////////////////////////////product_price collection///////////////////////
                                   DBObject doc = new BasicDBObject();
                                   doc.put("SKU",SKU);
                                   doc.put("Product_id",c_p_id);
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
                                  else{out.print("Invalid Product length");}}
                                  else{out.print("Invalid Product height");}}
                                  else{out.print("Invalid Product width");}}
                                   else{out.print("Invalid Product Weight");}
                                   
                                   
                      }else{out.print("Invalid Max_Wholesale price");}
                        }else{out.print("Invalid Min_Wholesale price");}
                         }else{out.print("Invalid Wholsale price");}       
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
          else{out.print("Product name already Exists");}
    }   
        
        catch(Exception e){
                out.print(e);}
    }

  
}
