package admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author baazarteam4
 * 
 */

public class CheckAtt {
    
//    public static void main(String[] args) {
//        System.out.println(" i am in main method i am just callin_checkattribute _method");
//       CheckAtt.checkAttributeSet("fashion");
//    }
      public static boolean checkAttribute(String name)
     {  
          System.out.println("in check atribute class"+name);
         boolean y=true;
        
         Mongo mg = new Mongo("35.154.252.180",27017);
      DB db = mg.getDB("baazaronline");
      DBCollection collection = db.getCollection("Attribute");
      BasicDBObject doc = new BasicDBObject("Attribute","Attribute");
try (    DBCursor cursor = collection.find(doc)) {
	
    
    try {
        
        while(cursor.hasNext())
        {  System.out.println("in while loop "+name);
            DBObject str= cursor.next();
            System.out.println("fsdfsdf   "+str);
           
            System.out.println("attcode for testing "+str.get("attcode"));
            if(str.get("attcode").equals(name) )
              {
                 y =false;   
                  System.out.println("conditon is true");
               }
          }
            }
   
    
    finally{ 
             System.out.println("y value"+y);
              return y;         
           }
   
    }
    
     }
          
public static boolean checkAttributeSet(String name){  
     boolean y=true;
        
               
          MongoClient client = new MongoClient("35.154.252.180" , 27017);
          MongoDatabase database = client.getDatabase("baazaronline");
          MongoCollection<Document> collection = database .getCollection("Attribute");
          BasicDBObject doc = new BasicDBObject("attset", "AttributeSet");
            
            List<Document> attributeSet = (List<Document>) collection.find(doc).into(new ArrayList<Document>());
            System.out.println("emolyee"+attributeSet);
                 
              for (Document attribure : attributeSet) {
                     Object ss =  attribure.get("Name");
                      String names =ss.toString();
                      if (ss.equals(name)) {
                      y = false;
                  }
                     List<Document> value = (List<Document>) attribure.get("Attributes");
                     System.out.println("name  "+names +"    valuese"+value);
    } 

    System.out.println("a)))))))))))))))))))))))))))))"+y);
    
    
    return y;
     }   



}

          
   