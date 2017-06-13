<%-- 
    Document   : Grid
    Created on : 8 May, 2017, 4:47:48 PM
    Author     : baazarteam2
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
 <div class="container">
               <div class="row-fluid">
    
                        <div class="w-box w-box-blue">
                            
                            <div class="w-box-content cnt_a">
                               <form action="last_child_category_for_My_product_list" method="post">
                                <table><tr>
                                        <td >
                                               <select name="Status" class="span10" style="height: 40px; ">
                                                   <%
                                                       Mongo mg = new Mongo(Seller_Login.Database,27017);
                                                       DB db = mg.getDB("baazaronline");
                                                       DBCollection collection10 = db.getCollection("categories");
                                                       BasicDBObject doc10=new BasicDBObject("parentid","null");
                                                       DBCursor cursor10= collection10.find(doc10);
                                                       while(cursor10.hasNext())
                                                       {
                                                         DBObject str10=cursor10.next();
                                                         String Category=(String)str10.get("Name");
                                                         Object id= (ObjectId)str10.get("_id");
                                                         String cid=id.toString();
                                                         
                                                   %>
                                                   <option value="<%=cid%>"><%=Category%></option>
                                               <%}%>
                                               </select>
                                          
                                        </td>
                                         <td>
                                            <input type="text" style="height: 35px; width: 500px;" placeholder="Search in Category" name="Search_bar" id="Search_bar">
                                            <button class="btn" style="height: 35px; margin-top: 0px;"><i class="icsw16-info-about"></i></button>
                                         </td>
                                         <td ><a href="ChosseCatagory.jsp" ><h4>Add Product by category</h4></a></td>
                                    </tr></table></form>
                            </div>
                            <div class="w-box-header">
                                <h4> 541  Refrigerator New found under Home & Kitchen/Large Appliances </h4>
                            </div>
                        </div>
                </div>
    <div class="row-fluid">
        <div class="span2" >
            <div class="w-box">
                            
                <div class="w-box-content cnt_a" style="margin-top: 16px; min-height:200px; height:auto;">
                    
                    vxcvcx
                </div>
            </div>
        </div>     
        
        <div class="span10">
        
        <%
            int i=0;
          ArrayList<String> cid = (ArrayList<String>)session.getAttribute("Last_child_id_for_my_product_list");
            String Search_bar=(String)session.getAttribute("Search_bar");
//             String cid = (String) session.getAttribute("Last_child_id_for_my_product_list");
             String User_Object_ID=(String)session.getAttribute("Object_ID");
            DBCollection collection = db.getCollection(Seller_Login.Product_price_collection);
            DBCollection collection1 = db.getCollection(Seller_Login.Product_collection);
            DBObject doc = new BasicDBObject("User_Object_ID", User_Object_ID);
                DBCursor cursor = collection.find(doc);
              
        while(cursor.hasNext())
             {
                 DBObject str=cursor.next();
                 String Product_id=(String)str.get("Product_id");
                 
                 
                 DBCursor cursor2=null;
            if(!Search_bar.equals("")){
            DBObject by_id = new BasicDBObject("_id",new ObjectId(Product_id));
           // DBObject by_Key = new BasicDBObject(new Document("$text", new Document("$search", Search_bar ).append("$caseSensitive", new Boolean(false))));
                   
                BasicDBList And = new BasicDBList();
                And.add(by_id);
               // And.add(by_Key);
                DBObject doc2 = new BasicDBObject("$and", And);
                 cursor2 = collection1.find(doc2);
            }
            else
            {
                BasicDBObject doc2 = new BasicDBObject("_id",new ObjectId(Product_id));
                cursor2 = collection1.find(doc2);
            }
                 
                  
                 while(cursor2.hasNext())
                 {
                     DBObject str1=cursor2.next();
                  if(cid.contains(str1.get("cid")))
                 {
                     i=1;
              String attributeSet="";
                 
                 String parent=(String)str1.get("cid");
                 Object p_id=(ObjectId)str1.get("_id");
                 String Product_image=(String)str1.get("First_image");
                 String product_id=p_id.toString();
                 String User_Object_ID1=(String)str1.get("User_Object_ID");
                %>
     
                <div class="span4" style="margin-top: 16px; margin-left: 5px; margin-right: 10px;">
                        <div class="w-box">
                            
                            <div class="w-box-content cnt_a">
                               
                                    <table cellpadding="5" style="width: 100%;">
                                        <tr>
                                            <td colspan="3" style="height: 10px">
                                                <h5><%=(String)str1.get("Product_Name")%></h5>
                                            </td>
                                            <td style="float: right" style="height: 10px" >
                                                <%if(str1.get("Product_Status").equals("Unapproved")){%>
                                                <img src="../img/status/redthumb.jpg" style="height: 30; width: 30px;">
                                                <%}else{%>
                                                <img src="../img/status/greenthumb.jpg" style="height: 30; width: 30px;">
                                                <%}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px">
                                                
                                                <div class="user-box-inner" style="overflow-y: hidden; height: 100px;">
                                                    <img src="../img/product/<%=User_Object_ID1+"/Thumbnil/"+Product_image%>" style="height: auto; width: 100px;">
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
                                                <span> <strong> <%=visible_name%>:</strong> <span style="color: #666;"> <%=(String)str1.get(visible_name)%> </span></span><br/>
                                                <%}}}%>
                                            </td>
                                        </tr>
                                        </table>
                                                <table>
                                        <tr>
                                            <td><button class="btn " type="button" style="margin-right: 20px;" onclick='location.href="Update_my_product.jsp?p_id=<%=product_id%>&i=m" ' >Update Price</button></td> 
                                            </tr>
                                    </table>
                          
                            </div>
                        </div>
                    </div>
                    
               
     <%}
        
      }
        }if(i==0){
     %>
                <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td><img src="../img/status/no-record-found.png" style="height: 200px; width: 200px; margin-top: 20px"></td>
                            <td><h4 style="color: #858d91">No Data Available <br>In this category</h4></td>
                        </tr>
                    </table>
       <% }
     mg.close();%>
     
        </div>
     </div> 
 </div>
<%@include file="Footer.jsp" %>