package seller;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.*;
import java.net.UnknownHostException;
import javax.servlet.http.HttpServlet;
import org.bson.types.ObjectId;



public class Seller_Validate extends HttpServlet
 {
    public static String st;
    public static String U_Name;
    public static String U_Image;
    public static ObjectId id;
  //================================================================================   
     public static boolean checkRegister(String email) throws UnknownHostException
     {
         boolean y=true;
      Mongo mg = new Mongo(Seller_Login.Database,27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection(Seller_Login.seller);
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Email").equals(email))
            {
                c--;
            }
            else
            {
                c++;
            }
            
        }
    }
    catch(Exception e){}
    finally{
        if(c==cnt)
        {
            y=false;
//%><center> Invalid User-Id Or Password<br><br><strong><a href="javascript:history.go(-1)">Try Again</a></strong></center> <%
        }
    }
    return y;
     }
   }
 //forgot pass
//=====================================================================================
     public static boolean checkEmail(String email) throws UnknownHostException
     {
         boolean y=true;
      Mongo mg = new Mongo(Seller_Login.Database,27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection(Seller_Login.seller);
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Email").equals(email))
            {
                c--;
                st=str.get("Password").toString();
            }
            else
            {
                c++;
            }
            
        }
    }
    catch(Exception e){}
    finally{
        if(c==cnt)
        {
            y=false;
//%><center> Invalid User-Id Or Password<br><br><strong><a href="javascript:history.go(-1)">Try Again</a></strong></center> <%
        }
    }
    return y;
     }
   }
//======================================================================================
     public static boolean checkUser(String email,String pass) throws UnknownHostException 
     {
      
       boolean x=true;
      Mongo mg = new Mongo(Seller_Login.Database,27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection(Seller_Login.seller);
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Email").equals(email) && str.get("Password").equals(pass))
            {
                c--;
                 U_Name=str.get("Full_Name").toString();
                 U_Image=str.get("Seller_dp").toString();
                   id = (ObjectId)str.get( "_id" ); 
                   
            }
            else if(str.get("Number").equals(email) && str.get("Password").equals(pass))
            {
                c--;
                U_Name=str.get("Full_Name").toString();
                U_Image=str.get("Seller_dp").toString();
                id = (ObjectId)str.get( "_id" ); 
                   
            }
            else
            {
                c++;
            }
            
        }
    }
    catch(Exception e)
    {}
    finally{
        if(c==cnt)
        {
            x=false;
//%><center> Invalid User-Id Or Password<br><br><strong><a href="javascript:history.go(-1)">Try Again</a></strong></center> <%
        }
    }
    return x;
     }
}
 //===================================================================================
     public static boolean checkProduct(String Product) throws UnknownHostException 
     {
       boolean x=false;
      Mongo mg = new Mongo(Seller_Login.Database,27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection(Seller_Login.Product_collection);
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Product_Name").equals(Product))
            {
                c--;  
            }
            else
            {
                c++;
            }
            
        }
    }
    catch(Exception e)
    {}
    finally{
        if(c==cnt)
        {
            x=true;
//%><center> Invalid User-Id Or Password<br><br><strong><a href="javascript:history.go(-1)">Try Again</a></strong></center> <%
        }
    }
    return x;
     }
}
  //===================================================
    public static boolean checkSKU(String SKU) throws UnknownHostException 
     {
       boolean x=false;
      Mongo mg = new Mongo(Seller_Login.Database,27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection(Seller_Login.Product_price_collection);
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("SKU").equals(SKU))
            {
                c--;  
            }
            else
            {
                c++;
            }
            
        }
    }
    catch(Exception e)
    {}
    finally{
        if(c==cnt)
        {
            x=true;
//%><center> Invalid User-Id Or Password<br><br><strong><a href="javascript:history.go(-1)">Try Again</a></strong></center> <%
        }
    }
    return x;
     }
} 
}
