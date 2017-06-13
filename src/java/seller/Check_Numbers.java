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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Check_Numbers"})
public class Check_Numbers extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             HttpSession session = request.getSession(true);
             String User_ID = (String) session.getAttribute("User_ID");
             try{  
                        String  id=request.getParameter("id");
                        System.out.print(id);
                        
                        String  value=request.getParameter("value");
                        System.out.print(value);
                      Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection(Seller_Login.seller);
                      DBObject byNumber = new BasicDBObject("Number", User_ID);  
                      DBObject byEmail = new BasicDBObject("Email", User_ID);    
                      BasicDBList Or = new BasicDBList();
                        Or.add(byNumber);
                        Or.add(byEmail);
                      DBObject doc = new BasicDBObject("$or", Or);
                      DBCursor cursor = collection.find(doc);
                      
                      if(id=="Gumasta")
                      {
                      while(cursor.hasNext())
                        {
                        DBObject str= cursor.next();
                        if(str.get("Gumasta_num").equals(value))
                        {
                            out.print("exists");
                        }
                        else
                        {
                            out.print("");
                        } 
                       }
                        mg.close();
                      
                      }  
                      else if(id.equals("PAN_Num"))
                      {
                           
                      while(cursor.hasNext())
                        {  
                        DBObject str= cursor.next();
                        
                        if(str.get("PAN_Num").equals(value))
                        {
                            out.print("exists");
                        }
                        else
                        {
                            out.print("");
                        }   
                        }
                        mg.close();
                      
                      }  
                     else if(id.equals("VAT_Num"))
                      {
                      while(cursor.hasNext())
                        {
                        DBObject str= cursor.next();
                        if(str.get("VAT_Num").equals(value))
                        {
                            out.print("exists");
                        }
                        else
                        { 
                            out.print("");
                            
                        } 
                       
                         
                        }
                        mg.close();
                      
                      }  
                      else if(id=="CST_Num")
                      {
                      while(cursor.hasNext())
                        {
                        DBObject str= cursor.next();
                        if(str.get("CST_num").equals(value))
                        {
                            out.print("exists");
                            
                        }
                        else
                        {
                            out.print("");
                        }
                        }
                        mg.close();
                      
                      }  
             
             
             
             }
                        catch(Exception e){e.printStackTrace();}  
                        }
                    }
}
