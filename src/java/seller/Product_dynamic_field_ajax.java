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

@WebServlet(urlPatterns = {"/Product_dynamic_field_ajax"})
public class Product_dynamic_field_ajax extends HttpServlet {

  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           try{  
               String field=request.getParameter("field");
               String value=request.getParameter("val");
                      Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection(Seller_Login.Product_collection);
                      BasicDBObject doc = new BasicDBObject();
                      DBCursor cursor=collection.find(doc);
     
    while(cursor.hasNext()){
    DBObject str=cursor.next();
     if(str.get(field).equals(value))
     {
       out.print("Entered value already exists");
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
    

   

