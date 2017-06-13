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
@WebServlet(name = "DeleteAttributes", urlPatterns = {"/DeleteAttributes"})
public class DeleteAttributes extends HttpServlet {

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
    //    processRequest(request, response);
    response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
 String attcode = request.getParameter("Attribute_code");
 String ip = getServletContext().getInitParameter("ip");
        System.out.println("attribite cod is here"+attcode);
         if (CheckAtt.checkAttribute(attcode)) {
                out.print("<script> alert('Recored is not delete');"
                     + "location='showAttribute.jsp'</script>");
           
        }else{
        try {
                 MongoClient mongoClient = new MongoClient( ip , 27017 );
                 MongoDatabase database = mongoClient.getDatabase("baazaronline");
                 MongoCollection<Document> collection = database.getCollection("Attribute");
            
              DeleteResult myDoc = collection.deleteOne(eq("attcode", attcode));
            System.out.print("hello helo   "+myDoc);
        out.print("<script> alert('Recored is deleted');"
                     + "location='showAttribute.jsp'</script>");
          
      }catch(Exception e){
         out.print(e);
      }
         
    }
    
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
     //   processRequest(request, response);
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
