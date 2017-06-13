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


   
import javax.servlet.annotation.MultipartConfig;
import org.bson.types.ObjectId;
@WebServlet(urlPatterns = {"/Update_Business_info"})
@MultipartConfig(maxFileSize = 16177215)
public class Update_Business_info extends HttpServlet {

   private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ///////////////////////////////////////////////////////////////////
            String Business_Name=request.getParameter("Reg_B_Name");
           String Business_Address=request.getParameter("Reg_B__Add");
           String Business_Type=request.getParameter("v_btype");
           String Pincode=request.getParameter("Pincode");
           String PAN_Card_Name=request.getParameter("PAN_Name");
           String PAN_Num=request.getParameter("PAN_Num");           
           String TIN_Num=request.getParameter("VAT_Num");           
           String CST_Num=request.getParameter("CST_Num");           
           String GUMASTA_Num=request.getParameter("Gumasta");
          
           
            //////////////////////////////////////////////////////////////////////
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
            
            ////////////////////////////////////////////////////////////////////
            
            
         // Upload Multiple images   
            
        //////////////////////////////////////////////////////////////////////////////////
            
    
          
            BasicDBObject updateFields = new BasicDBObject();
                updateFields.append("Business_Name", Business_Name);
                updateFields.append("Business_Address", Business_Address);
                updateFields.append("Business_Type", Business_Type);
                updateFields.append("Pincode", Pincode);
                updateFields.append("PAN_Card_Name", PAN_Card_Name);
                updateFields.append("PAN_Num", PAN_Num);
                updateFields.append("TIN_Num", TIN_Num);
                updateFields.append("CST_Num", CST_Num);
                updateFields.append("GUMASTA_Num", GUMASTA_Num);
                
                    BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(doc, setQuery);
                        mg.close();    
                RequestDispatcher rs = request.getRequestDispatcher("Seller_Business_Info.jsp");
                rs.include(request, response);
                out.print("<script>alert('Updated Successfully');</script>");
        }
    }

    

}
