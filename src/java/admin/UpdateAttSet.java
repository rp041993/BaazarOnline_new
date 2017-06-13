package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.sun.org.apache.xpath.internal.axes.HasPositionalPredChecker.check;
import static com.sun.tools.xjc.reader.xmlschema.parser.SchemaConstraintChecker.check;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author baazarteam4
 */
@WebServlet(name = "UpdateAttSet", urlPatterns = {"/UpdateAttSet"})
public class UpdateAttSet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
         PrintWriter out = response.getWriter();
        String ip = getServletContext().getInitParameter("ip");
       
        String name = request.getParameter("name");
        System.out.println("name    "+name);
        
          //     String  check = request.getParameter("multiple");

             String [] check =request.getParameterValues("multiple");
              
             ArrayList<String> ar = new ArrayList<String>();
//String s1 ="Test1";
//String s2 ="Test2";
//String s3 ="Test3";
//String s4 ="Test34";
//ar.add(s1);
//ar.add(s2);
//ar.add(s3);
//ar.add(s4);   
          try {
                for (int i = 0; i < check.length; i++) {
                      ar.add(check[i]);
              System.out.println("ram JI  "+check[i]);
          }    
 
                 
            } catch (Exception e) {
    
               out.print("<h1>"+e+"</h1>");
            }
 
              for (int i = 0; i < 10; i++) {
            
        }
       



        try {
            	MongoClient client = new MongoClient(ip, 27017);
		MongoDatabase database = client.getDatabase("baazaronline");
		MongoCollection<Document> collection = database
				.getCollection("Attribute");
 
		Bson filter = new Document("Name", name);
		Bson newValue = new Document("Attributes",ar).append("Name", name);
		Bson updateOperationDocument = new Document("$set", newValue);
		collection.updateOne(filter, updateOperationDocument);
     out.print("<script>alert('success'); location='CreateAttributeSet.jsp'</script>"); 
		client.close();
       
        } catch (Exception e) {
        
        out.println("<script>alert('faild')</script>"+e);
        
        }
 
	
        
    }
    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
