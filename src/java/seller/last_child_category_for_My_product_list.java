
package seller;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;


@WebServlet(name = "last_child_category_for_My_product_list", urlPatterns = {"/last_child_category_for_My_product_list"})
public class last_child_category_for_My_product_list extends HttpServlet {
   
    ArrayList<String> Last_child1 = new ArrayList<String>();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String cid=request.getParameter("Status");
           String Search_bar=request.getParameter("Search_bar");
           Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection("categories");
                      BasicDBObject doc= new BasicDBObject("parentid",cid);
                      DBCursor cursor1=collection.find(doc);
                      Last_child1.clear();
                  if(cursor1.hasNext())
                      {
                   while(cursor1.hasNext())
                                  {
                                   DBObject str1=cursor1.next();
                                  Object id=(ObjectId)str1.get("_id");
                                  String id1=id.toString();
                                   two(id1);
                                   Last_child1.add(id1);
                                  }
                                  
                      }
                     System.out.println(Last_child1);
                          Last_child1.add(cid);
                      
                                   HttpSession session = request.getSession(true);
                                    session.setAttribute("Last_child_id_for_my_product_list",Last_child1);
                                    session.setAttribute("Search_bar", Search_bar);
                                    RequestDispatcher rd = request.getRequestDispatcher("My_product_list.jsp");
                                   rd.forward(request, response);
                                          }
    }
    public void two(String id){
        String id2="";
       Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection("categories");
                      BasicDBObject doc=new BasicDBObject("parentid",id);
                      DBCursor cursor1=collection.find(doc);
                   while(cursor1.hasNext())
                                  {
                                   DBObject str1=cursor1.next();
                                            id2=str1.get("_id").toString();
                                            Last_child1.add(id2);
                                            three(id2);
                                  }  
                    
                                        }
    public void three(String id){
        String id2="";
       Mongo mg = new Mongo(Seller_Login.Database,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection("categories");
                      BasicDBObject doc=new BasicDBObject("parentid",id);
                      DBCursor cursor1=collection.find(doc);
                   while(cursor1.hasNext())
                                  {
                                   DBObject str1=cursor1.next();
                                            id2=str1.get("_id").toString();
                                            Last_child1.add(id2);
                                  }  
                    
                                        }
    
    }
