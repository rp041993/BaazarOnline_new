package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
/**
 *
 * @author baazaronline4
 */
public class FindAttributeSetForProduct extends HttpServlet {

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
            out.println("<title>Servlet FindAttributeSetForProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FindAttributeSetForProduct at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
   
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
        
        
            
        response.setContentType("application/json;charset=utf-8");
         //response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();
        String ip = getServletContext().getInitParameter("ip");
           String cid = request.getParameter("val");   
           System.out.println("this my testing for that i am geting values are not "+cid);
        try{
        
                   MongoClient mongoClient = new MongoClient( ip , 27017 );
                     DB db = mongoClient.getDB("baazaronline");
                     DBCollection collection = db.getCollection("categories");
                   //  query.put("_id", new ObjectId(id));
                     BasicDBObject doc = new BasicDBObject("_id", new ObjectId(cid));
                     DBCursor cursor=collection.find(doc);
                    
                     
                     if (cursor.hasNext()) {
                
                     int i = 0;
                     
    
                       while (cursor.hasNext()) {
                          System.out.println("data     "+cursor);
                  
                    String s= cursor.next().toString();
                   System.out.println("before"+s);
                // creating json object for conver string values to json
               
                    Object obj=JSONValue.parse(s); 
                    JSONObject jsonObject = (JSONObject) obj;
                   System.out.println("this io json object"+jsonObject);
//                   getting values from  json to string
                     
                    String pid =  (String) jsonObject.get("parentid");
                    
                    //again convert in to json
                    Object js = jsonObject.get("_id");
                    JSONObject ll = (JSONObject)js;
                    String id= (String) ll.get("$oid");
                    String Name =  (String) jsonObject.get("Name");
                    String attributeSet =   (String) jsonObject.get("attributeSet");
                   
                    JSONObject jo= new JSONObject();
                    jo.put("AttributeSetName", attributeSet);
                       out.print("<p>"+attributeSet+"</p>");
                       out.print("<p> this is my json objec     "+jo+"</p>");
                           System.out.println("i am in the find attrubuteset ffhellsf   "+attributeSet);
                       response.sendRedirect("addproductAdmin.jsp?AttributeSet="+attributeSet+"&cid="+cid);
                     // getServletContext().getRequestDispatcher("SelectAttributeForDynamicForm").forward(request, response);
            
            
                       }
                     }
                     else{
                     
                     }
                    
                      
  }
 
        catch (Exception e) {
 System.out.print(e);
                 }  
}
}