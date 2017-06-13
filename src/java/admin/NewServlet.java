/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

/**
 *
 * @author baazaronline4
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        response.setContentType("application/json");
        PrintWriter out  = response.getWriter();
        
       String ip = getServletContext().getInitParameter("ip");
                     String cid = request.getParameter("cid");
                     String type = request.getParameter("type");
                     String name = request.getParameter("attibuteset");
                     System.out.println("...cid.=="+cid+"------type="+type+"---name====="+name);
                     String d = "d";
                     // cid="58de0ae4b25ece0ff88a023d";
                     String attributeset=null;
                     ArrayList<JSONObject> arra = new  ArrayList<>();
 
        try{
                   
            
            MongoClient mongoClient = new MongoClient( ip , 27017 );
                     DB db = mongoClient.getDB("baazaronline");
                     DBCollection collection = db.getCollection("categories");
                     BasicDBObject doc = new BasicDBObject("parentid", cid);
                     DBCursor cursor=collection.find(doc);
                     JSONObject json = new JSONObject();
                     ArrayList a = new  ArrayList();
              JSONObject responseDetailsJson = new JSONObject();
              JSONArray jsonArray = new JSONArray();
                    
                 if (cursor.hasNext()){
                         
                          int i = 0;  
                     while (cursor.hasNext()) {
                   
                     String s= cursor.next().toString();
                     System.out.println("this is all data"+s);
                     Object obj=JSONValue.parse(s); 
                     JSONObject jsonObject = (JSONObject) obj;
                     String pid =  (String) jsonObject.get("parentid");
                     //again convert in to json
                     Object js = jsonObject.get("_id");
                     JSONObject ll = (JSONObject)js;
                     String id= (String) ll.get("$oid");
                     String Name =  (String) jsonObject.get("Name");
                     json.put("more", "yes");
                     json.put("name", Name);
                     json.put("id", id);
                     a.add(jsonObject);
                         System.out.println("[{{{{{{{{{{{+++++++++++>>>>>????"+a);
                  
                  }
                       
                          responseDetailsJson.put("jsonArray", a);
                  
                    out.print(responseDetailsJson);
                       System.out.println("amit"+responseDetailsJson);
                     }else{
                    
                    responseDetailsJson.put("cid", cid);
                    responseDetailsJson.put("attributeset", name);
                  
                     out.print(responseDetailsJson);
                     }
        }catch(Exception e){
        
        }
    }
}
