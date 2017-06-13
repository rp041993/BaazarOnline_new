package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.eq;
import com.mongodb.client.result.DeleteResult;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

/**
 *
 * @author baazarteam4
 */
@WebServlet(name = "DeleteAttributes", urlPatterns = {"/DeletePin"})
public class Deletepincode extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
             int  pin = Integer.parseInt(request.getParameter("name"));
             String ip = getServletContext().getInitParameter("ip");
 
               System.out.println("pin-code is here"+pin);
//         if (CheckAtt.checkAttribute(attcode)) {
             try {
                 MongoClient mongoClient = new MongoClient( ip , 27017 );
                 MongoDatabase database = mongoClient.getDatabase("collections");
                 MongoCollection<Document> collection = database.getCollection("code");
            
              DeleteResult myDoc = collection.deleteOne(eq("Pincode", pin));
              out.print("<h1>data come to delete</h1>"+myDoc);
            System.out.print("hello helo   "+myDoc);
               out.print("<script>alert('recored is affected');"
                       + "location='AddPin.jsp'</script>");
    
          
      }catch(Exception e){
         out.print(e);
      }
           
//        }else{
//        
//        out.print("<script>alert('recored is not found');</script>");
//          javax.servlet.RequestDispatcher rs = request.getRequestDispatcher("AddPin.jsp");
//                      rs.include(request, response);
//                
//    }
    
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
