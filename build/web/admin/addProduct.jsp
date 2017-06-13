
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
div.tab {
    float: left;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    width: 20%;
    height: 300px;
}

/* Style the buttons inside the tab */
div.tab button {
    display: block;
    background-color: inherit;
    color: black;
    padding: 10px 10px;
    width: 100%;
    border: none;
    outline: none;
    text-align: left;
    cursor: pointer;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current "tab button" class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    float: left;
    padding: 0px 12px;
    border: 1px solid #ccc;
    width: 70%;
    border-left: none;
    height: 300px;
}
</style>

<%
      String ip = getServletContext().getInitParameter("ip");
 String Buttton = request.getParameter("B").toString();
 String Product_id = request.getParameter("p_id").toString();
 String AttributeSet=request.getParameter("AttributeSet");

%>

<%if(Buttton.equals("nw")){ %>
<form id='form'>

<div id="Add_Product" class="span12">
    <div class="w-box-header" >
                <h4>Add Product</h4>
                <button type="submit" id="save_product" value="Save_Product" class="btn" >Save Product</button>
    </div>
       <div class="w-box-content">
           
      <input type="hidden" id="p_id" value="<%=Product_id%>">
         <div class="formSep">                                                                                                                    
              <label class="req">Product Name</label>                                
              <input id="gpname" class="span10" type="text" name="Product_Name"  value="" onchange="sendInfo();" required > 
              <label  id='product_message' class="error" ></label>
         </div>                                       
<script> 
    var request; 
    function sendInfo()  
    {  
       var x=document.getElementById('gpname').value;
       console.log(x);
    
    var url="sellerProductAjax?val="+x;  
    
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
    var val=request.responseText; 
    console.log(val);
    if(val=="Product already exists")
    {
        console.log("11111111111111111");
        document.getElementById('product_message').innerHTML = "Product already exists";
        document.getElementById('save_product').disabled = true;
        document.getElementById('save_product').style.cursor="not-allowed";
    }  
    else
    {
        document.getElementById('product_message').innerHTML = "";
        document.getElementById('save_product').disabled = false;
        document.getElementById('save_product').style.cursor="";
        
    }
    }  
}
</script>    
         <div class="formSep" >  
               <label class="req">Discription</label>  
               <textarea style="width:80%;" class="span10" required rows="4" cols="5" type="text" name="Description"></textarea>
               
        </div>       
   <div class="formSep">
               <label class="req">Short Discription</label>  
               <textarea id="shrtdis" class="span10" required type="text" name="Short_Discription" style="width:80%;"></textarea>
   </div>

          <div class="formSep">
               <label class="req">SKU</label>                                        
               <input id="SKU" class="span10" type="text" required name="SKU" onchange='sendInfo2();' required  />
               <label  id='SKU_message' class="error" ></label>
          </div>
<script> 
    var request;
    function sendInfo2()  
    {  
       var y=document.getElementById('SKU').value;
       console.log("huhguhu"+y);
    
    var url="sellerSKUAjax?val="+y;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getInfo2;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getInfo2(){  
    if(request.readyState==4){  
    var val=request.responseText; 
    
    if(val=="SKU must be unique")
    {
        document.getElementById('SKU_message').innerHTML = "SKU must be unique";
        document.getElementById('save_product').disabled = true;
        document.getElementById('save_product').style.cursor="not-allowed";
    }  
    else
    {
        document.getElementById('SKU_message').innerHTML = "";
        document.getElementById('save_product').disabled = false;
        document.getElementById('save_product').style.cursor="";
        
    }
    }  
}
</script>
           <div class="formSep">                                                                                             
                  <label class="req"> Price</label>                                
                   <input id="pprice" class="span10" type="text" name="price"  value="" required>                                                                          
           </div>                                       
   
        <div class="formSep">
               <label >Special Price</label>                                        
               <input id="spprice" class="span10" type="text" name="special_price" />
         </div>                                    	
         <div class="formSep">
              <label class=""> Special Price From Date</label>
              <div class="w-box" id="n_datepicker">
                                        <div class="row-fluid">
                                            <input class="span10"  data-date-format="dd/mm/yyyy" id="dp1" type="text" name="Special_price_from_date"  >
                                          </div>
              </div> 
          </div>	
          <div class="formSep">
              <label class=""> Special Price to Date</label>
              <div class="w-box" id="n_datepicker">
                                        <div class="row-fluid">
                                            <input class="span10"  data-date-format="dd/mm/yyyy" id="dp2" type="text" name="Special_price_to_date"  >
                                          </div>
              </div> 
          </div>	
         <div class="formSep">
               <label class="req">Stock</label>                                        
               <input id="stock" class="span10" type="text" name="stock_qty" required />
          </div>
        <div class="formSep">
               <label class="req">Stock Availability</label>                                        
               
               <select name="Stock" required >
                   <option value="In_stock" name="Stock" >In stock</option>
                     <option value="Out_of_stock" name="Stock" >Out of stock</option>
               </select>
        </div>   
           
           
            <div class="formSep">
      <label id="weight_user"  class="req" style="color: black;">Weight</label>
      <input id="vm_ex_weight" type="text"  value="" name="Product_weight" required onchange="myFunction(this.id);">Kg
       <label  id='vm_ex_weight1' class="error" ></label>     </div> 

<div class="formSep" id="1" >
          <label  class="req" style="color: black;">Length</label>
          <input id="length" type="text"  value="" name="Product_lenght" required onchange="myFunction(this.id)" >cm
           <label  id='length1' class="error" ></label> </div> 
           <div class="formSep" id="2" >
      <label  class="req" style="color: black;">Width</label>
      <input id="width" type="text"  value="" name="Product_width" required onchange="myFunction(this.id)" >cm
      <label  id='width1' class="error" ></label>      </div> 
      <div class="formSep" id="3" >
      <label  class="req" style="color: black;">Height</label>
      <input id="height" type="text"  value="" name="Product_height" required onchange="myFunction(this.id);" >cm
      <label  id='height1' class="error" ></label>      </div> 
      <input type="button" value="shipment weight" onclick="Cal_weight();">
      <script>
function myFunction(id) {
    var x, text;
  
    // Get the value of the input field with id="numb"
    x = document.getElementById(id).value;

    // If x is Not a Number or less than one or greater than 10
    if (isNaN(x) ) {
        
       document.getElementById(id+"1").innerHTML="Enter numeric value only";
       document.getElementById()
       
    } 
    else {
       document.getElementById(id+"1").innerHTML=""; 
    }
   
}
</script>      
<script>
     function Cal_weight()
     {
         var weight=document.getElementById("vm_ex_weight").value;
         var Product_shipment_weight=0;
         var width=document.getElementById("width").value;
         var height=document.getElementById("height").value;
         var length=document.getElementById("length").value;
         var val=(width * height * length) / 5000;
         var integr = Math.floor(val), decimal = val - integr;
      
         (decimal<=.5 && decimal>=0)?(Product_shipment_weight=integr+.5):(Product_shipment_weight=integr+1)
         
         var x=Math.max(weight,Product_shipment_weight);
         document.getElementById("4").hidden=false;
         document.getElementById("vm_Product_shipment_weight").value=x;
         document.getElementById("f_weight").value=weight;
         document.getElementById("f_height").value=height;
         document.getElementById("f_width").value=width;
         document.getElementById("f_length").value=length;
         document.getElementById("f_shipping_weight").value=x;
     }
</script>
<div class="formSep" id="4" hidden >
      <label id="weight_user"  style="color: black;">Calculated weight for shipment</label>
      <input id="vm_Product_shipment_weight" type="text"  value="" name="Product_shipment_weight" readonly>Kg
            </div> 
<div hidden>
    <input type="hidden" id="f_weight" name="f_weight" value>
    <input type="hidden" id="f_height" name="f_height" value>
    <input type="hidden" id="f_width" name="f_width" value>
    <input type="hidden" id="f_length" name="f_length" value>
    <input type="hidden" id="f_shipping_weight" name="f_shipping_weight" value>
</div>
                                    
                    <%
                                       String cid = request.getAttribute("cid").toString();

                                          Mongo mg1 = new Mongo( ip ,27017);
                            DB db1 = mg1.getDB("baazaronline");
                            DBCollection collection2 = db1.getCollection("Attribute");
                            DBObject doc4 = new BasicDBObject("Name",AttributeSet);
                                DBCursor cursor2 = collection2.find(doc4);
                                 while(cursor2.hasNext())
                                 {
                                  BasicDBObject dbObject = (BasicDBObject) cursor2.next();
                                  BasicDBList list = (BasicDBList) dbObject.get("Attributes");
                                for(Object obj : list ){
                                                        BasicDBObject doc5 = new BasicDBObject("attcode",obj);
                                                        DBCursor cursor5 = collection2.find(doc5);
                                                        while(cursor5.hasNext())
                                                           {
                                                               DBObject str5= cursor5.next();
                                                               String visible_name=(String)str5.get("Visiblename");
                                                               String inpute_type=(String)str5.get("citso");
                                                        
                                      %>
    
                       <%
                                      
                         if ( "Text Field".equals(inpute_type)) {
                             %>
                                  <div class="formSep" id="visible_name_id">
                                  <label class="req"> <%out.print(visible_name);%></label>
                                  <input value="" class="span10" type="text" name="<%out.print(visible_name);%>" required  id="val1_text"/>
                                  </div>
                             <% } 


         if ("Text Area".equals(inpute_type)) {
           
                             %>
                             <div class="formSep" id="textarea_id" >
                                <label >Text Area</label>
                                  <textarea id="textareaid" rows="5" cols="15" name=<%out.print(visible_name);%> >
                                     </textarea>
                                   </div><%}
            
        if ("Date".equals(inpute_type)){
                                 %>
                     <div class="formSep" id="date_id" >
                       <label class="req"><%out.print(visible_name);%></label>
                         <input name="<%out.print(visible_name);%>" id="dp3" class="span10" type="text" data-date-format="dd/mm/yyyy" value="" >
                           <span class="help-block">dd/mm/yyyy</span>
                                  </div>
                       <%}
        if ("Yes/No".equals(inpute_type)) {
                    
                                        }
        if ("Drop Down".equals(inpute_type)) {
                
                    %>
                         <div class="formSep" id="drop_down_id" >
                            <label class="req"><%out.print(visible_name);%></label>
                                <select name="<%out.print(visible_name);%>" id="val1_sport" class="span10" onchange="check()">
                                  <%
                               
                                  BasicDBList list1 = (BasicDBList) str5.get("values");
                                for(Object obj1 : list1 ){
                                   %>
                                 <option value="Text Area" name="<%out.print(visible_name);%>"><%=obj1%></option>  
                              <%}%>
                                  </select>
                                    </div>
                    
                          <%}
        if ("Price".equals(inpute_type)) {
                          %>
  
                                  <div class="formSep" id="price_id">
                                  <label class="req"> <%out.print(visible_name);%></label>
                                  <input value="" class="span10" type="text" name="<%out.print(visible_name);%>" />
                                  </div><%}%>
                                  
                       
                       <%}}}  %>    
                       <input value='<%=session.getAttribute("User_ID")%>' class="span10" type="hidden" name="User_ID" />
                       <input type="hidden" id="cid" name="cid" value="<%=cid%>" />
                               <tr><td><input type="button" value="Show Policy" onclick="show_table();"></td><td>
                                       <input type="button" value="Hide Policy" onclick="hide_table();"></td></tr>
                       <script>
                           function show_table()
                           {
                               document.getElementById("table").hidden=false;
                               var Price=  document.getElementById("pprice").value;   
     
            var Commission=(Price*.08);
            var Shipment_weight=50;
            var Packaging_cost=50;
            var Packaging_salary=50;
            var Service_Tax=(Commission*.15);
            
            var in_Hand=(Price-(Commission+Shipment_weight+Packaging_cost+Packaging_salary));
            document.getElementById("span1").value=Commission;
            document.getElementById("span2").value=Shipment_weight;
            document.getElementById("span3").value=Packaging_cost;
            document.getElementById("span4").value=Packaging_salary;
            document.getElementById("span5").value=Service_Tax;
            document.getElementById("span8").value=in_Hand;
        
                           }
                           function hide_table()
                           {
                               document.getElementById("table").hidden=true;
                           }
                           </script>
                       <div id="table" hidden>
             <table id="example" class="display" width="70%" cellspacing="0" style="font-size:12px !important;">
        <thead>
            <tr>
                <th>Commission 8%</th>
                <th>Shipment charge</th>
                <th>Packaging cost</th>
                <th>Packaging salary</th>
                <th>Service Tax 15% on commission</th>
                <th>In hand </th>
            </tr>
        </thead>
        <script>
     
   </script>
        
            
            
             
     
            <tr  style="cursor:hand">
                <td ><input type="text" id="span1"></td>
                <td ><input type="text" id="span2"></td>
                <!--///////////////////////////////////////-->
                <td ><input type="text" id="span3"></td>
                <td ><input type="text" id="span4"></td>
                <td ><input type="text" id="span5"></td>
                <td ><input type="text" id="span8"></td>
                <!--///////////////////////////////////////////-->
                            </tr>
            
       </tbody>
    </table>
                       </div>  
       
       </div>
</div>
 </form>
             
             
                       <!--///////////////////////////////Update///////////////////////////////////////////////-->
<%} else{%>
 <form id='form'>

     <div id="General" class="span11" >
   <div class="w-box-header">
                <h4>Add Your Product Price</h4>
                <button type="submit" id="save_product" value="Update_Product" class="btn" >Update Product</button>
    </div>
       <div class="w-box-content">
          <%
         
          Mongo mg = new Mongo( ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("products");
            DBObject doc = new BasicDBObject("_id",new ObjectId(Product_id));
                DBCursor cursor = collection.find(doc);
                 while(cursor.hasNext())
                 {
                 
                 DBObject str=cursor.next();
                 String Tax=(String)str.get("Tax");
          %>
          <input type="hidden" id="p_id" value="<%=Product_id%>">
         <div class="formSep">                                                                                                                    
              <label class="req" >Product Name</label>                                
              <input id="gpname" class="span10" type="text" name="Product_Name"  placeholder="<%=str.get("Product_Name")%>"  readonly > 
              <label  id='product_message' class="error" ></label>
         </div>                                       

         <div class="formSep" >  
             <label class="req" >Discription</label>  
               <textarea style="width:80%;" class="span10" rows="4" cols="5" type="text" name="Description" placeholder="<%=str.get("Description")%>" readonly ></textarea>
               
        </div>       
   <div class="formSep">
               <label class="req" >Short Discription</label>  
               <textarea id="shrtdis" class="span10" type="text" name="Short_Discription" placeholder="<%=str.get("Short_Discription")%>" style="width:80%;" readonly ></textarea>
   </div>
    
          <div class="formSep">
               <label class="req">SKU</label>                                        
               <input id="SKU" class="span10" type="text" name="SKU" value="" onchange='sendInfo2();' required  />
               <label  id='SKU_message' class="error" ></label>
          </div>
<script> 
    var request;
    function sendInfo2()  
    {  
       var y=document.getElementById('SKU').value;
       console.log("huhguhu"+y);
    
    var url="sellerSKUAjax?val="+y;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getInfo2;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getInfo2(){  
    if(request.readyState==4){  
    var val=request.responseText; 
    
    if(val=="SKU must be unique")
    {
        document.getElementById('SKU_message').innerHTML = "SKU must be unique";
        document.getElementById('save_product').disabled = true;
        document.getElementById('save_product').style.cursor="not-allowed";
    }  
    else
    {
        document.getElementById('SKU_message').innerHTML = "";
        document.getElementById('save_product').disabled = false;
        document.getElementById('save_product').style.cursor="";
        
    }
    }  
}
</script>
           <div class="formSep">                                                                                             
                  <label class="req"> Price</label>                                
                   <input id="pprice" class="span10" type="text" name="price"  value="" required="">                                                                          
           </div>                                       

        <div class="formSep">
               <label >Special Price</label>                                        
               <input id="spprice" class="span10" type="text" name="special_price" />
         </div>                                    	
         <div class="formSep">
              <label > Special Price From Date</label>
              <div class="w-box" id="n_datepicker">
                                        <div class="row-fluid">
                                            <input class="span10"  data-date-format="dd/mm/yyyy" id="dp1" type="text" name="Special_price_from_date" value  >
                                          </div>
              </div> 
          </div>	
          <div class="formSep">
              <label> Special Price to Date</label>
              <div class="w-box" id="n_datepicker">
                                        <div class="row-fluid">
                                            <input class="span10"  data-date-format="dd/mm/yyyy" id="dp2" type="text" name="Special_price_to_date" value  >
                                          </div>
              </div> 
          </div>	
         <div class="formSep">
               <label class="req">Stock</label>                                        
               <input id="stock" class="span10" type="text" name="stock_qty" required />
          </div>
<%
    String User_ID3=(String)session.getAttribute("User_ID");
         DBCollection collection1 = db.getCollection("product_prices");
            DBObject doc1 = new BasicDBObject("Product_id",Product_id);
                DBCursor cursor1 = collection1.find(doc1);
                 while(cursor1.hasNext())
                 {
                 DBObject str1=cursor1.next();
                 
    String Stock= (String)str1.get("Stock");}%>
        <div class="formSep">
               <label class="req">Stock Availability</label>           
               <select name="Stock" required>
                     <option value="In_stock" name="Stock"  >In stock</option>
                     <option value="Out_of_stock" name="Stock" >Out of stock</option>
               </select>
        </div>   
           
           
            <div class="formSep">
      <label id="weight_user" style="color: black;">Weight</label>
      <input id="vm_length" class="vm_length" name="Weight" type="text"  value="<%=str.get("f_shipping_weight")%>" name="vm_length" readonly >
        
            </div> 
                                    
                    <%
                           
                                     String cid = request.getAttribute("cid").toString();

                                          Mongo mg1 = new Mongo("Localhost",27017);
                            DB db1 = mg1.getDB("baazaronline");
                            DBCollection collection2 = db1.getCollection("Attribute");
                            DBObject doc4 = new BasicDBObject("Name",AttributeSet);
                                DBCursor cursor2 = collection2.find(doc4);
                                 while(cursor2.hasNext())
                                 {
                                  BasicDBObject dbObject = (BasicDBObject) cursor2.next();
                                  BasicDBList list = (BasicDBList) dbObject.get("Attributes");
                                for(Object obj : list ){
                                                        BasicDBObject doc5 = new BasicDBObject("attcode",obj);
                                                        DBCursor cursor5 = collection2.find(doc5);
                                                        while(cursor5.hasNext())
                                                           {
                                                               DBObject str5= cursor5.next();
                                                               String visible_name=(String)str5.get("Visiblename");
                                                               String inpute_type=(String)str5.get("citso");
                                                                              
                                 
                                      %>
    
                       <%
                                      
                         if ( "Text Field".equals(inpute_type)) {
                                        
                             %>
                                  <div class="formSep" id="visible_name_id">
                                  <label class="req"> <%out.print(visible_name);%></label>
                                  <input value="<%=str.get(visible_name)%>" class="span10" type="text" name="<%out.print(visible_name);%>" readonly  id="val1_text"/>
                                  </div>
                             <% } 


         if ("Text Area".equals(inpute_type)) {
           
                             %>
                             <div class="formSep" id="textarea_id" >
                                <label >Text Area</label>
                                <textarea id="textareaid" rows="5" cols="15" readonly name=<%out.print(visible_name);%> value="<%=str.get(visible_name)%>" >
                                     </textarea>
                                   </div><%}
            
        if ("Date".equals(inpute_type)){
                                 %>
                     <div class="formSep" id="date_id" >
                       <label class="req"><%out.print(visible_name);%></label>
                       <input name="<%out.print(visible_name);%>" id="dp1" class="span10" type="text" data-date-format="dd/mm/yyyy" value="<%=str.get(visible_name)%>" readonly>
                           <span class="help-block">dd/mm/yyyy</span>
                                  </div>
                       <%}
       
        if ("Drop Down".equals(inpute_type)) {
                        
                
                    %>
                         <div class="formSep" id="drop_down_id" >
                            <label class="req"><%out.print(visible_name);%></label>
                            <select name="<%out.print(visible_name);%>" id="val1_sport" class="span10" disabled="true">
                                  <%
                                
                                  BasicDBList list1 = (BasicDBList) str5.get("values");
                                for(Object obj1 : list1 ){
                                   %>
                                 <option value="Text Area" name="<%out.print(visible_name);%>" ><%out.print(obj1);%></option>  
                              <%}%>
                                  </select>
                                    </div>
                    
                          <%}
        if ("Price".equals(inpute_type)) {
                          %>
  
                                  <div class="formSep" id="price_id">
                                  <label class="req"> <%out.print(visible_name);%></label>
                                  <input value="<%=str.get(visible_name)%>" class="span10" type="text" readonly name="<%out.print(visible_name);%>" />
                                  </div><%}%>
                                  
                       
                       <%}}}  %>    
                       <input value='<%=session.getAttribute("User_ID")%>' class="span10" type="hidden" name="User_ID" />
                       <input type="hidden" id="cid" name="cid" value="<%=cid%>" />
             <%} mg.close();%>
       </div>
</div>
       
 </form>
 <%}%>
  <!--/////////////////////////////////////////End///////////////////////////////////////////////--> 

 
<!-- 
--><script>       

$(document).ready(function(){
    
    (function ($) {
    $.fn.serializeFormJSON = function () {

        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
})(jQuery);
    
    $("#submit").submit(function(){
//        var width=document.getElementById("f_width").value;
//        var height=document.getElementById("f_height").value;
//        var length=document.getElementById("f_length").value;
//        var weight=document.getElementById("f_weight").value;
//        var shipping_weight=document.getElementById("f_shipping_weight").value;
//        
//        
//        var weight1=document.getElementById("vm_ex_weight").value;
//         var width1=document.getElementById("width").value;
//         var height1=document.getElementById("height").value;
//         var length1=document.getElementById("length").value;
//         var vm_Product_shipment_weight=document.getElementById("vm_Product_shipment_weight").value;
//         if(width!=width1 || height!=height || length!=length || weight||weight1 || shipping_weight!=vm_Product_shipment_weight)
//         {
//             alert(Please click on shipment weight);
//             
//         }
//        else{
        var data = JSON.stringify( $('form').serializeFormJSON() );
        var button=document.getElementById('save_product').value;
        var P_id=document.getElementById('p_id').value;
        
        var Success = false;
      alert(data);
     
   $.ajax({
      
        url: 'SaveProduct?test='+data+'&B='+button+'&P_id='+P_id,
        type: 'POST',
        async:false,
        cache: false,
        contentType: 'application/json; charset=utf-8',
       dataType: 'text',  
        data: { 
      loadProds: 1,
      test: data,
      B:button,
      P_id:P_id 
      // look here!
    },
       
      success: function() {
          Success = true;
          window.location='Show_Products.jsp';
          alert("sucess");
          
     }
     
        
});
       
//        }    
   
    }); 
});

///////////////////////////////////////////////

</script>

<%@include file="Footer.jsp" %>