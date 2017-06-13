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


@WebServlet(urlPatterns = {"/Update_Bank_info"})
public class Update_Bank_info extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String Bene_name=request.getParameter("Bene_name");
           String Bank_Name=request.getParameter("Bank_Name");
           String Account_Number=request.getParameter("Account_Number");
           String IFSC_Code=request.getParameter("IFSC_Code");
           String Bank_pin=request.getParameter("Pincode");
            String Bank_state=request.getParameter("Bank_state");
            String Bank_city=request.getParameter("Bank_city");
           
            HttpSession session = request.getSession(true);
            String User_ID=(String)session.getAttribute("User_ID");
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
                updateFields.append("Bene_name", Bene_name);
                updateFields.append("Bank_Name", Bank_Name);
                updateFields.append("Account_Number", Account_Number);
                updateFields.append("IFSC_Code", IFSC_Code);
                updateFields.append("Bank_pinnumber", Bank_pin);
                updateFields.append("Bank_state", Bank_state);
                updateFields.append("Bank_city", Bank_city);
                
                
                    BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(doc, setQuery);
                        mg.close();    
                RequestDispatcher rs = request.getRequestDispatcher("Bank_Details.jsp");
                rs.include(request, response);
                out.print("<script>alert('Updated Successfully');</script>");
                
        }
    }


}
