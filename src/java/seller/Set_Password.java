/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package seller;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
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


@WebServlet(urlPatterns = {"/Set_Password"})
public class Set_Password extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession(true);
           String Number=(String)session.getAttribute("mobile");
           System.out.print(Number);
           if(Number==null)
           {
               RequestDispatcher rs = request.getRequestDispatcher("Seller_Login.jsp");
               rs.include(request, response);
           }
           else
           {
               String password=request.getParameter("u_pass");
               Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection = db.getCollection(Seller_Login.seller);
                BasicDBObject doc = new BasicDBObject("Number",Number);
                BasicDBObject updateFields = new BasicDBObject();
                updateFields.append("Password", password);
                updateFields.append("PAN_Num", "");
                updateFields.append("TIN_Num", "");
                updateFields.append("CST_Num", "");
                updateFields.append("GUMASTA_Num", "");
                updateFields.append("Business_Address", "");
                updateFields.append("Business_Name", "");
                updateFields.append("Business_Type", "");
                updateFields.append("CST_Proof", "");
                updateFields.append("DOB", "");
                updateFields.append("GUMASTA_Proof", "");
                updateFields.append("Gender", "");
                updateFields.append("PAN_Card_Name", "");
                updateFields.append("PAN_Proof", "");
                updateFields.append("Pincode", "");
                updateFields.append("Seller_dp", "");
                updateFields.append("VAT_Proof", "");
                updateFields.append("alt_Number", "");
                updateFields.append("tel_Number", "");
                updateFields.append("ID_type", "");
                updateFields.append("ID_Proof", "");
                updateFields.append("KYC_Proof", "");
                updateFields.append("Bene_name", "");
                updateFields.append("Bank_Name", "");
                updateFields.append("Account_Number", "");
                updateFields.append("IFSC_Code", "");
                updateFields.append("Bank_state", "");
                updateFields.append("Bank_city", "");
                
                BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(doc, setQuery);
                        mg.close();    
                RequestDispatcher rs = request.getRequestDispatcher("Seller_Login.jsp");
                rs.include(request, response);
                out.print("<script>alert('Your Password set sucessfully');</script>");
           }
            
        }
    }

   
}
