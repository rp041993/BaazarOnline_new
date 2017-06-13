
<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="com.mongodb.DB"%>
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
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Vender Name</th>
                <th>Business Location</th>
                <th>Pincode</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Vender Name</th>
                <th>Business Location</th>
                <th>Pincode</th>
            </tr>
        </tfoot>
         <%
            Mongo mg = new Mongo("35.154.252.180",27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("product_availablity_pincodes");
          %>           
             
        <tbody>
     <% BasicDBObject doc = new BasicDBObject();
        DBCursor cursor = collection.find();
        while(cursor.hasNext())
             {
                 DBObject str=cursor.next();
                 String Product_ID=(String)str.get("Product_ID");
                 String Vendor_Object_ID=(String)str.get("Vendor_Object_ID");
                   DBCollection collection1 = db.getCollection("products");
                    DBObject byID = new BasicDBObject("_id", new ObjectId(Product_ID));  
                    DBObject byUser_ID = new BasicDBObject("User_Object_ID", Vendor_Object_ID);    
                    BasicDBList and = new BasicDBList();
                    and.add(byID);
                    and.add(byUser_ID);
                    DBObject doc1 = new BasicDBObject("$and", and);
                   DBCursor cursor1=collection1.find(doc1);
                        while(cursor1.hasNext())
                        {
                            System.out.print("2222222");
                            DBObject str1=cursor1.next();
                            DBCollection collection2 = db.getCollection("sellers");
                            BasicDBObject doc2=new BasicDBObject("_id",new ObjectId(Vendor_Object_ID));
                            DBCursor cursor2=collection2.find(doc2);
                            while(cursor2.hasNext())
                            {
                                DBObject str2=cursor2.next();
                                System.out.print("33333333");
                            
                        
     %>
            <!--<tr onclick="document.location='UserEdit.jsp?UserName='" style="cursor:hand">-->
            <tr>
                <td ><%=(String)str1.get("Product_Name")%></td>
                <td ><img src="../img/Seller/Seller_Product/<%=Vendor_Object_ID+"/"+ (String)str1.get("First_image") %>" style="height: 60px; width: 50px;"></td>
                <td ><%=(String)str2.get("Business_Name")%></td>
                <td ><%=(String)str2.get("Business_Address")%></td>
                <td ><%=(String)str.get("Product_Availablity_pincode")%></td>
            </tr>
            <%}} }mg.close();%>
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