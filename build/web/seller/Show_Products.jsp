<%-- 
    Document   : Grid
    Created on : 8 May, 2017, 4:47:48 PM
    Author     : baazarteam2
--%>
<%@page import="seller.Seller_Login"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                               <form action="last_child_category_for_show_product" method="post">
                                <table><tr>
                                        <td >
                                               <select name="Status" class="span10" style="height: 40px; ">
                                                   <%
                                                       Mongo mg1 = new Mongo(Seller_Login.Database,27017);
                                                       DB db1 = mg1.getDB("baazaronline");
                                                       DBCollection collection1 = db1.getCollection("categories");
                                                       BasicDBObject doc1=new BasicDBObject("parentid","null");
                                                       DBCursor cursor1= collection1.find(doc1);
                                                       while(cursor1.hasNext())
                                                       {
                                                         DBObject str1=cursor1.next();
                                                         String Category=(String)str1.get("Name");
                                                         Object id= (ObjectId)str1.get("_id");
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
          ArrayList<String> cid = (ArrayList<String>)session.getAttribute("Last_child_id_for_show_product");
            String Search_bar=(String)session.getAttribute("Search_bar");
            // String cid = (String) session.getAttribute("Last_child_id_for_show_product");
             String User_Object_ID=(String)session.getAttribute("Object_ID");
            Mongo mg = new Mongo(Seller_Login.Database,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection(Seller_Login.Product_collection);
            DBCursor cursor=null;
            if(!Search_bar.equals("")){
            DBObject by_Type = new BasicDBObject("Type", "Product");
            //DBObject by_Key = new BasicDBObject(new Document("$text", new Document("$search", Search_bar ).append("$caseSensitive", new Boolean(false))));
                   
                BasicDBList And = new BasicDBList();
                And.add(by_Type);
               // And.add(by_Key);
                DBObject doc = new BasicDBObject("$and", And);
                 cursor = collection.find(doc);
            }
            else
            {
                BasicDBObject doc = new BasicDBObject("Type", "Product");
                cursor = collection.find(doc);
            }
            
          if(cursor.hasNext()) 
             {
        while(cursor.hasNext())
             {
                     DBObject str = cursor.next();
                if(cid.contains(str.get("cid")))
                 {
                     i=1;
              String attributeSet="";
                 
                 String parent=(String)str.get("cid");
                 Object p_id=(ObjectId)str.get("_id");
                 String Product_image=(String)str.get("First_image");
                 String product_id=p_id.toString();
                 String Product_Status=(String)str.get("Product_Status");
                 String User_Product_Object_ID=(String)str.get("User_Object_ID");
                 System.out.println("this iis product id "+User_Product_Object_ID);
                %>
     
                <div class="span4" style="margin-top: 16px; margin-left: 5px; margin-right: 10px;">
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
                                                if(x=="Yes"){%>
                                            <td><button class="btn " type="button" style="margin-right: 2px;" onclick='location.href="Update_my_product.jsp?p_id=<%=product_id%>&i=m" '  >Update Price</button></td> 
                                            <td><button class="btn " type="button" style="margin-right: 2px;" onclick='location.href="View_varient.jsp?cid=<%=parent%>&pid=<%=product_id%>"'>View Varient</button></td>
                                            <td><button class="btn " type="button" onclick='location.href="Add_Varient.jsp?p_id=<%=product_id%>&i=o&Attset=<%=attributeSet%>"'>Add Varient</button></td>
                                            <%}else{%>
                                            <td><button class="btn " type="button" style="margin-right: 7px;" onclick='location.href="Update_my_product.jsp?p_id=<%=product_id%>&i=o"' >Add Price</button></td> 
                                            <td><button class="btn " type="button" style="margin-right: 7px;" onclick='location.href="View_varient.jsp?cid=<%=parent%>&pid=<%=product_id%>"'>View Varient</button></td>
                                            <td><button class="btn " type="button" onclick='location.href="Add_Varient.jsp?p_id=<%=product_id%>&i=o&Attset=<%=attributeSet%>"'>Add Varient</button></td><%}%>
                                        </tr>
                                    </table>
                          
                            </div>
                        </div>
                    </div>
        
     <%}
      
      }if(i==0){
     %>
                <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td><img src="../img/status/no-record-found.png" style="height: 200px; width: 200px; margin-top: 20px"></td>
                            <td><h4 style="color: #858d91">No Data Available <br>In this category</h4></td>
                        </tr>
                    </table>
       <% }} 
    else{%>
               
                    <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                           <td><img src="../img/status/no-record-found.png" style="height: 200px; width: 200px; margin-top: 20px"></td>
                            <td><h4 style="color: #858d91">No Data Available <br>In this category</h4></td>
                        </tr>
                    </table>
                
        <%}
        cid.clear();
          session.setAttribute("Last_child_id_for_show_product","");
          session.setAttribute("Search_bar","");mg.close(); %>
        </div>
     </div> 
    </div>
<%@include file="Footer.jsp" %>