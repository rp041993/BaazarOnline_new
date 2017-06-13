package admin;

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

/**
 *
 * @author baazarteam3
 */
@WebServlet(urlPatterns = {"/InputValidate"})
public class InputValidate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
           String ip = getServletContext().getInitParameter("ip");
            try
            {
        String UserName=request.getParameter("u_username");
        String Name = request.getParameter("u_name");
        String Admin_pass=request.getParameter("a_password");               
        String Pass = request.getParameter("u_password");
        String Confirm_Pass = request.getParameter("u_repassword");
        String Email = request.getParameter("u_email"); 
        String Gender = request.getParameter("u_gender");
        String Account=request.getParameter("u_account"); 
        String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
       
            if(UserName.equals("")||UserName.equals(null))
           {
           RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
           rs.forward(request, response);
           out.print("<script>alert('*All fields are mandetory');</script>");
           }
            else if(Name.equals("")||Name.equals(null))
           {
           RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
           rs.include(request, response);
           out.print("<script>alert('*All fields are mandetory');</script>");
           }
           
            else if(!Email.matches(EMAIL_REGEX))
            {
                RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
                rs.include(request, response);
                out.print("<script>alert('Invalid Email');</script>");
            } 
            else if(!Admin_pass.equals("Admin"))
           {
            RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
            rs.include(request, response);
            out.print("<script>alert('Invalid Admin Password');</script>");
           }
            
          
            
           else{
               
               RequestDispatcher rs = request.getRequestDispatcher("Registration");
               rs.include(request, response);
               }
            
            }
            catch(IOException | ServletException e)
            {}
        }
}
    

   
