<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@include file="Header.jsp" %>

<!DOCTYPE HTML>
<html lang="en-US">
    
    <head>
        <script src="../js/form/bootstrap-fileupload.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <title>BaazarOnline</title>
      <style>
          
       table{font-size:13px;} 
       
       
       tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
    tfoot {
    display: table-header-group;
}
        </style><link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
                                                <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>   
          
    </head>
    
    <%
        String name1="";
          String ip = getServletContext().getInitParameter("ip");
    Mongo mg = new Mongo(ip,27017);
                      DB db = mg.getDB("baazaronline");
                      DBCollection collection = db.getCollection("categories");
                      BasicDBObject doc = new BasicDBObject();
    DBCursor cursor=collection.find();
    
    
    %>
    <body class="bg_d" >
      
        <div class="main-wrapper">
            <div class="container">
                
                <div class="row-fluid">
                    <div class="span3">
                        
                        <div class="w-box">
                            <div class="w-box-header">
                                <i class="splashy-add_small" style="color:#006dcc; margin-top: 0px;"></i><h4>Category</h4>
                            </div>
                            <div class="w-box-content">
                               
                                <input class="btn btn-small" type="button" name="Add" value="Add Root category" onclick="location.href='Category_form.jsp'"> 
                                <input class="btn btn-small" id="btnsub1" type="button"  value="Add Subcategory" onclick="app1();" name="Add sub category" disabled="" style="color: #83b3bb;cursor:not-allowed " title="select any category"  >
                               <script>
                                    function app(){
                $('#115').load('Category_form.jsp #115');
                               }                                   
                function app1(){
                    document.getElementById('submitbtn').value="Save subcategory";
             var idvalue=document.getElementById('100001').value; 
                  console.log(idvalue);  
                  document.getElementById('100002').value="Addsubcategory";
                  document.getElementById("10001").value=""; 
//    document.getElementById("10002").value="";
       document.getElementById("10004").value="";
       document.getElementById("10005").value="";
       document.getElementById("10006").value="";
       document.getElementById("10010").value="";
       document.getElementById("image_cat").src="";
       document.getElementById("optionset").selected=true;
       document.getElementById("multipleSelections").options.length=0;
//    document.getElementById("10007").value="";
//    document.getElementById("10008").value="";
       
                }
                                </script>      
                                <%       
                      
                       while(cursor.hasNext())
                       {
                       DBObject str=cursor.next();
                                  
                                  
                                  %>
                                    <ul id="pageNav">
                                        <li><a onclick="callforvat('<%=(Object)str.get("_id")%>'),sendInfo('<%=(Object)str.get("_id")%>'),document.getElementById('111113').innerHTML=this.innerHTML"><%=(String)str.get("Name")%></a> </li>
                            <%  }%>
                            </ul>
                             
                            </div>
                        </div>
                    </div> 
                    <div  class="span9" >
                       
                        <div class="w-box" >
                            <div class="w-box-header" >
                                <h4 id="111113" >Add New Category</h4>
                            </div>
                            <div  class="w-box-content cnt_b" >
                                <div class="row-fluid">
                                    <div  class="span12">
                                        <form name="category_form" action="Categorysubmit1" method="post" enctype="multipart/form-data" >
                                        <div  class="tabbable tabbable-bordered">
                                            
                                            <input class="btn btn-success" id="submitbtn" style="float: right;" type="submit" value="Save_category" title="Save" name="Save_category" >
                                            <ul class="nav nav-tabs" >
                                                <li class="active"><a data-toggle="tab" href="#tb1_a">General</a></li>
                                                <li><a data-toggle="tab" href="#tb1_b">Custom Design</a></li>
                                                <li><a data-toggle="tab" href="#tb1_c">Vat/Tax Section</a></li>
                                            </ul>
                                            <div class="tab-content" >
                                                <div id="tb1_a" class="tab-pane active">
                                                     
                       <input type="hidden" id="100001" name="parentid" value="123">
                       <input type="hidden" id="100002" name="categoryid" value="">
                       <table id="tabl" style="font-size:12px;" > 
                           <tr><td>web store :</td><td><select id="00001" class="span12"  name="web_store"> <option value="Art">Art</option> <option value="Culture">Culture</option> <option value="Agriculture">Agriculture</option>
                       </select> </td></tr>
                           <tr><td>Name:</td> <td><input type="text" id="10001" name="name" class="span12" required /></td></tr>
                           <tr><td>Is active:</td> <td><select id="10002" name="isActive" class="span12" ><option value="yes">yes</option><option value="no">no</option> </select></td></tr><br>
                           <tr><td>Url key:</td> <td><input type="text" id="10010" name="urlKey" class="span12" required /></td></tr>
                           <tr><td>Image:</td><td>
                                    <div class="formSep">
                                       
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 40px; height: 40px;"><img src="../img/dummy_60x60.gif" alt="" id="image_cat" ></div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 40px; height: 40px;"></div>
                                            <span class="btn btn-small btn-file"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file" id="10003" name="file"></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                               </td></tr><br>
                           <tr><td>Page title :</td><td><textarea id="10004" class="span12" cols="50"  rows="3" name="pageTitle" required></textarea></td></tr>
                         <tr><td> Meta Keywords :</td><td><textarea id="10005" class="span12"  cols="50" rows="3" name="metaKeywords" required></textarea></td></tr>
                         <tr><td>Meta Discription :</td><td><textarea id="10006" class="span12" cols="50" rows="3" name="metaDiscription" required></textarea></td></tr>
                        <tr><td>Include in nevigation menu :</td><td><select id="10007" class="span12"  name="nevigationMenu"> <option value="yes">yes</option> <option value="no">no</option>
                       </select> </td></tr>
                        <tr><td>Attribute set : </td><td><select id="10009" class="span12"  name="attributeSet" required="">
                        <%   
                           
                      DB db1 = mg.getDB("baazaronline");
                      DBCollection collection1 = db1.getCollection("Attribute");
                            BasicDBObject doc1 = new BasicDBObject("attset","AttributeSet");
                   DBCursor cursor1=collection1.find(doc1);%>
                   <option id="optionset" value="">None</option>
                   <%    while(cursor1.hasNext())
                       {
                       DBObject str=cursor1.next();
                                  
                               %>
                          <option value="<%=(String)str.get("Name")%>" onclick="call(this.value);" ><%=(String)str.get("Name")%></option> 
                       
                       <%  }%>       
  </select></td></tr></table>
           </div>                                   
                                  <div id="tb1_b" class="tab-pane">
                                      Available product listing sort by:
                                      <select multiple="" id="multipleSelections" name="available_product_listing_sort_by"  class="span12" required="" style="min-height:100px;" >
                         <option value=""></option> 
                                        </select>
                               </div>
                      
                                       <div id="tb1_c" class="tab-pane">
                                                                    
                                         
                                             
                                        <table class='table' id='example' width='100%' cellspacing='0'> 
                                            
                                             <thead>  
                                                 <tr>
                                                <th>State</th>
                                                <th>InterState Vat/Tax</th>
                                                <th>Intrastate Vat/Tax</th>
                                                 </tr>
                                             </thead>
                                        
                                        <tbody id="tbody1">
                                       
                                            </tbody>
                                        </table>  
                                         
                                                </div>
                                            </div>
                                        </div> 
                             </form></div>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
   <script>
                var request2;var attribute;
                { 
                function callforatt(att,attsort){
                   attribute=  attsort;
//                   console.log("bbbbbbbbbb"+attribute);
//                   console.log("appppppppppppppp"+attsort[1]);
                   document.getElementById("multipleSelections").options.length = 0;
                   document.getElementById("multipleSelections").selectedIndex= -1;
     
       
                var url="Categoryattributeajax?val="+att;  
      
                if(window.XMLHttpRequest){  
              request2=new XMLHttpRequest();  
              }  
              else if(window.ActiveXObject){  
              request2=new ActiveXObject("Microsoft.XMLHTTP");  
             }  
      
               try{  
                   request2.onreadystatechange=getInfo2;  
                   request2.open("GET",url,true);  
                   request2.send();  
                  }
                  catch(e){alert("Unable to connect to server");}  
                   }  
      
            function getInfo2(){  
            if(request2.readyState==4){  
               var val=JSON.parse(request2.responseText); 
               var cuisines = val;     
               var sel = document.getElementById('multipleSelections');
               for(var i = 0; i < cuisines.length; i++) {
               var opt = document.createElement('option');
           
               opt.innerHTML = cuisines[i];
               opt.value = cuisines[i];
               for(var j=0;j<attribute.length;j++){
               if(cuisines[i]==attribute[j])
               opt.selected="selected";}
               sel.appendChild(opt);
          }
        }}}
               
 </script>
    <script type="text/javascript">
               
                           var request;  
                    function sendInfo(id)  
                    {   
                               document.getElementById('btnsub1').disabled=false;
                               document.getElementById('btnsub1').style.cursor= "default";
                               document.getElementById('btnsub1').style.color="#333";
                               document.getElementById('btnsub1').title="Addsubcategory";
                               document.getElementById('submitbtn').value="update";
                            var url="CategoryAjax?val="+id;  

                            if(window.XMLHttpRequest){  
                                request=new XMLHttpRequest();  
                         }  
                                else if(window.ActiveXObject){  
                                   request=new ActiveXObject("Microsoft.XMLHTTP");  
                         }  

                            try{  
                                request.onreadystatechange=getInfo;  
                                request.open("GET",url,true);  
                                request.send();  
                                }catch(e){alert("Unable to connect to server");}  
                    }  

                    function getInfo(){  
                    if(request.readyState==4){  
                    var val=JSON.parse(request.responseText); 


                     document.getElementById("100001").value=val._id.$oid;
                     document.getElementById("10001").value=val.Name; 
                     document.getElementById("00001").value=val.webstore;
                     document.getElementById("10002").value=val.isActive;
                     document.getElementById("image_cat").src=("img/catelog_image/"+val.Image).toString();
                     document.getElementById("10010").value=val.urlKey;
                     document.getElementById("10004").value=val.pageTitle;
                     document.getElementById("10005").value=val.metaKeywords;
                     document.getElementById("10006").value=val.metaDiscription;
                     document.getElementById("10007").value=val.nevigationMenu;
                     document.getElementById("10009").value=val.attributeSet;
                     
                     if(val.available_product_listing_sort_by==null){document.getElementById("multipleSelections").options.length = 0}
                     else{
                     
//                     console.log(val.attributeSet);
                     callforatt(val.attributeSet,val.available_product_listing_sort_by);
                 }
                    }  
                    }  
    
            </script>
            <!--for attribute dropdown using ajax-->
       <script>
                            var request1;
                            function call(Dvalue){
                               document.getElementById("multipleSelections").options.length = 0;
                               document.getElementById("multipleSelections").selectedIndex= -1;
                               console.log(Dvalue);   
                               var url="CategoryAjaxDropdown?val="+Dvalue;  

                             if(window.XMLHttpRequest){  
                           request1=new XMLHttpRequest();  
                          }  
                           else if(window.ActiveXObject){  
                           request1=new ActiveXObject("Microsoft.XMLHTTP");  
                         }  

                           try{  
                           request1.onreadystatechange=getInfo1;  
                           request1.open("GET",url,true);  
                           request1.send();  
                         }catch(e){alert("Unable to connect to server");}  
                       }  

                        function getInfo1(){  
                           if(request1.readyState==4){  
                           var val=JSON.parse(request1.responseText); 
                           var cuisines = val;     
                           var sel = document.getElementById('multipleSelections');
                           for(var i = 0; i < cuisines.length; i++) {
                           var opt = document.createElement('option');
                           opt.innerHTML = cuisines[i];
                           opt.value = cuisines[i];
                           sel.appendChild(opt);
                      }
                    }
                }
            </script>
            
<script type="text/javascript">
               
                           var request4;  
                    function callforvat(cat) 
                    {  
                            var url="CategoryAjaxforVatTable?value="+cat;  

                            if(window.XMLHttpRequest){  
                                request4=new XMLHttpRequest();  
                                 }  
                                else if(window.ActiveXObject){  
                                   request4=new ActiveXObject("Microsoft.XMLHTTP");  
                                 }  

                            try{  
                                request4.onreadystatechange=get_taxTable;  
                                request4.open("GET",url,true);  
                                request4.send();  
                               }catch(e){alert("Unable to connect to server");}  
                    }  

                    function get_taxTable(){  
                    if(request4.readyState==4){  
                    //var val=JSON.parse(request.responseText);
                    
                    var jsonData = request4.responseText;
                    document.getElementById("tbody1").innerHTML=jsonData;
                    }
                   
        }  
                      
    
            </script>
    </body>
</html>
<%@include file="Footer.jsp" %>