package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.validator.internal.constraintvalidators.LengthValidator;

/**
 *
 * @author baazarteam5
 */
public class Addcity extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
   
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
        
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
           String ip = getServletContext().getInitParameter("ip");
                            String code = request.getParameter("CityCode");
                            String dist = request.getParameter("District");
                          int pin = Integer.parseInt(request.getParameter("Pincode"));
                          
                        // int p = Integer.parseInt(pin);
                       //     long latt&langitude = ((Long) jsonObject.get ("Latitude & Longitude")).intValue();
                            String state =  request.getParameter("State");
                         //  String Str = new String("Welcome to Tutorialspoint.com");
                   String stateC = state.substring(0, 1).toUpperCase() + state.substring(1);
                   String distC = dist.substring(0, 1).toUpperCase() + dist.substring(1);
                   System.out.println("state  "+stateC +"   distic  "+distC);
                           String  str= code.toUpperCase();
                          
               if (CheckPin.checkPincode(str))
              {
             try { 
                    System.out.println("helloooooooooo");
                MongoClient mongoClient = new MongoClient( ip , 27017 );
                DB db = mongoClient.getDB("baazaronline");
                DBCollection collection = db.getCollection("pincode");
                BasicDBObject doc = new BasicDBObject();
                
                doc.put("Code", str);
                doc.put("District", distC);
                doc.put("Pincode", pin);
                 doc.put("Latitude & Longitude"," latt&langitude");
                doc.put("State", stateC);
                
                // doc.put("Applyto", Applyto);
                collection.insert(doc);
              out.println("<script>alert('sucessfully');"+" location='ReadPin.jsp' ;</script>");  
            }catch(Exception e){
                
            }
                   
          
           }
        else{
              out.println("<script>alert('alread exite');"+" location='AddPin.jsp' ;</script>");
            System.out.println("method is runing");
            
           
        }
    
        
        
        
        doGet(request, response);
        
       
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
