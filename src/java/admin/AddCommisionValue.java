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

/**
 *
 * @author baazaronline4
 */
@WebServlet(urlPatterns = {"/AddCommisionValue"})
public class AddCommisionValue extends HttpServlet {
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
        PrintWriter  out = response.getWriter();
        int Commission = Integer.parseInt(request.getParameter("Commission"));
        int Shippment = Integer.parseInt(request.getParameter("Shippment"));
        int Packaging_Cost = Integer.parseInt(request.getParameter("Packaging_Cost"));
        int Labour_salary = Integer.parseInt(request.getParameter("Labour_salary"));
        int Services_Tax = Integer.parseInt(request.getParameter("Services_Tax"));
        String cid = request.getParameter("cid");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        
        String ip = getServletContext().getInitParameter("ip");
          Mongo mg = new Mongo(ip,27017);
               DB db = mg.getDB("baazaronline");
               DBCollection collection = db.getCollection("baazarCommision");
        
              DBObject find = new BasicDBObject("cid", cid);
               
              if (type.equals("delete")) {
                  System.out.println("in the delete section");
                  collection.remove(find);
                   out.print("<script>alter('delete succuss');</script>");
               RequestDispatcher rd = request.getRequestDispatcher("showComission.jsp");
               rd.forward(request, response);
              
                  }
              else{
              
               DBCursor cursor = collection.find(find);
               if (cursor.hasNext()) {
                   
               BasicDBObject updateFields = new BasicDBObject();
               updateFields.append("Commission", Commission);
               updateFields.append("Shippment", Shippment);
               updateFields.append("Packaging_Cost", Packaging_Cost);
               updateFields.append("Labour_salary", Labour_salary);
               updateFields.append("Services_Tax", Services_Tax);
               updateFields.append("cid", cid);
               updateFields.append("cname", name);
               BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(find, setQuery);
                        
                        mg.close();
                out.print("<script>alter('update succusss');</script>");
                 RequestDispatcher rd = request.getRequestDispatcher("showComission.jsp");
               rd.forward(request, response);
                 }
               else{
                   System.out.println(" while condddions is false");
               DBObject doc = new BasicDBObject();
              
               doc.put("Commission", Commission);
               doc.put("Shippment", Shippment);
               doc.put("Packaging_Cost", Packaging_Cost);
               doc.put("Labour_salary", Labour_salary);
               doc.put("Services_Tax", Services_Tax);
               doc.put("cid", cid);
               doc.put("cname", name);
               collection.insert(doc);
               out.print("<script>alter('save succuss');</script>");
               RequestDispatcher rd = request.getRequestDispatcher("showComission.jsp");
               rd.forward(request, response);
               
               }
    }
    }
}
