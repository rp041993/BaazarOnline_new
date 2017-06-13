<%-- 
    Document   : selectCatagory
    Created on : 25 Apr, 2017, 4:27:42 PM
    Author     : baazaronline4
--%>


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
                                
                                
                              String type=  request.getParameter("type");
                              
                                
                                String ip = getServletContext().getInitParameter("ip");
             try {
                 
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
                    <li  id="<%out.print(id);%>"  onclick="sendInfo(this.id);"  class="add" value="<%out.print(Name);%>"><%out.print(Name);%></li> 
 <%
                   }
}
catch(Exception e){

}  %>
                       

                                </div>
                            </div>
                        </div>
                  </div>
           </div>

  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<script>
$(document).ready(function() {
   
      
        $(".adds").click(function() {
        var ids= this.id;
        var idsf= list_basic ;
       
        var divstart = $("#Mydiv div").length + 1;
        var fieldWrapper = $("<div class=\"item \" >");
        var span = $("<div  class=\"span3\" >");
        var wbox = $("<div   class=\"w-box w-box-blue\" >");
        var odiv2 = $("<div    class=\"w-box-header\" >");
        var heder = $("<h4>Select Catagoury</h4>");
        var cdiv2 = $("</div>");
        var wboxc = $("<div class=\"w-box-content\">");
        var lisbasic = $("<div id=\"" + idsf + "\" class=\"jQ-list\">");
        var otable =  $("<table>");
        var otbody =$("<tbody id=\"" + ids + "\">");
        var ctable =  $("</table>");
        var ctbody =$("</tbody>");
        var div4  =$("</div>");
        var div5  =$("</div>");
        var div6  =$("</div>");
        var div7  =$("</div>");
        var div8  =$("</div>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"remove\" />");
        var addButton =$("<inpute type=\"button\" class=\"add\" value=\"add\"/>");
        removeButton.click(function() {
            $(this).parent().remove();
        });
        fieldWrapper.append(divstart);
         fieldWrapper.append(fieldWrapper);
        fieldWrapper.append(span);
        span.append(wbox);
        wbox.append(odiv2);
        odiv2.append(heder);
        odiv2.append(cdiv2);
        wbox.append(wboxc);
        wboxc.append(lisbasic);
//        lisbasic.append(otable);
//      lisbasic.append(otbody);
//      lisbasic.append(ctbody);
//      lisbasic.append(ctable);
        wboxc.append(div4);
        wbox.append(div5);  
        wbox.append(div6);
        wbox.append(div7);
        wbox.append(div8);
        
        
//        fieldWrapper.append(removeButton);
//        fieldWrapper.append(addButton);
       
        $("#Mydiv").append(fieldWrapper);

    });
});
</script>
<script>  
var request;  
function sendInfo(id) {
 //var lavel = document.getElementById("level1").value;  
 debugger;
var type ="<%=type%>"
alert(type);
var l=  window.document.getElementById(id).getAttribute("value");

var url = "selectSubCatagory.jsp?val="+ id +"&name=" + l+"&type="+type;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
    
  
request.open("GET",url,true);  
request.send();
request.onreadystatechange= getInfo;

}catch(e){alert("Unable to connect to server");}  
}  
  

function getInfo(value){  
if(request.readyState===4){ 
   
    var aa =value+1;
var val=request.responseText;  
console.log(val);
if (val=="null") {
    alert("there is no data");
}

try {
 document.getElementById(aa).innerHTML=val;  
} catch (e) {
        
        var ids= value+1;

        var divstart = $("#Mydiv div").length + 1;
        var fieldWrapper = $("<div class=\"item active \" >");
        var span = $("<div  class=\"span3\" >");
        var wbox = $("<div   class=\"w-box w-box-blue\" >");
        var odiv2 = $("<div    class=\"w-box-header\" >");
        var heder = $("<h4>Select Catagoury</h4>");
        var cdiv2 = $("</div>");
        var wboxc = $("<div class=\"w-box-content\">");
        var lisbasic = $("<div id=\"" + ids+ "\" class=\"jQ-list\">");
        var otable =  $("<table>");
        var otbody =$("<tbody>");
        var ctable =  $("</table>");
        var ctbody =$("</tbody>");
        var div4  =$("</div>");
        var div5  =$("</div>");
        var div6  =$("</div>");
        var div7  =$("</div>");
        var div8  =$("</div>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"remove\" />");
        var addButton =$("<inpute type=\"button\" class=\"add\" value=\"add\"/>");
        removeButton.click(function() {
            $(this).parent().remove();
        });
        fieldWrapper.append(divstart);
        fieldWrapper.append(fieldWrapper);
        fieldWrapper.append(span);
        span.append(wbox);
        wbox.append(odiv2);
        odiv2.append(heder);
        odiv2.append(cdiv2);
        wbox.append(wboxc);
        wboxc.append(lisbasic);
        lisbasic.append(otable);
        otable.append(otbody);
        otable.append(ctbody);
        lisbasic.append(ctable);
        wboxc.append(div4);
        wbox.append(div5);
        wbox.append(div6);
        wbox.append(div7);
        wbox.append(div8);
        
        
//        fieldWrapper.append(removeButton);
//        fieldWrapper.append(addButton);
       
$("#Mydiv").append(fieldWrapper);

document.getElementById(aa).innerHTML=val;  
   
}


} 

}  
  
</script>
<script>
    function sendInfo1(value) {
        debugger;
        alert(value);
    $.ajax({

            url : "FindSubcatagory?"+value,
            dataType : 'json',
            error : function() {

                alert("Error Occured");
            },
            success : function(data) {
                var receivedData = [];

                $.each(data.jsonArray, function(index) {
                    $.each(data.jsonArray[index], function(key, value) {
                        var point = [];

                            point.push(key);
                            point.push(value);
                            receivedData.push(point);

                        }); 
                });

            }
        });
    }
</script>
</body>
</html>
<%@include file="Footer.jsp"%>