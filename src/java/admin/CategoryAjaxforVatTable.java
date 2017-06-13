package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

/**
 *
 * @author baazarteam3
 */
@WebServlet(urlPatterns = {"/CategoryAjaxforVatTable"})
public class CategoryAjaxforVatTable extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          
        try (PrintWriter out = response.getWriter()) {
         String ip = getServletContext().getInitParameter("ip");
            String name=request.getParameter("value");
          
    
    try{  
     String state="";
    MongoClient client = new MongoClient(ip,27017);
                      MongoDatabase db = client.getDatabase("baazaronline");
                      MongoCollection<Document> collection = db.getCollection("vat_tax");
                      
                      
                      List<Document> Documents = (List<Document>) collection.find().into(new ArrayList<Document>());
                      for (Document field : Documents) {
                        if(field.get("category_id").equals(name))
                        {
                        List<Document> taxes = (List<Document>) field.get("Tax");
                        //////////////////////////////////////
                        out.print("<table"); 
                  
                        for (Document tax : taxes) {
                            out.print("<tr><th>"+tax.getString("state")+"</th><td>"+tax.getString("interstate")+"</td><td>"+tax.getString("intrastate")+"</td></tr>");  
                             
                        }  
                        }out.print("</table>");  
                    }       
                      client.close();
    }catch(Exception e){e.printStackTrace();}  
    }}  
}
