<%-- 
    Document   : Seller_wise_products
    Created on : 30 May, 2017, 2:39:27 PM
    Author     : baazaronline4
--%>


<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
                <div class="row-fluid">
                    <div class="span12">
                            <div class="w-box-header">
                                <h4>User profile</h4></div>
     <div class="container">
                <div class="row-fluid">
                &nbsp;
                </div>
         </div> 
                        
    <table id="example" class="display" width="100%" cellspacing="0" style="font-size:12px !important;">
        <thead>
            <tr>
                
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>product</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>product</th>
            </tr>
        </tfoot>
         <%
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo( ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("sellers");
          %>           
             
        <tbody>
     <% BasicDBObject doc = new BasicDBObject();
        DBCursor cursor = collection.find(doc);
        
        while(cursor.hasNext())
             {
            DBObject str=cursor.next();
     
     System.out.println("connnection  succsees insideeee of the while loopiiiiiiiiiiiiiiiiiiiiiiiiiiii"+str);     
     %>
                 
            <tr>
                <td ><%=(String)str.get("Full_Name")%></td>
                <td ><%=(String)str.get("Email")%></td>
                <td ><%=(String)str.get("Number")%></td>
                
                  <%
                    Object seller_object_id =(ObjectId)str.get("_id"); 
                      String seller = seller_object_id.toString();
                      System.out.println("cgeteeeeeeeeeeeeeeeeeeeeeeeeeeeeeetnnnnnnnnnnnnnnnnnnnnnnnn"+seller);
                      mg.close();
                       Mongo m = new Mongo(ip,27017);
                      DB d = m.getDB("baazaronline");
         
                DBCollection collection1 = d.getCollection("products");
                
                
                
                BasicDBObject andQuery = new BasicDBObject();
                List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
                
                obj.add(new BasicDBObject("User_Object_ID", seller));
                obj.add(new BasicDBObject("Type", "Product"));
                andQuery.put("$and", obj);
                DBCursor cursor1 = collection1.find(andQuery);
               
                List product = new ArrayList(); 
                 String product_id= null;
                 while(cursor1.hasNext())
                {
                    DBObject str1 = cursor1.next();
                    System.out.println("thisiffjsfsdfsisiljslfjsfjssfjsfsfsfssdsd"+str1);
                    Object product_object =(ObjectId)str.get("_id"); 
                       product_id = product_object.toString();
                    product.add(product_id);    
                }
                 
                 
%>
                <td> <%=product.size()%><a href="Show_Products_1.jsp?p_id=<%=product_id%>&i=m&email=<%=(String)str.get("Email")%>&seller=<%=seller%>" > View Products</a></td>
            </tr>
            <% } 
            
            %>
       </tbody>
    </table>
           
 

        <script>$(document).ready(function() {
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
                        </div>
       <div><br><br><br><br><br><br></div>
</body>
</html>
<%@include file="Footer.jsp" %>