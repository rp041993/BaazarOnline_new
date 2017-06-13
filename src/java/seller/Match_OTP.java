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


@WebServlet(urlPatterns = {"/Match_OTP"})
public class Match_OTP extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
           String Random_num=(String)session.getAttribute("Random");
           String otp=request.getParameter("otp");
           if(Random_num.equals(otp))
           {
               String Name=(String)session.getAttribute("Name");
               String Mobile_num=(String)session.getAttribute("mobile");
               String Email=(String)session.getAttribute("Email");
               System.out.print("hjrhrhruyhru"+Name);
                if(Name==null || Email==null)
                    {
                   System.out.print(Mobile_num);
                   RequestDispatcher rs = request.getRequestDispatcher("Set_Pass.jsp");
                   rs.include(request, response);
                    }
                else
                {
                   Mongo mg = new Mongo(Seller_Login.Database,27017);
                   DB db = mg.getDB("baazaronline");
                   DBCollection collection = db.getCollection(Seller_Login.seller);
                   BasicDBObject doc = new BasicDBObject();
                   doc.put("Full_Name",Name);
                   doc.put("Email",Email);
                   doc.put("Number",Mobile_num);
                   doc.put("Password","None");
                   collection.insert(doc);
                   mg.close();
                   
                   RequestDispatcher rs = request.getRequestDispatcher("Set_Pass.jsp");
                   rs.include(request, response);
                   out.print("<script>alert('Registration Successfull');</script>");
               }
              
           }
           else
           {
               RequestDispatcher rs = request.getRequestDispatcher("Insert_OTP.jsp");
               rs.include(request, response);
               out.print("<script>alert('Invalid otp');</script>");
           }
    }

  
    }
}
