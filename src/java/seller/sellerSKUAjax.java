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

@WebServlet(urlPatterns = {"/sellerSKUAjax"})
public class sellerSKUAjax extends HttpServlet {

  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                String  Product_SKU=request.getParameter("val");
        
           
           
    try{  
    Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection(Seller_Login.Product_price_collection);
                      BasicDBObject doc = new BasicDBObject();
     DBCursor cursor=collection.find(doc);
     
    while(cursor.hasNext()){
    DBObject str=cursor.next();
     if(str.get("SKU").equals(Product_SKU))
     {
       out.print("SKU must be unique");
     }
     else
     {
        out.print("");
    }
      mg.close();
    }}
    catch(Exception e){e.printStackTrace();} 
        }
    }

    
}
