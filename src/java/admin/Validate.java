package admin;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.*;
import java.net.UnknownHostException;
import javax.servlet.http.HttpServlet;
import org.bson.types.ObjectId;



public class Validate extends HttpServlet
 {
    public static String st;
    public static Object id;
 //================================================================================   
     public static boolean checkRegister(String email, String UserName) throws UnknownHostException
     {
         boolean y=true;
      Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("Admin_Details");
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Email").equals(email) || str.get("UserName").equals(UserName))
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
      Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("Admin_Details");
      BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Email").equals(email) || str.get("UserName").equals(email))
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
      Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("Admin_Details");
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
                
            }
            else if(str.get("UserName").equals(email) && str.get("Password").equals(pass))
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
            x=false;
//%><center> Invalid User-Id Or Password<br><br><strong><a href="javascript:history.go(-1)">Try Again</a></strong></center> <%
        }
    }
    return x;
     }
}

//=======================================================================================     
     
     public static boolean checkStatus(String email) throws UnknownHostException 
     {
        boolean z = false;
      Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("Admin_Details");
      BasicDBObject doc = new BasicDBObject();
      DBCursor cursor = collection.find();
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            String Status="Active";
            if(str.get("UserName").equals(email) && str.get("Status").equals(Status))
            {
                 id=(ObjectId)str.get("_id");
                z=true;
            }
            else if(str.get("Email").equals(email) && str.get("Status").equals(Status))
            {
                id=(ObjectId)str.get("_id");
              z=true;
            }          
        }
        
    return z;
     }
//=================================================================================
public static boolean check_Category_validation(String name){
       System.out.println(" inside validaton mathod"+name);
       boolean y=true;
         Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("categories");
     // BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("Name").equals(name))
            {
                
                c--;
                
            }
            else
            {
                c++;
            }
            
        }
    }
    
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
/////////////////////////////////////////////////////////////////////////
public static boolean check_Category_validation_by_id(String id){
       System.out.println(" inside validaton mathod"+id);
       boolean y=true;
         Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("categories");
     // BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("_id").equals(id))
            {
                
                c--;
                
            }
            else
            {
                c++;
            }
            
        }
    }
    
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
public static boolean check_Category_validation_by_d(String name,String id){
       System.out.println(" inside validaton mathod"+id);
       boolean y=true;
         Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("categories");
     // BasicDBObject doc = new BasicDBObject();
try (    DBCursor cursor = collection.find()) {
	
    int cnt=0, c=0;
    try {
        
        while(cursor.hasNext())
        {
            DBObject str= cursor.next();
            cnt++;
            if(str.get("_id").equals(new ObjectId(id)))     
            {
                
                continue;   
                
            }
            else
            {
                if(str.get("Name").equals(name))
               {
                c--;
               }
                else
                {
                c++;
                }
            }
            
        }
    }
    
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


}