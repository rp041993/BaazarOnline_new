<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.Mongo"%>
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
                <th>vendors</th>
<!--                <th>Price</th>-->
<!--                <th>qty</th>-->
                <th>Action</th>
                <th>Product Status</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>id</th>
                <th>Product Name</th>
                <th>Att.set name</th>
                <th>image</th>
<!--                <th>SKU</th>-->
<!--                <th>Price</th>-->
<!--                <th>qty</th>-->
                  <th>vendors</th>
                 <th>Action</th>
                 <th>Product Status</th>
            </tr>
        </tfoot>
         <%
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo(ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("products");
            DBObject product = new BasicDBObject("Type","Product");
                DBCursor cursor = collection.find(product);
                
           %>           
<tbody>
     <% String Product_Status = null;
         String attset =null;
         
        while(cursor.hasNext())
             {
              String attributeSet="";
                 DBObject str=cursor.next();
                 
                 String parent=(String)str.get("cid");
                 String image =(String)str.get("First_image");
                Product_Status =(String)str.get("Product_Status");
                 String User_Object_ID=(String)str.get("User_Object_ID");
                 
                 Object p_id = (ObjectId)str.get("_id");
                 String product_id = p_id.toString();
                 DBCollection collection4=db.getCollection("categories");
                 DBObject doc4 = new BasicDBObject("_id",new ObjectId(parent));
                System.out.println("clfssfsdsfsa5555555555555" +product_id);
                 DBCursor cursor4 = collection4.find(doc4);
                while(cursor4.hasNext())
                {
                    DBObject str4=cursor4.next();
                     attributeSet=(String)str4.get("attributeSet");
                           
                } 
                String User_ID3=(String)session.getAttribute("User_Object_ID");
                
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
                <%
                if (str.get("User_Object_ID").equals("Admin")) {
                   
                    %>
                <td><img src="../img/product/<%=User_Object_ID+"/"+image%>" style="height: auto; width: 100px;"> </td>
                
                <%
                    
                    }else{
                %>
                
                <td><img src="../img/product/<%=User_Object_ID+"/"+image%>%>" style="height: auto; width: 100px;"> </td>
                <%}}%>
                <!--///////////////////////////////////////////-->
               
                <!--///////////////////////////////////////////-->
                <%DBCollection collection1 = db.getCollection("product_prices");
                
                DBObject doc1 = new BasicDBObject("Product_id", product_id);
                DBCursor cursor1 = collection1.find(doc1);
                
                 List vendor = new ArrayList();
                while(cursor1.hasNext())
                {
                    System.out.println(" i am in while loop  ");
                    DBObject str1=cursor1.next();
                    System.out.println("-------8---------------"+str1);
                    vendor.add(str1.get("User_Object_ID").toString());
                     str1.get("SKU");
                     
                      
//                    if(str1.get("User_ID").equals(session.getAttribute("User_ID")))
//                    {
                         
                %>
<!--                 <td ><%=(String)str1.get("SKU")%></td>-->
               
<!--                <td><%=(String)str1.get("Stock_qty")%></td> -->
                <%}
               
                %>
                 <td ><a href="view_vendor_wise_price.jsp?pid=<%=product_id%>&cid=<%=parent%>&vendor=<%=vendor%>"><%=vendor.size()%> vendors</a></td>
                <td><a href="Update_product.jsp?pid=<%=product_id%>&AttributeSet=<%=attset%>&cid=<%=parent%>&type=a">View</a> &nbsp;<a href="aadProductPrice.jsp?producid=<%=product_id%>&type=a&product_status=<%=Product_Status%>" >AddPrice</a></td>
                <% if (Product_Status.endsWith("Unapproved")) {
                      %>
                <td style="color: red">PENDING</td>
                <%
                  }
             else{
                
              %>
              <td style="color: green">APPROVE</td>
            </tr>
            <%}} mg.close();%>
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