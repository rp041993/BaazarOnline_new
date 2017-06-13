<%-- 
    Document   : CreateAttributeSet
    Created on : 4 Mar, 2017, 2:22:23 PM
    Author     : baazarteam4
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>

<!DOCTYPE html>
<%@include file="Header.jsp" %>
  
                   <%
                      try {
                         String ip = getServletContext().getInitParameter("ip");
                          MongoClient mongoClient = new MongoClient( ip , 27017 );
                      DB db = mongoClient.getDB("baazaronline");
                      DBCollection collection = db.getCollection("Attribute");
                        // out.print("<h1>"+collection.getReadPreference()+"</h1>");
                      DBCursor cursor = collection.find();
                      DBCursor cursor2 = collection.find();
                     // cursor.getQuery();
                    
                    DBObject query = new BasicDBObject("Attribute", "Attribute");
                    cursor = collection.find(query);
                     DBObject query2 = new BasicDBObject("attset", "Attribute");
                    cursor2 = collection.find(query);
                   int i = 0;
                   %>
            
        <!-- main content -->
        
                    <form action="UpdateAttSet" method="get">
                        <div class="w- -" id="n_multiselect">
                            <div class="w-box-header">
                                <h4>Edit Attribute Set</h4>
                            </div>
                            <div class="w-box-content cnt_a">
                                <div class="row-fluid">
                                    <div class="span5">
                                   <div class="formSep">
                                        <label class="req f-error" >Enter Attribute Set Name</label>
                                        <input value="<%=request.getParameter("Attribute_code")%>" class="span10" type="text" name="name" required id="Attribut">
                                    </div> 
                              
                           
                                        <label> Select Attribute </label>
                                        <div class="span6">
                                        <div id="div2"  ondrop="drop(event)" ondragover="allowDrop(event)">
                                        <select id="sel1" multiple="multiple" name="aaa"  >
                                              <%   
                while (cursor.hasNext()) { 
                    //DBObject str= cursor.next();
                    //System.out.println(str);
                    String s= cursor.next().toString();
                    System.out.println("before"+s);
                   
                     Object obj=JSONValue.parse(s);  
                   JSONObject jsonObject = (JSONObject) obj;
                   System.out.println("this io json object"+jsonObject);
                    
                   System.out.println("this is debuging  "+s);
//                   out.println("<h1>heeeer"+s+"</h1>");
                
                    String id =  (String) jsonObject.get("attcode");%> 
                    <%out.println(id);%>
                                            <option  value="<%out.print(id);%>" draggable="true" ondragstart="drag(event)" id="<%out.print(id);%>"><%out.print(id);%></option>
                                              <%  }%>  </div>
               <%} catch (Exception e) {
               }
   
                     
                    %>
                                        </select>
                                            </div>
                                    </div>
                                         <div id="div1"  ondrop="drop(event)" ondragover="allowDrop(event)">
                                              <select id="sel2" multiple="multiple" name="multiple"  required="selected">
                                     <%
                                           String ip = getServletContext().getInitParameter("ip"); 
                                         String a1 = request.getParameter("Attribute_code");
                                                 MongoClient client = new MongoClient(ip, 27017);
                                                 MongoDatabase database = client.getDatabase("baazaronline");
                                                 MongoCollection<Document> collection = database .getCollection("Attribute");
                                                 BasicDBObject doc = new BasicDBObject("Name", a1);
            
            List<Document> attributeSet = (List<Document>) collection.find(doc).into(new ArrayList<Document>());
            System.out.println("emolyee"+attributeSet);
                   int i=0;
              for (Document attribure : attributeSet) {
                  
                     Object ss =  attribure.get("Name");
                      String name =ss.toString();
                     List<Document> value = (List<Document>) attribure.get("Attributes");
                     System.out.println("name  "+name +"    valuese"+value);
                       for ( i = 0; i < value.size(); i++) {
     
%>
                                    
                                          
                                    
                               <option selected="selected" value="<%out.print(value.get(i));%>" draggable="true" ondragstart="drag(event)" id="<%out.print(value.get(i));%>" ><%out.print(value.get(i));%></option>
                                            
                                           
                <%} }%>
                                        
      
                                     </div>
               
                                        </select>
                                            </div>
              <div class="btn-toolbar">
              <div><input type="submit" value="save" id="select_all"></div>
             </div>
 </div>
</div>
 </form>

                  
              <div>
                <div class="footer_space"></div>
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
     
<script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
</script>

<script type="text/javascript">
var options1 = $('#sel1 option');
var options2 = $('#sel2 option');
 
var sel1=[];
var sel2=[];
var values = $.map(options1 ,function(option) {
  sel1.push(option.id);
});

var values1 = $.map(options2 ,function(option) {
       sel2.push(option.id);
});
    for (var i = 0; i < sel2.length; i++) {
        
       
        for (var j = 0; j < sel1.length; j++) {
            
            if (sel2[i]==sel1[j])
            {
                $("#"+sel1[j]).remove();
           
             }
              

          }
     
}
  
$('#select_all').click(function() {
    $('#sel2 option').prop('selected', true);
});    
</script>


<%@include file="Footer.jsp" %>