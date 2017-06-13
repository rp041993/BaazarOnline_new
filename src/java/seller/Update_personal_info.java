package seller;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/Update_personal_info"})
public class Update_personal_info extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           String Seller_Bdate=request.getParameter("dp1");
           String Seller_Name=request.getParameter("u_name");
           String Seller_Gender=request.getParameter("u_gender");
           String Seller_Alt_num=request.getParameter("u_alt_num");
           String Seller_Tel_num=request.getParameter("u_tel_no");
             HttpSession session = request.getSession(true);
             String User_ID = (String) session.getAttribute("User_ID");
           System.out.print(Seller_Bdate);
           Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection = db.getCollection(Seller_Login.seller);
                
            DBObject byNumber = new BasicDBObject("Number", User_ID);  
            DBObject byEmail = new BasicDBObject("Email", User_ID);    
            BasicDBList Or = new BasicDBList();
            Or.add(byNumber);
            Or.add(byEmail);
            DBObject doc = new BasicDBObject("$or", Or);
            //////////////////////////////////////////////////////////////
                
            
            
                BasicDBObject updateFields = new BasicDBObject();
                updateFields.append("Full_Name", Seller_Name);
                updateFields.append("DOB", Seller_Bdate);
                updateFields.append("Gender", Seller_Gender);
                updateFields.append("alt_Number", Seller_Alt_num);
                updateFields.append("tel_Number", Seller_Tel_num);
                
                
                    BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(doc, setQuery);
                        mg.close();    
                RequestDispatcher rs = request.getRequestDispatcher("Seller_Profile.jsp");
                rs.include(request, response);
                out.print("<script>alert('Updated Successfully');</script>");
                
        }
    }

 
}
