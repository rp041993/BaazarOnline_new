package seller;
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


@WebServlet(name = "Attachments", urlPatterns = {"/Attachments"})
public class Attachments extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
            BufferedImage bufferedImage;
            HttpSession session = request.getSession(true);
            String User_ID=(String)session.getAttribute("User_ID");
            
           
            String Object_ID=(String) session.getAttribute("Object_ID"); 
            String New_Image=Object_ID+".jpg";
            Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection = db.getCollection(Seller_Login.seller);
                
            DBObject byNumber = new BasicDBObject("Number", User_ID);  
            DBObject byEmail = new BasicDBObject("Email", User_ID);    
            BasicDBList Or = new BasicDBList();
            Or.add(byNumber);
            Or.add(byEmail);
            DBObject doc = new BasicDBObject("$or", Or);
            
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
                        //String root=root1.replace("/build/web/", "/web/");
                        File path = new File(root + "/img/Seller/Seller_Details/"+Seller_Validate.id);
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
                               String New_img_name = Object_ID+"_PAN"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("PAN_Proof", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }
                                ///////////////////////////////////////////////////////////////////////////////////////
                              if(i==1)
                           if(s1=="T")
                           {
                               String New_img_name = Object_ID+"_VAT"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("VAT_Proof", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }   
                              /////////////////////////////////////////////////////////////////////////////////////////////
                           if(i==2)
                           if(s1=="T")
                           {
                               String New_img_name = Object_ID+"_CST"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("CST_Proof", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }   
                           if(i==3)
                           if(s1=="T")
                           {
                               String New_img_name = Object_ID+"_GUMASTA"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("GUMASTA_Proof", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }   
                           if(i==4)
                           if(s1=="T")
                           {
                               String New_img_name = Object_ID+"_KYC"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("KYC_Proof", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }
                           
                           if(i==5)
                           if(s1=="T")
                           {
                               String New_img_name = Object_ID+"_ID"+".jpg";
                               System.out.print(New_img_name);
                               
                              bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
                               // write to jpeg file
                                System.out.print(outputfile);
                               ImageIO.write(newBufferedImage, "jpg", outputfile);


                               System.out.println("Done");
                                File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("ID_Proof", New_img_name);
                                //updateFields.append("ID_type", );
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
        RequestDispatcher rs = request.getRequestDispatcher("Attachments.jsp");
                rs.include(request, response);
                out.print("<script>alert('Image Updated Successfully');</script>");
        }
        catch(Exception e)
        {
                RequestDispatcher rs = request.getRequestDispatcher("Attachments.jsp");
                rs.include(request, response);
                out.print("<script>alert('Image size should be less than 1MB');</script>");
        }
        
    }

   

}
