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
                    i++;
                    %>
                         
                            <li  id="<%out.print(id);%>"  onclick="sendInfo(this.id);"  class="add"><%out.print(Name);%></li> 
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
    debugger;
     $.ajax({
      
        url: 'NewServlet?cid='+id+'&attibuteset='+value,
        type: 'GET',
         dataType: 'json', 
         async: false, success: function(result){
             
                 alert(result.jsonArray.length);
                      if (result.jsonArray.length===0) {
              
               $("#searchListUl").append('<li data-filtertext="Apple"><a href="addproductAdmin.jsp">Add Product</a></li>');
//             var obj = result.jsonArray;
//               alert(obj.length);
//               for (var i = 0; i < obj.length; i++) {
//                     alert(obj[i].more);
//                  
//             $("#searchListUl").append('<li id="'+obj[i].id+'"onclick="sendInfo(this.id);">'+obj[i].name+'</li>');
//            }
    
            
} else {
    
     var  name = result.name1;
   
             for (var i = 0; i < result.jsonArray.length; i++) {
                    var counter = result.jsonArray[i];
                    for (var j = 0; j < counter.length; j++) {
                            
                                  }

              var interstate=counter.more;
//          var ids =   JSON.parse.counter._id;
                       alert(counter._id.$oid);  
               $("#searchListUl").append('<li id="'+counter._id.$oid+'"onclick="sendInfo(this.id,this.value);" value="'+counter.attributeSet+'">'+counter.Name+'</li>');
             
        }
    
  
}
            
//           document.getElementById("buttonid").value =name;
//           document.getElementById("buttonid").name = id;
//           
         }
});
              //Commission=(Price*Commission).toFixed(2);
       
                           }
                           
    


 
  
</script>
</body>
</html>
<%@include file="Footer.jsp"%>