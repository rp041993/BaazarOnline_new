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
import java.net.UnknownHostException;

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
public class CheckPin {

   
    public static boolean checkPincode(String name) {
        System.out.println("in check pincode class" + name);
        boolean y = true;

        Mongo mg = new Mongo("35.154.252.180", 27017);
        DB db = mg.getDB("collections");
        DBCollection collection = db.getCollection("code");
        BasicDBObject doc = new BasicDBObject("Code",name);
        try (DBCursor cursor = collection.find(doc)) 
                
        {

            int cnt = 0, c = 0;
            try {

                while (cursor.hasNext()) {
                    System.out.println("in while loop " + name);
                    DBObject str = cursor.next();
                    System.out.println("fsdfsdf   " + str);
                    cnt++;
                    System.out.println("pincode for testing " + str.get("Code"));
                    if (str.get("Code").equals(name)) {
                        y = false;
                        System.out.println("conditon is true");
                          }
                }
            }
            finally {
                System.out.println(" conditions is false y value  " + y);
                return y;
            }

        }

    }

    public static boolean checkPincodeSet(String name) {
     
        boolean y = true;

        Mongo mg = new Mongo("Localhost", 27017);
        DB db = mg.getDB("demo");
        DBCollection collection = db.getCollection("pinnumber");
        BasicDBObject doc = new BasicDBObject();
        try (DBCursor cursor = collection.find(doc)) {

            int cnt = 0, c = 0;
            try {

                while (cursor.hasNext()) {
                    System.out.println("in while loop " + name);
                    DBObject str = cursor.next();
                    System.out.println("fsdfsdf   " + str);
                    cnt++;
                    System.out.println("pincode for testing " + str.get("Code"));
                    if (str.get("Code").equals(name)){
                        y = false;
                        System.out.println("conditon is true");
                    }
                }
            } finally {
                System.out.println("y value   " + y);
                return y;
            }

        }

    }

}
