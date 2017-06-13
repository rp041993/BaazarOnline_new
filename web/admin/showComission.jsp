<%-- 
    Document   : aaaa
    Created on : 8 Mar, 2017, 5:40:45 PM
    Author     : baazarteam4
--%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="Header.jsp"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    </head>
    <body>
        <a href="selectCatagory.jsp"> <input type="button" value=" +Add New "></a>
        <table id="example" class="display" width="100%" cellspacing="0" style="text-align: center">
        <thead>
            <tr>
                <th> cid</th>
                <th>Name</th>
                <th> Commission</th>
                <th> Shippment</th>
                <th>Packaging_Cost</th>
                <th> Labour_salary</th>
                <th>Services_Tax</th>
                <th>Edite</th>
               
            </tr>
       
        </thead>
                               <tfoot>
                                    <tr>
                                        <th> cid</th>
                                        <th>Name</th>
                                        <th> Commission</th>
                                        <th> Shippment</th>
                                        <th>Packaging_Cost</th>
                                        <th> Labour_salary</th>
                                        <th>Services_Tax</th>
                                        <th>Edite</th>
               
                                    </tr>
                               </tfoot>
                       <%
                      try {
                            String ip = getServletContext().getInitParameter("ip");
                         MongoClient mongoClient = new MongoClient( ip , 27017 );
                         DB db = mongoClient.getDB("baazaronline");
                         DBCollection collection = db.getCollection("baazarCommision");
                      
                         DBCursor cursor = collection.find();
                    
                    
                       
                        cursor = collection.find();
                       int i = 0;
                   %>
        <tbody>
            <% 
                // reading all values form from cursor object
                while (cursor.hasNext()) { 
                   
                    String s= cursor.next().toString();
                    System.out.println("before"+s);
                // creating json object for conver string values to json
                
                    Object obj=JSONValue.parse(s);  
                    JSONObject jsonObject = (JSONObject) obj;
                    System.out.println("this io json object"+jsonObject);
//                   getting values from  json to string

                    String cid =  (String) jsonObject.get("cid");
                    String cname =  (String) jsonObject.get("cname");
                    int Commission =  Integer.parseInt(jsonObject.get("Commission").toString());
                    int Shippment =  Integer.parseInt( jsonObject.get("Shippment").toString());
                    int Packaging_Cost = Integer.parseInt(jsonObject.get("Packaging_Cost").toString());
                    int Labour_salary =  Integer.parseInt(jsonObject.get("Labour_salary").toString());
                    int Services_Tax =  Integer.parseInt( jsonObject.get("Services_Tax").toString());
                    
                 
                   %> 
            <tr>
                <td><%out.print(cid);%></td>
                <td><%out.print(cname);%></td>
                <td><%out.print(Commission);%></td>
                <td><%out.print(Shippment);%></td>
                <td><%out.print(Packaging_Cost);%></td>
                <td><%out.print(Labour_salary);%></td>
                <td><%out.print(Services_Tax);%></td>
                <td><a href="EditeCommission.jsp?cid=<%=cid%>&type=edit&name=<%=cname%>">edite</a></td>
            </tr>
                      
         <% 
               }

               }
      catch (Exception e) {}
                     
                    %>
       </tbody>
    </table>
        
            <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
            <script>$(document).ready(function() {
   // Setup - add a text input to each footer cell
           $('#example tfoot th').each( function () {
           var title = $(this).text();
           $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
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
    </body>
</html>
<%@ include file="Footer.jsp"%>