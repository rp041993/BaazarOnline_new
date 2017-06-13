package seller;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
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

@WebServlet(urlPatterns = {"/Update_Seller_product"})
public class Update_Seller_product extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            
            String Product_id=(String)request.getParameter("Product_id");
            String SKU=(String)request.getParameter("SKU");
          String price=(String) request.getParameter("price");
          String Stock_qty=(String) request.getParameter("stock_qty");
          String Stock=(String)request.getParameter("Stock");
          String Special_price=request.getParameter("special_price");
          String Special_price_from_date=(String)request.getParameter("Special_price_from_date2");
          String Special_price_to_date=(String)request.getParameter("Special_price_to_date1");
          HttpSession session = request.getSession(true);
             String User_Object_ID = (String) session.getAttribute("Object_ID");
                 Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection1 = db.getCollection(Seller_Login.Product_price_collection);
                
                 DBObject by_P_id = new BasicDBObject("Product_id", Product_id);  
                DBObject by_User_ID = new BasicDBObject("User_Object_ID", User_Object_ID);    
                BasicDBList And = new BasicDBList();
                And.add(by_P_id);
                And.add(by_User_ID);
                DBObject doc1 = new BasicDBObject("$and", And);
           
                BasicDBObject updateFields = new BasicDBObject();
                
                updateFields.append("SKU", SKU);
                updateFields.append("Price", price);
                updateFields.append("Stock", Stock);
                updateFields.append("Special_price", Special_price);
                updateFields.append("Special_price_from_date", Special_price_from_date);
                updateFields.append("Special_price_to_date", Special_price_to_date);
                updateFields.append("Stock_qty", Stock_qty);
                
                
                        BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection1.update(doc1, setQuery);
                   
                 mg.close();
                RequestDispatcher rs = request.getRequestDispatcher("My_product_list.jsp");
                rs.include(request, response);
                out.print("<script>alert('Product Updated Successfully');</script>");
          
        }
        catch(Exception e)
        {
            RequestDispatcher rs = request.getRequestDispatcher("Update_my_product.jsp");
                rs.include(request, response);
                out.print("<script>alert('Problem occured');</script>");
        }
    }

}
