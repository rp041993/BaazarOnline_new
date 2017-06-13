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

@WebServlet(urlPatterns = {"/Add_Varient"})
public class Add_Varient extends HttpServlet {
    public static String c_varient_id;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
           String ip = getServletContext().getInitParameter("ip");
//            out.print("bhjbhjv");
      String s = request.getParameter("test");
      System.out.println("dytdtydtydtytdytdy");
      DBObject obj = (DBObject) JSON.parse(s);
          
          
          //##############################################################################
          String SKU=(String) obj.removeField("SKU");
          
              if(true)
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
                        
                              String Special_price_from_date=(String)obj.removeField("Special_price_from_date");
                              String Special_price_to_date=(String)obj.removeField("Special_price_to_date");
                               HttpSession session = request.getSession(true);
                             String  user  =   (String) session.getAttribute("User_Object_ID");
                              //############################Create URL########################################
                              
                              //####################################################################
                                    Mongo mg = new Mongo(ip,27017);
                                    DB db = mg.getDB("baazaronline");
                                    DBCollection collection = db.getCollection("products");
                                    DBCollection collection1 = db.getCollection("product_prices");
                                    DBCollection collection2=db.getCollection("product_varient_relations");
                              ////////////////////SAVE PRODUCT//////////////////////////////////////

                                //product collection-        
                                    collection.insert(obj);
                                    ObjectId Varient_id = (ObjectId)obj.get( "_id" );
                                       c_varient_id=Varient_id.toString();
                                      DBObject doc1 = new BasicDBObject("_id",new ObjectId(c_varient_id));


                                   BasicDBObject updateFields = new BasicDBObject();
                                    updateFields.append("Product_Name","" );
                                    updateFields.append("User_Object_ID",user);
                                    updateFields.append("Type","Product_Varient");
                                    
                                        BasicDBObject setQuery = new BasicDBObject();
                                            setQuery.append("$set", updateFields);
                                            collection.update(doc1, setQuery);
                               /////////////////////////////////Product_Varient_relation///////////////////////
                                    DBObject doc2 = new BasicDBObject();
                                     doc2.put("Product_id",Product_id);
                                     doc2.put("Varient_id", c_varient_id);
                                     collection2.insert(doc2);
                              //////////////////////////////////product_price collection///////////////////////
                                   DBObject doc = new BasicDBObject();
                                   doc.put("SKU",SKU);
                                   doc.put("Product_id",c_varient_id);
                                   doc.put("User_Object_ID", user );
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

