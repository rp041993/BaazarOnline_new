<%-- 
    Document   : viewwendorviceProduct
    Created on : 11 May, 2017, 5:25:04 PM
    Author     : baazaronline4
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.Mongo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>

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
                <th>Price</th>
                <th>qty</th>
                
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>id</th>
                <th>Product Name</th>
                <th>image</th>
                <th>vendor id</th>
                <th>Price</th>
                <th>qty</th>
                
            </tr>
        </tfoot>
         <%
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo(  ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("products");
            DBObject product = new BasicDBObject("Type","Product");
            DBCursor cursor = collection.find(product);
            String[] vendor = request.getParameterValues("vendor");
            System.out.println("this is request vendor)"+vendor);
            DBCollection collection1 = db.getCollection("product_prices");
            String pid = request.getParameter("pid");
            System.out.println("<<<<<<<>>>>>>>>>>>>>>>>>>>>>vendor="+vendor+"piddddddddd="+pid);
            DBObject doc1 = new BasicDBObject("Product_id", pid);
            DBCursor cursor1 = collection1.find(doc1);
            
               DBCollection products = db.getCollection("products");
                
                
                
                BasicDBObject andQuery = new BasicDBObject();
                List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
                obj.add(new BasicDBObject("Product_id", pid));
                obj.add(new BasicDBObject("Type", "Product"));
                andQuery.put("$and", obj);
                DBCursor productcursor = collection.find(andQuery);
                System.out.println("this is query+++++"+andQuery);
                while (productcursor.hasNext()) {
                        DBObject o = productcursor.next();
                String images =(String) o.get("First_image");        
                   System.out.println("ctytytytytyytytytyytyttytyytytytytyt"+images);    
                }
                
                
                
           %>           
<tbody>
     <%  
         String producname = null; 
         String image = null; 
         Object p_id = null;
         String attset =null;
        while(cursor1.hasNext())
             {
             
               
                
                %>
                <tr style="cursor:hand">
                <% %>
                <!--///////////////////////////////////////////-->
               
                <!--///////////////////////////////////////////-->
                <%
                     
                 
                    
                    
                    DBObject str1=cursor1.next();
               
                                             
             
                    System.out.println("inside the first while loop"+str1);
                     String userid = str1.get("User_Object_ID").toString();
                     
                     String Price =  str1.get("Price").toString();
                     
                     String Stock_qty = str1.get("Stock_qty").toString();
                     
             
                     
                  
                 while(cursor.hasNext())
             {
              String attributeSet="";
                 DBObject str=cursor.next();
 
                 String parent=(String)str.get("cid");
                 image =(String)str.get("First_image");
  
                  p_id =(ObjectId)str.get("_id");
                  producname =(String)str.get("Product_Name").toString();
                 String product_id=p_id.toString();
                 DBCollection collection4=db.getCollection("categories");
                 DBObject doc4 = new BasicDBObject("_id",new ObjectId(parent));
                 DBCursor cursor4 = collection4.find(doc4);
                  
             }
                %>
                    
                 <td><%=p_id%></td> 
                 <td><%=producname%></td>
                 <td><img src="../img/product/<%= image%>" style="height: auto; width: 100px;"> </td>
                  <td><%=userid%></td>
                  <td ><%=Price%></td>
                 <td><%=Stock_qty%></td>
                <% 
                
                %>

                
                
            </tr>
            <% }mg.close();%>
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