<%-- 
    Document   : Grid
    Created on : 8 May, 2017, 4:47:48 PM
    Author     : baazarteam2
--%>

<%@page import="seller.Seller_Login"%>
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
                                <!--<table><tr><td><input type="text"> </td><td><a href="CCatagourys.jsp"><h4>Browse Product by category</h4></td></tr></table></a>-->
                            </div>
                            <div class="w-box-header">
                                <h4> Varient of your selected product </h4>
                            </div>
                        </div>
                </div>
   
      <%
          String parent_id=request.getParameter("pid");
             String User_Object_ID=(String)session.getAttribute("Object_ID");
            Mongo mg = new Mongo(Seller_Login.Database,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection(Seller_Login.Product_collection);
            DBCollection collection1 = db.getCollection(Seller_Login.Product_varient_relation);
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
                 String Product_Status=(String)str.get("Product_Status");
                 String User_Product_Object_ID=(String)str.get("User_Object_ID");
                %>
     
                <div class="span4" style="margin-top: 16px; margin-left: 5px; margin-right: 16px;">
                        <div class="w-box">
                            
                            <div class="w-box-content cnt_a">
                               
                                    <table cellpadding="5" style="width: 100%;">
                                        <tr>
                                            <%if(User_Product_Object_ID.equals(User_Object_ID))
                                            {%>
                                                <td colspan="3">
                                                <h5><%=(String)str.get("Product_Name")%></h5>
                                                </td>
                                                <td style="float: right">
                                                    <%if(str.get("Product_Status").equals("Unapproved")){%>
                                                    <img src="../img/status/redthumb.jpg" style="height: 30; width: 30px;">
                                                    <%}else{%>
                                                    <img src="../img/status/greenthumb.jpg" style="height: 30; width: 30px;">
                                                    <%}%>
                                                </td>
                                            <%}else{%>
                                            <td colspan="3">
                                                <h5><%=(String)str.get("Product_Name")%></h5>
                                            </td><%}%>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px">
                                                <div class="user-box-inner" style="overflow-y: hidden; height: 100px;">
                                                    <img src="../img/product/<%=User_Product_Object_ID+"/Thumbnil/"+Product_image%>" style="height: auto; width: 100px;">
                                                    
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
                                            <%
                                                String x="";
                                                DBCollection collection2 = db.getCollection(Seller_Login.Product_price_collection);
                                                DBObject doc2 = new BasicDBObject("Product_id", product_id);
                                                DBCursor cursor2=collection2.find(doc2);
                                                while(cursor2.hasNext())
                                                {
                                                    DBObject str2=cursor2.next();
                                                
                                                if(User_Object_ID.equals(str2.get("User_Object_ID")))
                                                {
                                                 x="Yes";   
                                                }}
                                                if(x.equals("Yes"))
                                                {%>
                                            <td><button class="btn " type="button" style="margin-right: 20px;" onclick='location.href="Update_my_product.jsp?p_id=<%=product_id%>&i=m" '>Update Price</button> </td>
                                            <%}else{%>
                                            <td><button class="btn " type="button" style="margin-right: 20px;" onclick='location.href="Update_my_product.jsp?p_id=<%=product_id%>&i=o"' >Add Price</button></td><%}%> 
                                            </tr>
                                    </table>
                          
                            </div>
                        </div>
                    </div>
                    
               
     <%}} mg.close();%>
     </div> 
 </div>
<%@include file="Footer.jsp" %>