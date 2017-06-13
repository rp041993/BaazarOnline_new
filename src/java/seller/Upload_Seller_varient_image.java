package seller;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.awt.Color;
import java.awt.Graphics2D;
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


@WebServlet(urlPatterns = {"/Upload_Seller_varient_image"})
public class Upload_Seller_varient_image extends HttpServlet {
        private static final int IMG_WIDTH = 400;
	private static final int IMG_HEIGHT = 538;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
                       BufferedImage bufferedImage;
            HttpSession session = request.getSession(true);
            String User_Object_ID=(String)session.getAttribute("Object_ID");
            
           
            String Product_ID=(String)session.getAttribute("c_varient_id");
            String New_Image=Product_ID+".jpg";
            System.out.print("66666666666666666666666666"+Product_ID);
             Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection = db.getCollection(Seller_Login.Product_collection);
                
            DBObject byID = new BasicDBObject("_id", new ObjectId(Product_ID));  
            DBObject byUser_ID = new BasicDBObject("User_Object_ID", User_Object_ID);    
            BasicDBList Or = new BasicDBList();
            Or.add(byID);
            Or.add(byUser_ID);
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
//                        String root=root1.replace("/build/web/", "/web/");
                        File path = new File(root + "/img/product/"+Seller_Validate.id+"/Origional");
                        File Thumb_path=new File(root + "/img/product/"+Seller_Validate.id+"/Thumbnil");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }
                        if (!Thumb_path.exists()) {
                            boolean status = Thumb_path.mkdirs();
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
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/product/"+Seller_Validate.id+"/Origional/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);
                                //  Thumbnil image
                               BufferedImage originalImage = ImageIO.read(new File(outputfile.toString()));
		               int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
                                BufferedImage resizeImageJpg = resizeImage(originalImage, type);
		               ImageIO.write(resizeImageJpg, "jpg", new File(root+"/img/product/"+Seller_Validate.id+"/Thumbnil/"+New_img_name));    
                                

                               System.out.println("Done");
                                File inputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(fileName));
                               inputfile.delete();
                                BasicDBObject updateFields = new BasicDBObject();
                                updateFields.append("First_image", New_img_name);

                                BasicDBObject setQuery = new BasicDBObject();
                                        setQuery.append("$set", updateFields);
                                        collection.update(doc, setQuery);
                           }
                                ///////////////////////////////////////////////////////////////////////////////////////
                              if(i==1)
                           if(s1=="T")
                           {
                               String New_img_name = Product_ID+"Second"+".jpg";
                               System.out.print(New_img_name);
                              bufferedImage = ImageIO.read(new File((root+"/img/product/"+Seller_Validate.id+"/Origional/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);
                                //  Thumbnil image
                               BufferedImage originalImage = ImageIO.read(new File(outputfile.toString()));
		               int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
                                BufferedImage resizeImageJpg = resizeImage(originalImage, type);
		               ImageIO.write(resizeImageJpg, "jpg", new File(root+"/img/product/"+Seller_Validate.id+"/Thumbnil/"+New_img_name));    
                                

                               System.out.println("Done");
                                File inputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(fileName));
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
                              bufferedImage = ImageIO.read(new File((root+"/img/product/"+Seller_Validate.id+"/Origional/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);
                                //  Thumbnil image
                               BufferedImage originalImage = ImageIO.read(new File(outputfile.toString()));
		               int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
                                BufferedImage resizeImageJpg = resizeImage(originalImage, type);
		               ImageIO.write(resizeImageJpg, "jpg", new File(root+"/img/product/"+Seller_Validate.id+"/Thumbnil/"+New_img_name));    
                                

                               System.out.println("Done");
                                File inputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(fileName));
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
                              bufferedImage = ImageIO.read(new File((root+"/img/product/"+Seller_Validate.id+"/Origional/"+fileName)));

                             //   create a blank, RGB, same width and height, and a white background
                               BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                                             bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                               newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
                               File outputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(New_img_name));
                               // write to jpeg file

                               ImageIO.write(newBufferedImage, "jpg", outputfile);
                                //  Thumbnil image
                               BufferedImage originalImage = ImageIO.read(new File(outputfile.toString()));
		               int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
                                BufferedImage resizeImageJpg = resizeImage(originalImage, type);
		               ImageIO.write(resizeImageJpg, "jpg", new File(root+"/img/product/"+Seller_Validate.id+"/Thumbnil/"+New_img_name));    
                                

                               System.out.println("Done");
                                File inputfile = new File((root+"/img/product/"+Seller_Validate.id).concat("/Origional/").concat(fileName));
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
        session.setAttribute("c_varient_id","");
        mg.close();
                RequestDispatcher rs = request.getRequestDispatcher("Select_category_for_show_product.jsp");
                rs.include(request, response);
                out.print("<script>alert('Varient Uploded Successfully');</script>");
        }
        catch(Exception e)
        {
                RequestDispatcher rs = request.getRequestDispatcher("Upload_product_image.jsp");
                rs.include(request, response);
                out.print("<script>alert('Image size should be less than 1MB');</script>");
        }
        
    }
       private static BufferedImage resizeImage(BufferedImage originalImage, int type){
	BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
	Graphics2D g = resizedImage.createGraphics();
	g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
	g.dispose();

	return resizedImage;
       }
}
