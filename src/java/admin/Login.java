package admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Login extends HttpServlet {

    public static String User_ID;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String ip = getServletContext().getInitParameter("ip");
        PrintWriter out = response.getWriter();
        try
        {
        String email = request.getParameter("login_name");
        String pass = request.getParameter("login_password");
        if(email.equals("")||email.equals(null))
        {
        
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response); 
           out.print("<script>alert('*All fields are mandetory');</script>");
        }
        else if(pass.equals("")||pass.equals(null))
        {
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response); 
           out.print("<script>alert('*All fields are mandetory');</script>");
        }
        else if(email.equals("Admin") && pass.equals("Admin"))
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("User_ID",email); 
            session.setAttribute("User_Object_ID","Admin");
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request, response);
        }
        else
        {
          if(Validate.checkUser(email, pass))
          {
            if(Validate.checkStatus(email))
           {
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            HttpSession session = request.getSession(true);
            session.setAttribute("User_Object_ID",Validate.id); 
            session.setAttribute("User_ID",email); 
            rs.forward(request, response);
            
           }
           else
           {   
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response);
           out.print("<script>alert('Your account is not Active please contact to Admin');</script>");
           }
         }
         else
         {
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response);
           out.print("<script>alert('Username or Password incorrect');</script>");
         }
    }  
    }
        catch(IOException | ServletException e)
        {}
} }

        