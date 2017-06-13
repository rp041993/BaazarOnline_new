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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.Document;

/**
 *
 * @author baazarteam2
 */
@WebServlet(urlPatterns = {"/Role"})
public class Role extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String ip = getServletContext().getInitParameter("ip");
            try {
                String Page = request.getParameter("Page");
                 
                HttpSession session = request.getSession(true);
                String email = (String) session.getAttribute("User_ID");
          

                // ##############################################################
                MongoClient client = new MongoClient(ip, 27017);
                MongoDatabase database = client.getDatabase("baazaronline");
                MongoCollection<Document> collection = database
                        .getCollection("Admin_Details");
                
                
                if (email.equals("Admin")) {
                    RequestDispatcher rs = request.getRequestDispatcher(Page.toString());
                    rs.forward(request, response);
                } else {
                    List<Document> employees = (List<Document>) collection.find().into(
                            new ArrayList<Document>());
                    ArrayList<String> s = new ArrayList<String>();
                    for (Document employee : employees) {
                        if(employee.get("Email").equals(email) || employee.get("UserName").equals(email))
                        {
                        List<Document> courses = (List<Document>) employee.get("role");
                        //////////////////////////////////////
                        for (Document course : courses) {
                          String a=course.getString("Roles");
                          s.add(a);
                        }
                        System.out.print(s);
                        if (s.contains(Page)) {
                            RequestDispatcher rs = request.getRequestDispatcher(Page.toString());
                            rs.forward(request, response);
                        } else {
                            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                            rs.include(request, response);
                            out.print("<script>alert('Permission Denied');</script>");
                        }}
                    }
                }
            } catch (IOException | ServletException e) {
            }
        }
    }
}
