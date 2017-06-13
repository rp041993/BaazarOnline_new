package admin;


import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.bson.types.ObjectId;

@WebServlet(urlPatterns = {"/Upload_product_image"})
public class Upload_product_image extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String ip = getServletContext().getInitParameter("ip");
        try{
            /* TODO output your page here. You may use following sample code. */
            BufferedImage bufferedImage;
            HttpSession session = request.getSession(true);
            String User_Object_ID=(String)session.getAttribute("User_Object_ID");
            System.out.print(User_Object_ID);
           
                String Product_ID=SaveProduct.c_p_id;
                String New_Image=Product_ID+".jpg";
                System.out.print("66666666666666666666666666"+Product_ID);
                Mongo mg = new Mongo(ip,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection = db.getCollection("products");
                
            DBObject byID = new BasicDBObject("_id", new ObjectId(Product_ID));  
            DBObject byUser_ID = new BasicDBObject("User_Object_ID", User_Object_ID);    
            BasicDBList Or = new BasicDBList();
            Or.add(byID);
           // Or.add(byUser_ID);
            DBObject doc = new BasicDBObject("$and", Or);
            
            ////////////////////////////////////////////////////////////////////
            
             boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            
            try {
                List items = upload.parseRequest(request);
              String s1="";
                Iterator iterator = items.iterator();
                int i=0;
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        String root = getServletContext().getRealPath("/");
                        File path = new File(root + "/img/product/");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }
                        
                        if(!fileName.equals("")){
                            s1="T";
                            File uploadedFile = new File(path + "/" + fileName);
                            System.out.println(uploadedFile.getAbsolutePath());
                            item.write(uploadedFile);
                        }
                        else{
                            s1="F";
                        }
                                if(i==0)
                           if(s1=="T")
                           {
                               String New_img_name = Product_ID+"First"+".jpg";
                               System.out.print("thisisisssisisisisisis"+New_img_name);
                              bufferedImage = ImageIO.read(new File(getServletContext().getRealPath("/img/Admin/Admin_Product/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(New_img_name));
                                System.out.println("ye shahat he amon ka    "+outputfile);
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(fileName));
                                
                                 inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("First_image", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        System.out.println("hello hi how are you "+doc+"nothig is going "+setQuery);
                                        collection.update(doc, setQuery);
                                        
                           }
                                ///////////////////////////////////////////////////////////////////////////////////////
                              if(i==1)
                           if(s1=="T")
                           {
                               String New_img_name = Product_ID+"Second"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File(getServletContext().getRealPath("/img/Admin/Admin_Product"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("Second_image", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }   
                              /////////////////////////////////////////////////////////////////////////////////////////////
                           if(i==2)
                           if(s1=="T")
                           {
                               String New_img_name = Product_ID+"Third_image"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File(getServletContext().getRealPath("/img/Admin/Admin_Product"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("Third_image", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }   
                           if(i==3)
                           if(s1=="T")
                           {
                               String New_img_name = Product_ID+"Fourth_image"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File(getServletContext().getRealPath("/img/Admin/Admin_Product"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File(getServletContext().getRealPath("/img/Admin/Admin_Product").concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("Fourth_image", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }
                           }i++;
                    }
              
        }
        
             catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
    }
        mg.close();
                RequestDispatcher rs = request.getRequestDispatcher("Show_Products.jsp");
                rs.include(request, response);
                out.print("<script>alert('Product Uploded Successfully');</script>");
        }
        catch(Exception e)
        {
                RequestDispatcher rs = request.getRequestDispatcher("Upload_product_image.jsp");
                rs.include(request, response);
                out.print("<script>alert('Image size should be less than 1MB');</script>");
        }
  }
}