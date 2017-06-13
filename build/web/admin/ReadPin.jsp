<%-- 
    Document   : ReadPin
    Created on : 10 Mar, 2017, 11:57:59 AM
    Author     : baazarteam5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@include file="Header.jsp" %>

<!DOCTYPE html>


<html>
<head>
    <title> hello </title>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
    <style>
        tfoot input {
            width:100%;
            padding: 3px;
            box-sizing: border-box;
            
        }
        tfood{
            display: table-header-group;
        }
    </style>
</head>
<body>
     
<table id="example" class="display" width="100%" style=" text-align: center;" cellspacing="0">
              
   
    <thead>
                     <tr>
                      <th>District</th>
                      <th> PinCode</th>
                      <th> State</th>
                     </tr>
             </thead>
<!--             <tfoot>
                 <th>District</th>
                      <th> PinCode</th>
                 
             </tfoot>-->
       
            
                       <%
                          
                      try {
                            String ip = getServletContext().getInitParameter("ip");
                          
                         MongoClient mongoClient = new MongoClient( ip  , 27017 );
                         DB db = mongoClient.getDB("baazaronline");
                         DBCollection collection = db.getCollection("pincode");
                        // out.print("<h1>"+collection.getReadPreference()+"</h1>");
                         DBCursor cursor = collection.find();
                     // cursor.getQuery();
                   
                        DBObject query = new BasicDBObject();
                        cursor = collection.find(query);
                       
                       int i = 0;
                   %>
             
                    <tbody>
            <%
                // reading all values form from cursor object
                while (cursor.hasNext()) {
                    System.out.println("data"+cursor);
                  
                    String s= cursor.next().toString();
                   System.out.println("before"+s);
                // creating json object for conver string values to json
               
                    Object obj=JSONValue.parse(s); 
                    JSONObject jsonObject = (JSONObject) obj;
                   System.out.println("this io json object"+jsonObject);
//                   getting values from  json to string

                   String dist =  (String) jsonObject.get("District");
                    String state =  (String) jsonObject.get("State");
                   long pin = ((Long)jsonObject.get("Pincode")).intValue();
              //Planner.getPlanner().setLocationName();  
            //   int  pin =  (Integer)jsonObject.get("Pincode");
                    System.out.println("dist  "+dist+"pinnnnnnnnnnn     "+pin );
                
//                    String citso =  (String) jsonObject.get("citso");
//                    String textfiled =  (String) jsonObject.get("DefautV");
//                    String DefautV =  (String) jsonObject.get("DefautV");
//                    String UniqueV =  (String) jsonObject.get("UniqueV");
//                    String ValuesR =  (String) jsonObject.get("ValuesR");
//                    String IVSO =  (String) jsonObject.get("IVSO");
                   %>
            <tr>
                <td><%out.print(dist);%></td>
                <td><%out.print(pin);%></td>
                  <td><%out.print(state);%></td>
            </tr>
                     
         <%
               }
         %>
         <% }
      catch (Exception e) {
System.out.println("exeption"+e);
System.out.println("exeption"+e);
}
         %>
         
                    </tbody>   
    </table>
       
                    
                  
  
            <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
            <script>$(document).ready(function() {
   // Setup - add a text input to each footer cell
           $('#example thead th').each( function () {
           var title = $(this).text();
           $(this).html( title + ' : <input type="text" placeholder="Search '+title+'" />' );
    } );
 
  // DataTable
    var table = $('#example').DataTable();
 
    // Apply the search
    table.columns().every( function () {
          var that = this;
 
        $( 'input', this.header() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
} );</script>
           
</body>
</html>
<%@include file="Footer.jsp" %>