<%-- 
    Document   : findSubcatagoury
    Created on : 31 Mar, 2017, 6:57:06 PM
    Author     : baazarteam5
--%>

<%@page import="javax.persistence.Id"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.Mongo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    
    <% 
       
                     String cid = request.getParameter("val");
                     // cid="58de0ae4b25ece0ff88a023d";
                      String attset = "";
              String ip = getServletContext().getInitParameter("ip");          
        try{
                     MongoClient mongoClient = new MongoClient( ip , 27017 );
                     DB db = mongoClient.getDB("baazaronline");
                     DBCollection collection = db.getCollection("categories");
                     BasicDBObject doc = new BasicDBObject("parentid", cid);
                     DBCursor cursor=collection.find(doc);
                    
                     
                     if (cursor.hasNext()) {
                             int i = 0;
    
                     while (cursor.hasNext()) {
                     System.out.println("data     "+cursor);
                  
                     String s= cursor.next().toString();
                     System.out.println("before"+s);
                     // creating json object for conver string values to json
               
                     Object obj=JSONValue.parse(s); 
                     JSONObject jsonObject = (JSONObject) obj;
                     System.out.println("this io json object"+jsonObject);
//                   getting values from  json to string
                     
                     String pid =  (String) jsonObject.get("parentid");
                    String  attrset =  (String) jsonObject.get("attributeSet");
                    attset = attrset;
                   
                     //again convert in to json
                     Object js = jsonObject.get("_id");
                     JSONObject ll = (JSONObject)js;
                     String id= (String) ll.get("$oid");
                     String Name =  (String) jsonObject.get("Name");
                    
    %>
                             
                    <li id="<%out.print(id);%>" onclick="sendInfo(this.id)" value="<%out.print(cid);%>"> <%out.print(Name);%> </li>
                  
                    <%
                                  
                            }

                         } else {

                       
 
%>
                 
                     <a href="FindAttributeSetForProduct?val=<%out.print(cid);%>&attset=<%=attset%>"><button id="<%out.print(cid);%>">Add product</button></a>
                     
 <%
                }

                                   

                   //  cursor = collection.find();
                      
                }     
            catch(Exception e) {
                     out.print(e);
                 
                   }
%>
</html>