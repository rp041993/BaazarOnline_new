<%-- 
    Document   : unapprove_product
    Created on : 11 May, 2017, 6:23:17 PM
    Author     : baazaronline4
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%@include file="Header.jsp" %>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
          
 <style>
            tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
    tfoot {
    display: table-header-group; 
          }
        </style>
   
<div class="container">
    <form action="CCatagourys.jsp">
    <button type="submit" id="Add_Product" name="Add_Product" value="Add_Product" class="btn btn-beoro-3">Add Product</button>
                <div class="row-fluid">
                    <div class="span12">
                            <div class="w-box-header">
                                <h4>All Products</h4></div>
     <div class="container">
                <div class="row-fluid">
                &nbsp;
                </div>
         </div> 
                        
    <table id="example" class="display" width="100%" cellspacing="0" style="font-size:12px !important;">
        <thead>
            <tr>
                <th>id</th>
                <th>Product Name</th>
                <th>image</th>
                <th>vendor id</th>
                <th >Action</th>
                
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>id</th>
                <th>Product Name</th>
                <th>image</th>
                <th>vendor id</th>
                <th>Action</th>
            </tr>
        </tfoot>
         <%
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo( ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("products");
            DBObject anappove = new BasicDBObject("Product_Status","Unapproved");
                DBCursor cursor = collection.find(anappove);
           %>           
<tbody>
     <% 
         String attset =null;
        while(cursor.hasNext())
             {
              String attributeSet="";
                 DBObject str=cursor.next();
                 
                 System.out.println("ttttttttttttttt"+str);
                 String parent=(String)str.get("cid");
                 String image =(String)str.get("First_image");
                 Object p_id=(ObjectId)str.get("_id");
                 String product_id=p_id.toString();
                 
                String User_ID3 =(String)session.getAttribute("User_Object_ID");
                DBCollection collection4=db.getCollection("categories");
                 DBObject doc4 = new BasicDBObject("_id",new ObjectId(parent));
                 DBCursor cursor4 = collection4.find(doc4);
                while(cursor4.hasNext())
                {
                    DBObject str4=cursor4.next();
                     attributeSet=(String)str4.get("attributeSet");
                           
                }
                
                %>
            <tr style="cursor:hand " style="background: red">
                <td><%=(ObjectId)str.get("_id")%></td>
                <td><%=(String)str.get("Product_Name")%></td>
                <%
                if (str.get("User_Object_ID").equals("Admin")) {
                   
                
                %>
                <!--///////////////////////////////////////-->
                <td><img src="../img/Admin/Admin_Product/<%=image%>" style="height: auto; width: 100px;"> </td>
                <%}
else{ %> 
                    <td><img src="../img/Seller/Seller_Product/<%=str.get("User_Object_ID")+"/"+ image%>" style="height: auto; width: 100px;"> </td>
                <% }
                %>
                <!--///////////////////////////////////////////-->
               
                <!--///////////////////////////////////////////-->
                <%
                DBCollection collection1 = db.getCollection("product_prices");
                DBObject doc1 = new BasicDBObject("Product_id", product_id);
                DBObject wendorid = new BasicDBObject("User_Object_ID", " ");
                
                DBCursor cursor1 = collection1.find(doc1);
                
                 int users =0 ;
                while(cursor1.hasNext())
                {
                    DBObject str1=cursor1.next();
                    String user = str1.get("User_Object_ID").toString();
                    users++;
                %>
<!--                 <td ><%=(String)str1.get("SKU")%></td>-->
               
<td><%=user%></td>
                <%}
               
                %>
<!--                 <td ><a href="newjsp3.jsp?pid=<%=product_id%>&cid=<%=parent%>"><%=users%> vendor</a></td>-->
                <td><a href="Update_product.jsp?pid=<%=product_id%>&AttributeSet=<%=attributeSet%>&cid=<%=parent%>&type=a">View</a> &nbsp;<a href="aadProductPrice.jsp?producid=<%=product_id%>" ></a></td>
                
            </tr>
            <%} mg.close();%>
       </tbody>
    </table>
<script>
        $(document).ready(function() {
    // Setup - add a text input to each footer cell
        $('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input style="height: 28px; font-size:12px;" type="text"  placeholder="Search '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#example').DataTable();
 
    // Apply the search
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
} );</script>
</div>
     </div>
         </form>
               </div>
       <div><br><br><br><br><br><br></div>
</body>
</html>
<%@include file="Footer.jsp" %>