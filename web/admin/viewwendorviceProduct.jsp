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
                <th>Att.set name</th>
                <th>image</th>
                <th>vendor id</th>
                <th>Price</th>
                <th>qty</th>
                <th>Action</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>id</th>
                <th>Product Name</th>
                <th>Att.set name</th>
                <th>image</th>
                <th>vendor id</th>
                <th>Price</th>
                <th>qty</th>
                <th>Action</th>
            </tr>
        </tfoot>
         <%
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo( ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("products");
            DBObject product = new BasicDBObject("Type","Product");
            DBCursor cursor = collection.find(product);
            String[] vendor = request.getParameterValues("vendor");
            
            DBCollection collection1 = db.getCollection("product_prices");
                String pid = request.getParameter("pid");
                DBObject doc1 = new BasicDBObject("Product_id", pid);
                DBCursor cursor1 = collection1.find(doc1);
            
           %>           
<tbody>
     <%  
         String attset =null;
        while(cursor.hasNext())
             {
              String attributeSet="";
                 DBObject str=cursor.next();
            
                 String parent=(String)str.get("cid");
                 String image =(String)str.get("First_image");
            
                 Object p_id=(ObjectId)str.get("_id");
                 String product_id=p_id.toString();
                 DBCollection collection4=db.getCollection("categories");
                 DBObject doc4 = new BasicDBObject("_id",new ObjectId(parent));
                 DBCursor cursor4 = collection4.find(doc4);
                while(cursor4.hasNext())
                {
                    DBObject str4=cursor4.next();
                     attributeSet=(String)str4.get("attributeSet");
                           
                } 
                String User_ID3=(String)session.getAttribute("User_ID");
                
                %>
            <tr style="cursor:hand">
                <td><%=(ObjectId)str.get("_id")%></td>
                <td><%=(String)str.get("Product_Name")%></td>
                
                <!--///////////////////////////////////////-->
                <%DBCollection collection2=db.getCollection("categories");
                DBObject doc = new BasicDBObject("_id",new ObjectId(parent));
                DBCursor cursor2 = collection2.find(doc);
                while(cursor2.hasNext())
                {
                    DBObject str2 = cursor2.next();
                    attset = (String) str2.get("attributeSet");
                %>
                <td ><%=(String)str2.get("attributeSet")%></td>
                <td><img src="img/product/<%= image%>" style="height: auto; width: 100px;"> </td>
                <%}%>
                <!--///////////////////////////////////////////-->
               
                <!--///////////////////////////////////////////-->
                <%
                DBCursor findvendor = collection1.find(doc1);
                List wendor = new ArrayList();
                 while (findvendor.hasNext()) {
                         DBObject vendores = findvendor.next();
                        String userid = vendores.get("User_ID").toString(); 
                         wendor.add(userid);
                     }
            
                 for (int i = 0; i < wendor.size(); i++) {
                         String vendorid = wendor.get(i).toString();
                           DBObject findvendorprice = new BasicDBObject("User_ID", vendorid);
            
                             DBCursor data1 = collection1.find(findvendorprice);
                 } 
                     
                 int users =0 ;
                while(cursor1.hasNext())
                {
                    
                    
                    DBObject str1=cursor1.next();
                    users++;
                    System.out.println(" i am in while loop  "+str1);
                    
                     String userid = str1.get("User_ID").toString();
                     
                     String Price =  str1.get("Price").toString();
                     
                     String Stock_qty = str1.get("stock_qty").toString();
                     
            
// wendor.add(str1.get("User_ID").toString());
                     
                      
//                    if(str1.get("User_ID").equals(session.getAttribute("User_ID")))
//                    {
                         
                %>
                     <td ><%=userid%></td>
                    <td ><%=Price%></td>
                <td><%=Stock_qty%></td>
                <% }
                
                %>
<!--                 <td ><a href="newjsp3.jsp?pid=<%=product_id%>&cid=<%=parent%>"><%=users%> see</a></td>-->
                <td><a href="newjsp3.jsp?pid=<%=product_id%>&AttributeSet=<%=attset%>&cid=<%=parent%>">View</a> &nbsp;<a href="aadProductPrice.jsp?producid=<%=product_id%>" >AddPrice</a></td>
                
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