<%-- 
    Document   : selectSubCatagory
    Created on : 25 Apr, 2017, 4:30:36 PM
    Author     : baazaronline4
--%>


<%@page import="org.bson.types.ObjectId"%>
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
        

       
       String ip = getServletContext().getInitParameter("ip");
                     String cid = request.getParameter("val");
                     String type = request.getParameter("type");
                     String name = request.getParameter("name");
                     System.out.println("...cid.=="+cid+"------type="+type+"---name====="+name);
                     String d = "d";
                     // cid="58de0ae4b25ece0ff88a023d";
                     String attributeset=null;

        try{
                     MongoClient mongoClient = new MongoClient( ip , 27017 );
                     DB db = mongoClient.getDB("baazaronline");
                     DBCollection collection = db.getCollection("categories");
                     BasicDBObject doc = new BasicDBObject("parentid", cid);
                     DBCursor cursor=collection.find(doc);
                    
                     if (cursor.hasNext()){
                             int i = 0;
    
                     while (cursor.hasNext()) {
                         d="l";
                     System.out.println("data     "+cursor);
                  
                     String s= cursor.next().toString();
                    
                     // creating json object for conver string values to json
               
                     Object obj=JSONValue.parse(s); 
                     JSONObject jsonObject = (JSONObject) obj;
                   
//                   getting values from  json to string
                     
                     String pid =  (String) jsonObject.get("parentid");
                     //again convert in to json
                     Object js = jsonObject.get("_id");
                     JSONObject ll = (JSONObject)js;
                     String id= (String) ll.get("$oid");
                     String Name =  (String) jsonObject.get("Name");
                    
    %>
                             
                    <li id="<%out.print(id);%>" name value="<%out.print(Name);%>"> <%out.print(Name);%> </li>
                  
                    <%
                                  
                            }

                         }

else if(d.equals("d") && type.equals("comision")) {
        

System.out.println("sarvesh sir............................");

%>
<a href="ShippingCalculator.jsp?val=<%out.print(cid);%>&name=<%out.print(name);%>"><button id="<%out.print(cid);%>" value="<%out.print(name);%>">Add Comission</button></a>
                     
<%
}
else if(d.equals("d") && type.equals("export")){
System.out.println("amit parmr...................."+cid);

  BasicDBObject doc1 = new BasicDBObject("_id",new ObjectId(cid));
  DBCursor cursor1=collection.find(doc1);

              while (cursor1.hasNext()) {
                      DBObject data = cursor1.next();
                         attributeset=(String)data.get("attributeSet");
                    
                  }
      

%>
<a href="${pageContext.request.contextPath}/ProductExportFormate?val=<%out.print(cid);%>&name=<%out.print(name);%>&attributeSet=<%=attributeset%>"><button id="<%out.print(cid);%>" value="<%out.print(name);%>">export</button></a>

<% }
else if(d.equals("d") && type.equals("Imports")){%>
<form action="${pageContext.request.contextPath}/NewServlet" method="post" enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />

<a href="${pageContext.request.contextPath}/ProductExportFormate?val=<%out.print(cid);%>&name=<%out.print(name);%>&attributeSet=<%=attributeset%>"><button id="<%out.print(cid);%>" value="<%out.print(name);%>">import</button></a>
</form>
<%}
                   //  cursor = collection.find();
                      
}     
            catch(Exception e) {
                     out.print(e);
                 
                   }
%>
</html>