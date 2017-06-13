<%-- 
    Document   : Grid
    Created on : 8 May, 2017, 4:47:48 PM
    Author     : baazarteam2
--%>

<%@page import="com.mongodb.Mongo"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
 <div class="container">
                <div class="row-fluid">
    
                        <div class="w-box w-box-blue">
                            
                            <div class="w-box-content cnt_a">
                                <table><tr><td><input type="text"> </td><td><a href="CCatagourys.jsp"><h4>Browse Product by category</h4></td></tr></table></a>
                            </div>
                            <div class="w-box-header">
                                <h4> 541  Refrigerator New found under Home & Kitchen/Large Appliances </h4>
                            </div>
                        </div>
                </div>
    <div class="row-fluid">
      <%
          String parent_id=request.getParameter("pid");
             String User_ID3=(String)session.getAttribute("User_ID");
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo(ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("products");
            DBCollection collection1 = db.getCollection("product_varient_relations");
              DBObject doc1 = new BasicDBObject("Product_id", parent_id);
              DBCursor cursor1=collection1.find(doc1);
              while(cursor1.hasNext())
              {
                  DBObject str1=cursor1.next();
                  String v_id=(String)str1.get("Varient_id");
              
            DBObject doc = new BasicDBObject("_id",new ObjectId(v_id) );
                DBCursor cursor = collection.find(doc);
                
        while(cursor.hasNext())
             {
              String attributeSet="";
                 DBObject str=cursor.next();
                 String parent=request.getParameter("cid");
                 Object p_id=(ObjectId)str.get("_id");
                 String Product_image=(String)str.get("First_image");
                 String product_id=p_id.toString();
                %>
     
                <div class="span4" style="margin-top: 16px; margin-left: 5px; margin-right: 16px;">
                        <div class="w-box">
                            
                            <div class="w-box-content cnt_a">
                               
                                    <table cellpadding="5" style="width: 100%;">
                                        <tr>
                                            <td colspan="3">
                                                <h5><%=(String)str.get("Product_Name")%></h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px">
                                                
                                                <div class="user-box-inner" style="overflow-y: hidden; height: 100px;">
                                                    <img src="../img/product/<%= Product_image%>" style="height: auto; width: 100px;">
                                                </div>
                                                
                                            </td>
                                            
                                            <td colspan="2">
                                                <%
                                            DBCollection collection4=db.getCollection("categories");
                                            DBObject doc4 = new BasicDBObject("_id",new ObjectId(parent));
                                            DBCursor cursor4 = collection4.find(doc4);
                                            while(cursor4.hasNext())
                                            {
                                                DBObject str4=cursor4.next();
                                                 attributeSet=(String)str4.get("attributeSet");
                                                 BasicDBList list = (BasicDBList) str4.get("available_product_listing_sort_by");
                                                            for(Object obj : list ){
                                                        DBCollection collection2 = db.getCollection("Attribute");
                                                        BasicDBObject doc5 = new BasicDBObject("attcode",obj);
                                                        DBCursor cursor5 = collection2.find(doc5);
                                                        while(cursor5.hasNext())
                                                           {
                                                               DBObject str5= cursor5.next();
                                                               String visible_name=(String)str5.get("Visiblename");%>
                                                <span> <strong> <%=visible_name%>:</strong> <span style="color: #666;"> <%=(String)str.get(visible_name)%> </span></span><br/>
                                                <%}}}%>
                                            </td>
                                        </tr>
                                        </table>
                                                <table>
                                        <tr>
                                            <td><button class="btn " type="button" style="margin-right: 20px;" onclick='location.href="Update_my_product.jsp?p_id=<%=product_id%>&i=o"' >Add Price</button></td> 
                                            </tr>
                                    </table>
                          
                            </div>
                        </div>
                    </div>
                    
               
     <%}} mg.close();%>
     </div> 
 </div>
<%@include file="Footer.jsp" %>