package admin;


import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author baazarteam3
 */
public class logfile{
    public static void abc(String Uname,String type,String id1,String name){
        System.out.println("1234"+id1);
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
               Date date = new Date();
               Mongo mg = new Mongo("35.154.252.180",27017);
               DB db = mg.getDB("baazaronline");
               DBCollection collection = db.getCollection("log");
               DBObject doc1 = new BasicDBObject();
               DBObject fieldtype = new BasicDBObject("Type" , type);
               DBObject fieldname = new BasicDBObject("id1", id1);
               BasicDBList Or = new BasicDBList();
                Or.add(fieldtype);
                Or.add(fieldname);
                DBObject doc = new BasicDBObject("$and", Or);
                DBCursor cursor=collection.find(doc);
                
//            if   else condition for insert and update   
                if(cursor.count() == 1)
                { 
                BasicDBObject updatefield=new BasicDBObject();
                updatefield.append("updatedOn", sdf.format(date));
                updatefield.append("updatedBy", Uname);
                BasicDBObject setQuery =new BasicDBObject();
                setQuery.append("$set",updatefield);
                collection.update(doc, setQuery);
                mg.close();
                }
                else{
                    
               doc1.put("createdBy", Uname);
               doc1.put("Type", type);
               doc1.put("id1", id1);
               doc1.put("Name", name);
               doc1.put("createdOn", sdf.format(date));
               doc1.put("updatedOn", "");
               doc1.put("updatedBy", "");
               collection.insert(doc1);
                mg.close();
                }
}}
















