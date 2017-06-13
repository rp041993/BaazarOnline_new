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
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author baazarteam2
 */
@WebServlet(urlPatterns = {"/UpdateUser"})
public class UpdateUser extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String UserName=request.getParameter("u_username");
            String NewUserName=request.getParameter("u_newusername");
            String Name=request.getParameter("u_name");
            String NewPass=request.getParameter("u_newpassword");
            String NewEmail=request.getParameter("u_email");
            String NewGender=request.getParameter("u_gender");
            String NewStatus=request.getParameter("u_account");
            String AdminPass=request.getParameter("a_password");
            String []Role=request.getParameterValues("role");
            
            if(Validate.checkEmail(UserName))//If userName Exist
             {
                if(AdminPass.equals("Admin"))
                 {
                String ip = getServletContext().getInitParameter("ip");
                    Mongo mg = new Mongo(ip,27017);
                    DB db = mg.getDB("baazaronline");
                    DBCollection collection = db.getCollection("Admin_Details");
                    BasicDBObject doc = new BasicDBObject("UserName", UserName);
                    String Button=request.getParameter("Button");
                    DBCursor cursor = collection.find(doc);
                     if("Delete".equals(Button))
                      {
                        collection.remove(doc);
                        mg.close();
                        RequestDispatcher rs = request.getRequestDispatcher("UserView.jsp");
                        rs.include(request, response);
                        out.print("<script>alert('User Deleted');</script>");
                      }
                     else
                      {
                        BasicDBObject updateFields = new BasicDBObject();
                        updateFields.append("UserName", NewUserName);
                        updateFields.append("First_Name", Name);
                        updateFields.append("Email", NewEmail);
                        updateFields.append("Password", NewPass);
                        updateFields.append("Gender", NewGender);
                        updateFields.append("Status", NewStatus);
                 
                        BasicDBList db1 = new BasicDBList();
                        for(int i=0;i<Role.length;i++)
                        {
                        db1.add(new BasicDBObject("id",i).append("Roles", Role[i]));
                        updateFields.append("role",db1);
                        }
                        BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(doc, setQuery);
                

                        mg.close();
                        RequestDispatcher rs = request.getRequestDispatcher("UserView.jsp");
                        rs.include(request, response);
                        out.print("<script>alert('Updated Successfully');</script>");
                     }
                 }
                else
                 {
                        RequestDispatcher rs = request.getRequestDispatcher("UserView.jsp");
                        rs.include(request, response);
                        out.print("<script>alert('Invalid Admin Password');</script>");
                 }
             }
            else
             {
                RequestDispatcher rs = request.getRequestDispatcher("UserView.jsp");
                rs.include(request, response);
                out.print("<script>alert('Invalid UserName');</script>");
             }
     }           
    catch(Exception e){}
   }
}
