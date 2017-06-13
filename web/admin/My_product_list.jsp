<%@page import="Login.User_ID"%>
<%@page import="Login.User_ID"%>
<%@page import="com.mongodb.BasicDBList"%>
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
          
             
.zoom {      
-webkit-transition: all 0.35s ease-in-out;    
-moz-transition: all 0.35s ease-in-out;    
transition: all 0.35s ease-in-out;     
cursor: pointer;      
cursor: pointer;      
cursor: pointer;  
}     

.zoom:hover,  
.zoom:active,   
.zoom:focus {
/**adjust scale to desired size, 
add browser prefixes**/
-ms-transform: scale(2.5);    
-moz-transform: scale(2.5);  
-webkit-transform: scale(2.5);  
-o-transform: scale(2.5);  
transform: scale(2.5);    
position:relative;      
z-index:100;  
}

        </style>
   
<div class="container">
    <form action="CCatagourys.jsp">
        <button type="submit" id="Add_Product" name="Add_Product" value="Add_Product" class="btn btn-beoro-3">Add Product</button>
                <div class="row-fluid">
                    <div class="span12">
                            <div class="w-box-header">
                                <h4>My all Products</h4></div>
     <div class="container">
                <div class="row-fluid">
                &nbsp;
                </div>
         </div> 
                        
    <table id="example" class="display" width="100%" cellspacing="0" style="font-size:12px !important;">
        <thead>
            <tr>
                <th>id</th>
                <th>Product Image</th>
                <th>Product Name</th>
                <th>Att.set name</th>
                <th>SKU</th>
                <th>Price</th>
                <th>qty</th>
                <th>Action</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>id</th>
                <th>Product Image</th>
                <th>Product Name</th>
                <th>Att.set name</th>
                <th>SKU</th>
                <th>Price</th>
                <th>qty</th>
                <th>Action</th>
            </tr>
        </tfoot>
         <%
             
             String User_ID3=(String)session.getAttribute("User_ID");
               String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo(ip,27017);
            DB db = mg.getDB("baazaronline");
            
            DBCollection collection = db.getCollection("product");
            DBObject doc6 = new BasicDBObject("Type", "Product");
                DBCursor cursor = collection.find(doc6);
           %>           
             
        <tbody>
     <% 
        int i=1;
        while(cursor.hasNext())
             {
              String attributeSet="";
                 DBObject str=cursor.next();
                 String parent=(String)str.get("cid");
                 Object p_id=(ObjectId)str.get("_id");
                 String Product_image=(String)str.get("First_image");
                 String product_id=p_id.toString();
                //Checking Product exists or not 
                 DBCollection collection10 = db.getCollection("product_price");
                DBObject by_P_id = new BasicDBObject("Product_id", product_id);  
                DBObject by_User_ID = new BasicDBObject("User_ID", "ggsd");    
                BasicDBList And = new BasicDBList();
                And.add(by_P_id);
                And.add(by_User_ID);
                DBObject doc10 = new BasicDBObject("$and", And);
                DBCursor cursor10=collection10.find(doc10);
                if(cursor10.hasNext())
                {
                 DBCollection collection4=db.getCollection("categories");
                DBObject doc4 = new BasicDBObject("_id",new ObjectId(parent));
                DBCursor cursor4 = collection4.find(doc4);
                while(cursor4.hasNext())
                {
                    DBObject str4=cursor4.next();
                     attributeSet=(String)str4.get("attributeSet");
                } 
                 
                %>
            <tr  style="cursor:hand">
                <td ><%=i%></td>
                <td>
                   <img class="zoom" src="../img/product/<%= Product_image%>" style="height: 50px;width: 40px;">
                </td>
                <td ><%=(String)str.get("Product_Name")%></td>
                <!--///////////////////////////////////////-->
                <%DBCollection collection2=db.getCollection("categories");
                DBObject doc = new BasicDBObject("_id",new ObjectId(parent));
                DBCursor cursor2 = collection2.find(doc);
                while(cursor2.hasNext())
                {
                    DBObject str2=cursor2.next();
                    
                %>
                <td ><%=(String)str2.get("attributeSet")%></td><%}%>
                <!--///////////////////////////////////////////-->
                
                <!--///////////////////////////////////////////-->
                <%DBCollection collection1 = db.getCollection("product_price");
                DBObject doc1 = new BasicDBObject("Product_id",product_id);
                DBCursor cursor1 = collection1.find(doc1);
                while(cursor1.hasNext())
                {
                    DBObject str1=cursor1.next();
                    if(str1.get("User_ID").equals(User_ID3))
                    {
                %>
                <td ><%=(String)str1.get("SKU")%></td>
                <td ><%=(String)str1.get("Price")%></td>
                <td><%=(String)str1.get("Stock_qty")%></td> <%}}%>
                <td> <a href="Update_my_product.jsp?p_id=<%=product_id%>&i=m" > update</a> </td>
            </tr>
            <%i++;}} mg.close();%>
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
                </div></form>
                        </div>
       <div><br><br><br><br><br><br></div>
</body>
</html>
<%@include file="Footer.jsp" %>