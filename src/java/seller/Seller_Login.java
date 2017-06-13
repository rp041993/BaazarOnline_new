package seller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author baazarteam2
 */
@WebServlet(urlPatterns = {"/Seller_Login"})
public class Seller_Login extends HttpServlet {
    public static String seller="sellers";
    public static String Product_Availablity_pincode="product_availablity_pincodes";
    public static String Product_collection="products";
    public static String Product_price_collection="product_prices";
    public static String Product_varient_relation="product_varient_relations";
    public static String Database="35.154.252.180";
    public static String User_ID;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
 
        String email = request.getParameter("u_email");
        String pass = request.getParameter("login_password");
        
        
          if(Seller_Validate.checkUser(email, pass))
          {
            RequestDispatcher rs = request.getRequestDispatcher("Seller_Home.jsp");
            HttpSession session = request.getSession(true);
            session.setAttribute("User_ID",email); 
            session.setAttribute("Object_ID",Seller_Validate.id.toString());
//            session.setAttribute("U_Image",Validate.U_Image);
            rs.include(request, response);
            
           }
         else
         {
           RequestDispatcher rs = request.getRequestDispatcher("Seller_Login.jsp");
           rs.include(request, response);
           out.print("<script>alert('Username or Password incorrect');</script>");
         }
    }  
    
        catch(IOException | ServletException e)
        {}
} }

