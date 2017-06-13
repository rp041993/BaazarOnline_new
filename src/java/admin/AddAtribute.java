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
import com.mongodb.MongoClient;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baazarteam4
 */
//@WebServlet(name = "AddAtribute", urlPatterns = {"/AddAtribute"})
public class AddAtribute extends HttpServlet {

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
        processRequest(request, response);
         
    
    
    
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
        
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        String attcode = request.getParameter("Attribute_code");
        String Attribute = request.getParameter("Attribute");
        String Visiblename = request.getParameter("Visible_name");
        String citso = request.getParameter("citso");
        String DefautV = request.getParameter("Def");
     ;  String UniqueV = request.getParameter("unique_value");
        String ValuesR = request.getParameter("Values_requier");
        String IVSO = request.getParameter("IVFSWAT");
        String optons = request.getParameter("opt");
        
         String ip = getServletContext().getInitParameter("ip");
        System.out.println("testig of roopesh  "+DefautV);
        List<String> values = Arrays.asList(optons.split(","));
     
     
        String a = attcode.toUpperCase();
   if (CheckAtt.checkAttribute(a)) {
        
        System.out.println("condtion is trure");
        try {
                MongoClient mongoClient = new MongoClient( ip , 27017 );
                DB db = mongoClient.getDB("baazaronline");
                DBCollection collection = db.getCollection("Attribute");
   
               BasicDBObject doc = new BasicDBObject();
                      
            doc.put("attcode", a);
            doc.put("Attribute", Attribute);
            doc.put("citso", citso);
            doc.put("DefautV", DefautV);
            doc.put("UniqueV", UniqueV);
            doc.put("ValuesR", ValuesR);
            doc.put("IVSO", IVSO);
            doc.put("Visiblename", Visiblename);
           doc.put("values", values);
 
           collection.insert(doc);
           out.print("<script>alert('success');'</script>");
   RequestDispatcher rs = request.getRequestDispatcher("showAttribute.jsp");
                rs.include(request, response);
               
 
 

    }
        catch(Exception e){
    }
    
   }    else{
 
        out.print("<script>alert('Attribute is already existe');</script>");
         RequestDispatcher rs = request.getRequestDispatcher("showAttribute.jsp");
                rs.include(request, response);
 

          
   }
           
      
        
        }
        
    }

  
