package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
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
 * @author baazarteam1
 */
@WebServlet(urlPatterns = {"/Registration"})
public class Registration extends HttpServlet {

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
	try{
            HttpSession session=request.getSession(true);  
        String session_UID=(String)session.getAttribute("User_ID");
        String UserName=request.getParameter("u_username");
        String Name = request.getParameter("u_name");
        String Admin_pass=request.getParameter("a_password");               
        String Pass = request.getParameter("u_password");
        String Confirm_Pass = request.getParameter("u_repassword");
        String Email = request.getParameter("u_email"); 
        String Gender = request.getParameter("u_gender");
        String Account=request.getParameter("u_account"); 
        String select[] = request.getParameterValues("role"); 
               
              String ip = getServletContext().getInitParameter("ip");
        
        if(!Confirm_Pass.equals(Pass))
           {
               RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
               rs.include(request, response);
               out.print("<script>alert('Password not Matched');</script>");
           }
        else{
            
            if(Validate.checkRegister(Email,UserName))
            {
                RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
                rs.include(request, response);
                out.print("<script>alert('User Already Exists');</script>");out.print("<script>alert('*All fields are mandetory');</script>");
            }
            else
            {
                Mongo mg = new Mongo(ip,27017);
                DB db = mg.getDB("Register1");
                DBCollection collection = db.getCollection("reg");
                BasicDBObject doc = new BasicDBObject();
                DBCursor cursor = collection.find();
                doc.put("UserName",UserName);
                doc.put("First_Name",Name);
                doc.put("Email",Email);
                doc.put("Password",Pass);
                doc.put("Gender",Gender);
                doc.put("Status",Account);
BasicDBList db1 = new BasicDBList();
for(int i=0;i<select.length;i++)
{
db1.add(new BasicDBObject("id",i).append("Roles", select[i]));
doc.put("role",db1);
}
                
                collection.insert(doc);
                mg.close();
                String objId = (String)doc.get("_id").toString();
                
                RequestDispatcher rs = request.getRequestDispatcher("Registration.jsp");
                rs.include(request, response);
                out.print("<script>alert('Registration Successfull');</script>");
                logfile.abc(session_UID, "user", objId,UserName);
            }
            
        }
    }
        catch(IOException | ServletException e)
        {}
}}

            
            
            
            
        
    

  