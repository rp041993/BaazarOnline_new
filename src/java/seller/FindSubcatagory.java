/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package seller;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

/**
 *
 * @author baazaronline4
 */
@WebServlet(urlPatterns = {"/FindSubcatagory"})
public class FindSubcatagory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FindSubcatagory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FindSubcatagory at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
      
        String cid = request.getParameter("value");
        
        
        JSONObject json = new JSONObject();
        JSONArray array = new JSONArray();
        JSONObject data =  new JSONObject();
         int []sampleData=null;
        
                    response.setContentType("application/json;charset=utf-8");
                     PrintWriter out = response.getWriter();
                     MongoClient mongoClient = new MongoClient( Seller_Login.Database , 27017 );
                     DB db = mongoClient.getDB("baazaronline");
                     DBCollection collection = db.getCollection("categories");
                     BasicDBObject doc = new BasicDBObject("parentid","null");
                     DBCursor cursor=collection.find(doc);
                     
                     int i = 0;
    
                      while (cursor.hasNext()) {
                    
                  
                    String s= cursor.next().toString();
                //  out.println(""+s);
                // creating json object for conver string values to json
               
                    Object obj=JSONValue.parse(s); 
                    JSONObject jsonObject = (JSONObject) obj;
                  
                  //   out.println(" <p>"+jsonObject.toJSONString()+"</p>");
                    
//                   getting values from  json to string
                  
                     
                    String pid =  (String) jsonObject.get("parentid");
                    //again convert in to json
                    Object js = jsonObject.get("_id");
                    JSONObject ll = (JSONObject)js;
                    String id= (String) ll.get("$oid");
                    String Name =  (String) jsonObject.get("Name");
                    
        JSONObject jsona = new JSONObject();
        JSONArray arraa = new JSONArray();
        JSONObject member =  new JSONObject();

        member.put("arrayData", sampleData);
        array.add(member);

        json.put("jsonArray", array);

       
        out.print(json.toString());
       
                    
                  

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
        processRequest(request, response);
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
