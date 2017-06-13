<%-- 
    Document   : newjsp
    Created on : 1 Jun, 2017, 6:59:06 PM
    Author     : baazaronline4
--%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DB"%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="jquery.serialize-object.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
</head>
<body>

<div class="container">
  <br>
  <div id="myCarousel" class="carousel " data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" id="Mydiv">
            <div class="item active">  
        <div class="span3">
                        <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Select Catagoury</h4>
                            </div>
                            <div class="w-box-content">
                                <div id="list_basic" class="jQ-list">
                            
                            <%
                                
                        String  type  =  request.getParameter("type");
                          String att= "";         
                             
             try {
                    
                 String ip = getServletContext().getInitParameter("ip");
                 
                     MongoClient mongoClient = new MongoClient( ip , 27017 );
                     DB db = mongoClient.getDB("baazaronline");
                     DBCollection collection = db.getCollection("categories");
                     BasicDBObject doc = new BasicDBObject("parentid","null");
                     DBCursor cursor=collection.find(doc);
                    
                   //  cursor = collection.find();
                       int i = 0;
    
                      while (cursor.hasNext()) {
                    
                  
                    String s= cursor.next().toString();
                   System.out.println("before"+s);
                // creating json object for conver string values to json
               
                    Object obj=JSONValue.parse(s); 
                    JSONObject jsonObject = (JSONObject) obj;
                   
//                   getting values from  json to string
                     
                    String pid =  (String) jsonObject.get("parentid");
                    //again convert in to json
                    Object js = jsonObject.get("_id");
                    JSONObject ll = (JSONObject)js;
                    String id= (String) ll.get("$oid");
                    String Name =  (String) jsonObject.get("Name");
                     att =  (String) jsonObject.get("attributeSet");
                    i++;
                    %>
                         
                    <li  id="<%out.print(id);%>" class="hello" onclick="sendInfo(this.id);"  class="add"><%out.print(Name);%></li> 
 <%
                   }
}
catch(Exception e){

}  %>
                       

                                </div>
                            </div>
                        </div>
                  </div>
 <div class="span3">
                        <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Select subcatagoerys</h4>
                            </div>
                            <div class="w-box-content">
                                <div id="list_basic1" class="jQ-list">
<!--                                    <li  id="hello"  onclick="sendInfo(this.id);"  class="add"></li> 
                                    <input type="button" id="buttonid" value="" name="" onclick="sendInfo(this.name);">                               
                                -->
                                <input type="hidden" id="002" name="attr" value="<%=type%>">
                                <input type="hidden" id="001" name="attr" value="<%=att%>">
                                <ul data-role="listview" data-filter="true" data-theme="b" id="searchListUl">
                                 </ul>
                                </div>

           </div>

  
    </div>

    <!-- Left and right controls -->

  </div>
</div>

<script>  

function sendInfo(id,value) {
    
  
     $.ajax({
      
        url: 'Seller_ChosseCatagory?cid='+id+'&attibuteset='+value,
        type: 'GET',
         dataType: 'json', 
         async: false, success: function(result){;
                    var count=0;
             if (result.jsonArray.length===24) {
                 
                 
                  $("#searchListUl").remove('li');  
                 var att =  document.getElementById("001").value;
                 var type =  document.getElementById("002").value;
              $("#searchListUl").empty();
              
                  var url = 'Add_Product.jsp?AttributeSet='+att+'&cid='+id
              $("#searchListUl").append('<li "><a href="'+url+'">add</a></li>');
   
            
             
    } 
    else {
              $("#searchListUl").empty();
            for (var i = 0; i < result.jsonArray.length; i++) {
                  
                   var counter = result.jsonArray[i];
                   var interstate=counter.more;
                   $("#001").val=counter.attributeSet;
                   document.getElementById("001").value = counter.attributeSet;
                 
                   $("#searchListUl").append('<li id="'+counter._id.$oid+'"onclick="sendInfo(this.id);" value="'+counter.attributeSet+'"><input type="hidden" id="'+count+'"value="'+counter.attributeSet+'">'+counter.Name+'</li>');
               
                }
    
  
         }
            
      }
});

       }
                           
    


 
  
</script>
</body>
</html>
<%@include file="Footer.jsp"%>