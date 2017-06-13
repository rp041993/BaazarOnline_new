package seller;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.oreilly.servlet.MultipartRequest;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Update_personal_image"})
public class Update_personal_image extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
            BufferedImage bufferedImage;

           String New_img_name="";
           File f=new File("DBDriverInfo.properties;");
 
           String root = getServletContext().getRealPath("/");
//            String root=root1.replace("/build/web/", "/web/");
           
              File path = new File(root + "/img/Seller/Seller_Details/"+Seller_Validate.id);
              if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }
           String filepath=(root+"/img/Seller/Seller_Details/"+Seller_Validate.id);
           MultipartRequest m=new MultipartRequest(request, filepath);
           String User_ID=m.getParameter("u_num1");
           String Seller_dp= m.getFilesystemName("file");
           String Seller_id=m.getParameter("u_id1");
           if(Seller_dp!=null)
           {
           System.out.print(Seller_dp);
                String split[]= Seller_dp.split("\\.");
               
               New_img_name = Seller_id+".jpg";
               System.out.print(New_img_name);
         bufferedImage = ImageIO.read(new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id+"/"+Seller_dp)));

	//   create a blank, RGB, same width and height, and a white background
	  BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
			bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
	  newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
          File outputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(New_img_name));
	  // write to jpeg file
          
	  ImageIO.write(newBufferedImage, "jpg", outputfile);


	  System.out.println("Done");
           File inputfile = new File((root+"/img/Seller/Seller_Details/"+Seller_Validate.id).concat("/").concat(Seller_dp));
          inputfile.delete();
          
          Mongo mg = new Mongo(Seller_Login.Database,27017);
                DB db = mg.getDB("baazaronline");
                DBCollection collection = db.getCollection(Seller_Login.seller);
                
            DBObject byNumber = new BasicDBObject("Number", User_ID);  
            DBObject byEmail = new BasicDBObject("Email", User_ID);    
            BasicDBList Or = new BasicDBList();
            Or.add(byNumber);
            Or.add(byEmail);
            DBObject doc = new BasicDBObject("$or", Or);
            //////////////////////////////////////////////////////////////
                
            
            
                BasicDBObject updateFields = new BasicDBObject();
                updateFields.append("Seller_dp", New_img_name);
                
                BasicDBObject setQuery = new BasicDBObject();
                        setQuery.append("$set", updateFields);
                        collection.update(doc, setQuery);
                        mg.close();    
                RequestDispatcher rs = request.getRequestDispatcher("Seller_Profile.jsp");
                rs.include(request, response);
                out.print("<script>alert('Image Updated Successfully');</script>");
                
        }
           else
           {
               RequestDispatcher rs = request.getRequestDispatcher("Seller_Profile.jsp");
                rs.include(request, response);
                
           }
        }
        catch(Exception e)
        {
                RequestDispatcher rs = request.getRequestDispatcher("Seller_Profile.jsp");
                rs.include(request, response);
                out.print("<script>alert('Image size should be less than 1MB');</script>");
        }
    }

   
}
