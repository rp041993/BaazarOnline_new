<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="com.mongodb.client.model.Indexes"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
 <div class="container">
                <div class="row-fluid">
                    <%
                        Mongo mg = new Mongo(Seller_Login.Database,27017);
                        DB db = mg.getDB("baazaronline");
                        DBCollection collection1 = db.getCollection(Seller_Login.seller);
                        String User_Object_ID=(String)session.getAttribute("Object_ID");
                        BasicDBObject doc1=new BasicDBObject("_id",new ObjectId(User_Object_ID));
                          DBCursor cursor1= collection1.find(doc1);
                            while(cursor1.hasNext())
                                {
                                    DBObject str1=cursor1.next();
                                    if(str1.get("Pincode").equals(""))
                                    {
                                   %>
                                        <script>
                                            window.alert("Please insert pincode first");
                                            window.location='Seller_Business_Info.jsp';
                                        </script>
                                   <% }
                                }
                    %>
                        <div class="w-box w-box-blue">
                            
                            <div class="w-box-content cnt_a" >
                                <form action="last_child_category_for_My_product_list" method="post">
                                <table><tr>
                                        <td >
                                               <select name="Status" class="span10" style="height: 40px; ">
                                                   <%
                                                       DBCollection collection = db.getCollection("categories");
                                                       BasicDBObject doc=new BasicDBObject("parentid","null");
                                                       DBCursor cursor= collection.find(doc);
                                                       while(cursor.hasNext())
                                                       {
                                                         DBObject str=cursor.next();
                                                         String Category=(String)str.get("Name");
                                                         Object id= (ObjectId)str.get("_id");
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
                <div>
                    <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td><img src="../img/status/empty-box-gray.png" style="height: 150px; width: 150px"></td>
                            <td><h4 style="color: #858d91">No Data Available <br>Search by category</h4></td>
                        </tr>
                    </table>
                </div>
 </div>
<%@include file="Footer.jsp" %>