<%-- 
    Document   : aaaa
    Created on : 8 Mar, 2017, 5:40:45 PM
    Author     : baazarteam4
--%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.mongodb.MongoClient"%>

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
        <a href="AddAttribute.jsp"> <input type="button" value=" +Add New Atrribute"></a>
        <table id="example" class="display" width="100%" cellspacing="0" style="text-align: center">
        <thead>
            <tr>
                <th> Attribute Code</th>
                <th> Name visible</th>
                <th> Catalog Input Type for Store Owner</th>
                <th>Default Value</th>
                <th> Unique Value</th>
                <th>Values Required</th>
                <th>Input Validation for Store Owner</th>
                <th>Edit</th>
            </tr>
        </thead>
                               <tfoot>
                                    <tr>
                                        <th> Attribute Code</th>
                                        <th> Name visible</th>
                                        <th> Catalog Input Type for Store Owner</th>
                                        <th>Default Value</th>
                                        <th> Unique Value</th>
                                        <th>Values Required</th>
                                        <th>Input Validation for Store Owner</th>
                                        <th>Edit</th>
                                    </tr>
                               </tfoot>
                       <%
                      try {
                            String ip = getServletContext().getInitParameter("ip");
                         MongoClient mongoClient = new MongoClient( ip , 27017 );
                         DB db = mongoClient.getDB("baazaronline");
                         DBCollection collection = db.getCollection("Attribute");
                        // out.print("<h1>"+collection.getReadPreference()+"</h1>");
                         DBCursor cursor = collection.find();
                     // cursor.getQuery();
                    
                        DBObject query = new BasicDBObject("Attribute", "Attribute");
                        cursor = collection.find(query);
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

                    String id =  (String) jsonObject.get("attcode");
                    String VisibleName =  (String) jsonObject.get("Visiblename");
                    String citso =  (String) jsonObject.get("citso");
                    String textfiled =  (String) jsonObject.get("DefautV");
                    String DefautV =  (String) jsonObject.get("DefautV");
                    String UniqueV =  (String) jsonObject.get("UniqueV");
                    String ValuesR =  (String) jsonObject.get("ValuesR");
                    String IVSO =  (String) jsonObject.get("IVSO");
                   %> 
            <tr>
                <td id="<%out.print(id);%>"><%out.print(id);%></td>
                <td><%out.print(VisibleName);%></td>
                <td style="cursor:hand"><%out.print(citso);%></td>
                <td><%out.print(DefautV);%></td>
                <td><%out.print(UniqueV);%></td>
                <td><%out.print(ValuesR);%></td>
                <td><%out.print(IVSO);%></td>
                <td><a href="EditeAttribute.jsp?Attribute_code=<%out.print(id);%>&Visible_name=<%out.print(VisibleName);%>&citso=<%out.print(DefautV);%>&Default_Value=<%out.print(DefautV);%>&unique_value=<%out.print(UniqueV);%>&Values_requier=<%out.print(ValuesR);%>&IVFSWAT=<%out.print(IVSO);%>">Edite</a></td>
                
            </tr> </a>
                      
         <% 
               }

               }
      catch (Exception e) {}
                     
                    %>
       </tbody>
    </table>
        </div>
        </div>
   <div>
 <div class="footer_space"></div>
</div>
<div>         
    <div class="footer_space"></div>
</div>
<div>
    <div class="footer_space"></div>
</div>

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
<%@ include file="Footer.jsp"%>