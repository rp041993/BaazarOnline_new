package admin;


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

/**
 *
 * @author baazarteam3
 */
@WebServlet(urlPatterns = {"/CategoryAjaxDropdown"})
public class CategoryAjaxDropdown extends HttpServlet {


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          
        try (PrintWriter out = response.getWriter()) {
         String  dropdownvalue=request.getParameter("val");
         String ip = getServletContext().getInitParameter("ip");
           System.out.print("uhfuhfuhff"+dropdownvalue);
           
           
          
            
    
    try{  
     
    Mongo mg = new Mongo(ip,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection("Attribute");
                      BasicDBObject doc = new BasicDBObject("attset","AttributeSet");
                      
     
     DBCursor cursor=collection.find(doc);
     
    while(cursor.hasNext()){
    DBObject str=cursor.next();
     if(str.get("Name").equals(dropdownvalue))
     {
   out.print(str.get("Attributes"));
     }
    
    
    }
      mg.close();
   
    }catch(Exception e){e.printStackTrace();}  
    }}  
        }
    

