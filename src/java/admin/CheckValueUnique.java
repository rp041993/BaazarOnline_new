
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.sun.java.swing.plaf.windows.resources.windows;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;


@WebServlet(urlPatterns = {"/CheckValueUnique"})
public class CheckValueUnique extends HttpServlet {

  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                      response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                      String  name=request.getParameter("name");
                      String  value=request.getParameter("value");
                       String  id =request.getParameter("id");
            System.out.println("getting value of the product for validation that is woriking or noeeeeeee"+value+">>>>>>>>>>"+name);
                try{  
     
                    String ip = getServletContext().getInitParameter("ip");
                      Mongo mg = new Mongo(ip,27017);
                      DB db = mg.getDB("baazaronline");
                        DBCollection collection= null;
                      if (id.equals("SKU")) {
                        collection = db.getCollection("product_prices");
                       }else{
                       collection = db.getCollection("products");
                      }
                      BasicDBObject doc = new BasicDBObject(name , value);
                      DBCursor cursor=collection.find(doc);
                        JSONObject jsonObject =  new JSONObject();
                    
            
                      if (cursor.hasNext()) {
                          System.out.println(" i am inside the product already exites....................");
                        //out.print("Product already exists");
                        jsonObject.put("status", "yes");
                        jsonObject.put("id", id);
                        jsonObject.put("name", name);
                        out.print(jsonObject);
                      }
                   else{
                      //out.print("");
                       jsonObject.put("status", "no");
                      jsonObject.put("id", id);
                      jsonObject.put("name", name);
                      out.print(jsonObject);
                      }
          }
                catch(Exception e){
                      e.printStackTrace();
                               }  
        }
    }

}
