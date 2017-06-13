package admin;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;

@WebServlet(urlPatterns = {"/Categorysubmit1"})
public class Categorysubmit1 extends HttpServlet {
    
  
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException {
        
         
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(true);  
        String session_UID=(String)session.getAttribute("User_ID");
       String ip = getServletContext().getInitParameter("ip"); 
        Mongo mg = new Mongo(ip,27017);
               DB db = mg.getDB("baazaronline");
               DBCollection collection = db.getCollection("categories");
               BasicDBObject doc = new BasicDBObject(); 
               File f = new File("DBDriverInfo.properties");
               System.out.println(f.getAbsolutePath()); 
               String filepath= getServletContext().getRealPath("/img/catelog_image");
               MultipartRequest m=new MultipartRequest(request,filepath); 
               String button = m.getParameter("Save_category");
               String parentid = m.getParameter("parentid");
        
               String webstore = m.getParameter("web_store");
               String name = m.getParameter("name");
               String isActive = m.getParameter("isActive");
               String urlKey   =m.getParameter("urlKey");
               String file= m.getFilesystemName("file");
               String pageTitle = m.getParameter("pageTitle");
               String metaKeywords = m.getParameter("metaKeywords");
               String metaDiscription = m.getParameter("metaDiscription");
               String nevigationMenu = m.getParameter("nevigationMenu");
               String attributeSet = m.getParameter("attributeSet");
               String available_product_listing_sort_by[] = m.getParameterValues("available_product_listing_sort_by");
    
               if(available_product_listing_sort_by != null)
              {
                for(int i=0; i<available_product_listing_sort_by.length; i++)
                  {
                        System.out.print(available_product_listing_sort_by[i]);

                   }

               }
        if(button.equals("Save_category"))
          {
                System.out.println("save category");
                if(   !Validate.check_Category_validation(name))
            {
                    doc.put("parentid", "null");
                    doc.put("webstore",webstore);
                    doc.put("Name",name);
                    doc.put("isActive",isActive);
                    doc.put("urlKey", urlKey);
                    doc.put("Image",file);
                    doc.put("pageTitle",pageTitle);
                    doc.put("metaKeywords",metaKeywords);
                    doc.put("metaDiscription",metaDiscription);
                    doc.put("nevigationMenu",nevigationMenu);
                    doc.put("available_product_listing_sort_by",available_product_listing_sort_by);
                    doc.put("attributeSet",attributeSet);
               //            BasicDBList basic=new BasicDBList();
               //            basic.add(new BasicDBObject("Name","").append("isActive", "").append("Image", "").append("pageTitle", "").append("metaKeywords", "").append("metaDiscription", "").append("nevigationMenu", "").append("available_product_listing_sort_by", "").append("attriobuteSet", ""));
               //            doc.put("subcat",basic);
                      collection.insert(doc);
                      ObjectId categoryId = (ObjectId)doc.get("_id");
                      String objId=categoryId.toString();
                      mg.close();

                      RequestDispatcher rd=request.getRequestDispatcher("Category_form.jsp");
                      rd.include(request, response);
                      out.print("<script>alert('Category inserted Successfully');</script>");

                      logfile.abc(session_UID,"category",objId,name);
               }
                
               else
                    {
                      RequestDispatcher rd=request.getRequestDispatcher("Category_form.jsp");
                      rd.include(request, response);
                      out.print("<script>alert('category name must be different');</script>");
            
                    }
       
               }
        else if(button.equals("update"))
            
                {
                    if(   Validate.check_Category_validation_by_d(name,parentid))
                    {
                 System.out.println("update");
                 BasicDBObject doc1=new BasicDBObject("_id",new ObjectId(parentid));
                 BasicDBObject updatefield=new BasicDBObject();
                 DBCursor cursor=collection.find(doc1);
                  String objId="";
                  while(cursor.hasNext())
                  {
                       DBObject str=cursor.next(); 
                       ObjectId  categoryId   =(ObjectId)str.get("_id");
                       System.out.println("12121213"+categoryId);  
                       objId= categoryId.toString();
                  }
            
                    updatefield.append("Name", name);
                    updatefield.append("webstore",webstore);
                    updatefield.append("isActive", isActive);
                    updatefield.append("Image", file);
                    updatefield.append("urlKey", urlKey);
                    updatefield.append("pageTitle", pageTitle);
                    updatefield.append("metaKeywords", metaKeywords);
                    updatefield.append("metaDiscription", metaDiscription);
                    updatefield.append("nevigationMenu", nevigationMenu);
                    updatefield.append("available_product_listing_sort_by", available_product_listing_sort_by);
                    updatefield.append("attributeSet",attributeSet);
                    BasicDBObject setQuery =new BasicDBObject();
                    setQuery.append("$set",updatefield);
                    collection.update(doc1, setQuery);
                    logfile.abc(session_UID,"category",objId,name);
                    mg.close();
            
                    RequestDispatcher rd=request.getRequestDispatcher("Category_form.jsp");
                    rd.include(request, response);
                    out.print("<script>alert('Category updated Successfully');</script>");
                   
                    }
                    else
                        {
                      RequestDispatcher rd=request.getRequestDispatcher("Category_form.jsp");
                      rd.include(request, response);
                      out.print("<script>alert('category name must be different');</script>");
            
                         }
              }
           
        else if(button.equals("Save subcategory"))
        {
            System.out.println("sdfgsg");
             if(   !Validate.check_Category_validation(name))
            {
                    doc.put("parentid", parentid);
                    doc.put("webstore",webstore);
                    doc.put("Name",name);
                    doc.put("isActive",isActive);
                    doc.put("urlKey", urlKey);
                    doc.put("Image",file);
                    doc.put("pageTitle",pageTitle);
                    doc.put("metaKeywords",metaKeywords);
                    doc.put("metaDiscription",metaDiscription);
                    doc.put("nevigationMenu",nevigationMenu);
                    doc.put("available_product_listing_sort_by",available_product_listing_sort_by);
                    doc.put("attributeSet",attributeSet);
               //            BasicDBList basic=new BasicDBList();
               //            basic.add(new BasicDBObject("Name","").append("isActive", "").append("Image", "").append("pageTitle", "").append("metaKeywords", "").append("metaDiscription", "").append("nevigationMenu", "").append("available_product_listing_sort_by", "").append("attriobuteSet", ""));
               //            doc.put("subcat",basic);
                      collection.insert(doc);
                      ObjectId categoryId = (ObjectId)doc.get("_id");
                      String objId=categoryId.toString();
                      mg.close();

                      RequestDispatcher rd=request.getRequestDispatcher("Category_form.jsp");
                      rd.include(request, response);
                      out.print("<script>alert('Subcategory inserted Successfully');</script>");

                      logfile.abc(session_UID,"category",objId,name);
               }
                
               else
                    {
                      RequestDispatcher rd=request.getRequestDispatcher("Category_form.jsp");
                      rd.include(request, response);
                      out.print("<script>alert('category name must be different');</script>");
            
                    }
       
        }
        }
         

 
  }

   


            
            
            
            
        
    

  