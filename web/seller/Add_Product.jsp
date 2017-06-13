<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="admin.Validate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@include file="Header.jsp" %>

<html lang="en-US">
    <body class="bg_d">
        <%
 String AttributeSet=request.getParameter("AttributeSet");
 String cid = request.getParameter("cid").toString();
if(Validate.check_Category_validation_by_id(cid))
{%>
                                        <script>
                                            window.alert("Invalid cid");
                                            window.location='ChosseCatagory.jsp';
                                        </script>
<%}
%>
        <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Add Product</h4>
                            </div>
                            <div class="w-box-content">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <form id="wizard-validation-form" class="form-horizontal" method="POST" >
                                            <div id="wizard-validation" class="swMain">
                                                <ul>
                                                    <li>
                                                        <a href="#sw-val-step-1">
                                                            <span class="stepNumber">1</span>
                                                            <span class="stepDesc">
                                                               Product Details<small>Fill your product details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#sw-val-step-2">
                                                            <span class="stepNumber">2</span>
                                                            <span class="stepDesc">
                                                               Product Price<small>Fill your product prices</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#sw-val-step-3">
                                                            <span class="stepNumber">3</span>
                                                            <span class="stepDesc">
                                                               Additional info<small>Add additional info</small>
                                                            </span>
                                                         </a>
                                                    </li>
                                                </ul>
     <!--//////////////////////////////////////////////1111111111111111111111111111111111111111111111////////////-->
     
     
     
     
                                                    <div id="sw-val-step-1">
                                                        <h2 class="StepTitle">Step 1: Product Details</h2>
                                                        <input type="hidden" id="p_id" value="">
                                                        <div class="span6" style="margin-left: 0px;">
                                                        
                                                         <div class="formSep control-group">                                                                                                                    
                                                            <label class="req">Product Name</label>                                
                                                            <input id="gpname" class="span10" type="text" name="Product_Name"  value="" onchange="sendInfo();" required maxlength="70" > 
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
    request.onreadystatechange=ProductgetInfo;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function ProductgetInfo(){  
        
    if(request.readyState==4){  
        
    var val=request.responseText; 
    
    console.log(val);
    
    if(val=="Product already exists")
    {
        document.getElementById('product_message').innerHTML = "Product already exists";
        if(document.getElementById("SKU_message").innerHTML=="")
        document.getElementById('SKU1').style.display="block";
        document.getElementById('next').style.display="none";
        
    }  
    else
    {
        document.getElementById('product_message').innerHTML = "";
        if(document.getElementById("SKU_message").innerHTML=="")
        {
        document.getElementById('SKU1').style.display="block";
        document.getElementById('next').style.display = "block";
        }
        create_url();
    }
    }  
}
</script>   
                                                         <div class="formSep control-group">
                                                                      <label class="req">Short Description</label>  
                                                                      <textarea id="shrtdis" class="span10" required type="text" name="Short_Discription" maxlength="160"></textarea>
                                                        </div>
                                                         <div class="formSep control-group" >  
                                                            <label class="req">Description</label>  
                                                            <textarea  class="span10" required rows="4" cols="5" type="text" name="Description"></textarea>
                                                         </div> 
                                                         <div class="formSep control-group" >  
                                                            <label class="req">Meta Keywords</label> 
                                                            <input class="span10" type="text" name="Meta_key" id='Meta_key'  value="" required maxlength="50" onchange="" > 
                                                         </div> 
<script>
    
    function create_url()
    
    {
                var Meta_key=document.getElementById("gpname").value;
                var URL=Meta_key.replace(/\s/g, "-");
                document.getElementById("url").value=URL;
    }
</script>
                                                    
                                                    
                                                    </div>   
                                                    <div class="span6">
                                                    
                                                           <div class="formSep">                                                                                                                    
                                                                <label >Url</label>                                
                                                                <input id="url" class="span10" type="text"   value="" readonly > 
                                                            </div> 
                                                        <div class="formSep control-group" id="SKU1" >
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
        document.getElementById('next').style.display="none";
    }  
    else
    {
        document.getElementById('SKU_message').innerHTML = "";
        if(document.getElementById("product_message").innerHTML=="")
        document.getElementById('next').style.display="block";
       
    }
    }  
}
</script>
                                                           <div class="formSep  control-group">
                                                                <label class="req" >Status </label>
                                                                <select name="Status" class="span10">
                                                                 <option value="Enable">Enable</option>
                                                                 <option value="Disable">Disable</option>
                                                                </select>
                                                            </div>
                                                           <div class="formSep control-group">
                                                                <label class="req">Stock</label>                                        
                                                                <input id="stock" class="span10" type="digits" name="stock_qty" required />
                                                           </div>
                                                           <div class="formSep control-group ">
                                                                    <label class="req">Stock Availability</label>                                        

                                                                    <select name="Stock" class="span10" required >
                                                                        <option value="In_stock" name="Stock" >In stock</option>
                                                                          <option value="Out_of_stock" name="Stock" >Out of stock</option>
                                                                    </select>
                                                             </div>
                                                    
                                                    </div>
                                            
                                    
                                                </div>
         
         
         
         <!--///////////////////////////////////2222222222222222222222222222222222///////////////////////-->
                                                    <div id="sw-val-step-2">
                                                    <h2 class="StepTitle">Step 2: Product Price</h2>
                                                    
                                                    
                                                    <div class="span6" style="margin-left: 0px;">
                                                        
                                                       <div class="formSep control-group">                                                                                            
                                                        <label class="req"> Price</label>                                
                                                        <input  id="pprice" class="span10" type="number" name="price"  value="" onchange="show_table();" required > 
                                                       </div> 
                                                       <div class="formSep ">
                                                     <label >Special Price</label>                                        
                                                     <input id="spprice" class="span10" type="number" name="special_price" />
                                                      </div>                                    	
                                                       <div class="formSep">
                                                    <label class=""> Special Price From Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                      <div class="row-fluid">
                                                          <%
                                                              DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                                              String formattedDate = df.format(new Date());
                                                          %>
                                                          <input class="span10"  data-date-format="dd/mm/yyyy" id="dp1" type="date" name="Special_price_from_date" value="<%= formattedDate %>" >
                                                      </div>
                                                    </div> 
                                                </div>	
                                                       <div class="formSep">
                                                    <label class=""> Special Price to Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                     <div class="row-fluid">
                                                       <input class="span10"  data-date-format="dd/mm/yyyy" id="dp2" type="date" name="Special_price_to_date"  >
                                                         </div>
                                                    </div> 
                                                    </div>
                                                       <div class="formSep">                                                                                             
                                                        <label >Wholesale Price</label>                                
                                                         <input id="wprice" class="span10" type="number" name="whole_sal_price"  value="" >                                                                          
                                                       </div> 
                                                                                                        
                                                    </div>
                                                    
                                                    <div class="span6" >
                                                        
                                                        <div class="formSep control-group" >
                                <label id="weight_user"  class="req" style="color: black;">Product Weight</label>
                                <input id="vm_ex_weight" type="number" class="span10"  value="" name="Product_weight" onchange="Cal_weight();" required >Kg
                                 <label  id='vm_ex_weight1' class="control-group" ></label>     </div> 

                                                        <div class="formSep control-group " id="1" >
                                    <label  class="req" style="color: black;">Product Length</label>
                                    <input id="length" type="number" class="span10" value="" name="Product_length"onchange="Cal_weight();" required  >cm
                                     <label  id='length1'  ></label> </div> 
                                                        <div class="formSep control-group" id="2" >
                                <label  class="req" style="color: black;">Product Width</label>
                                <input id="width" type="number" class="span10" value="" name="Product_width" required onchange="Cal_weight();" >cm
                                <label  id='width1' class="error" ></label>      </div> 
                                                        <div class="formSep control-group" id="3" >
                                <label  class="req" style="color: black;">Product Height</label>
                                <input id="height" type="number"  class="span10" value="" name="Product_height" required onchange="Cal_weight();" >cm
                                <label  id='height1' class="error" ></label>      </div> 
                                <div class="span6" style="margin-left: 0px;">
                                   <div class="formSep " >
                                <label   style="color: black;">Minimum Wholsale price</label>
                                <input id="Min_Wholsale_price" type="number" value="" name="Min_Wholsale_price"  >
                                <label  id='Min_Wholsale_price1' class="error" ></label>      </div></div>
                                <div class="span6" >
                                                         <div class="formSep" >
                                <label   style="color: black;">Maximum Wholsale price</label>
                                <input id="Max_Wholsale_price" type="number" value="" name="Max_Wholsale_price"  >
                                <label  id='Max_Wholsale_price1' class="error" ></label>      </div>
<!--<script>
    function Min_Max_Price()
    {
        var Min_Wholsale_price=document.getElementById("Min_Wholsale_price").value;
        var Max_Wholsale_price=document.getElementById("Max_Wholsale_price").value;
        if(Min_Wholsale_price > Max_Wholsale_price)
          {
            document.getElementById("Max_Wholsale_price1").innerHTML="Check price";
            document.getElementById("next").style.display="none";
          }
        else
          {
            document.getElementById("Max_Wholsale_price1").innerHTML="";
            document.getElementById("next").style.display="block";
          }
    }
</script>-->
                                                        
                                                    </div>
                                                    </div>
                                                    
                                              </div>
                                                
         
         
         <!--//////////////////////////////333333333333333333333333333333333333333/////////////////////////////-->
                                                <div id="sw-val-step-3">
                                                    <h2 class="StepTitle">Step 3: Additional info</h2>
                                                    <div class="span8" style="margin-left: 0px;">
                      <!--////////////Features & Images-->
                       <%
                                       
                                       String uniqueV="";
                                       String RequiredClass="";
                                       String Frequired="";
                                          Mongo mg1 = new Mongo(Seller_Login.Database,27017);
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
                                                               String ivso_value=(String)str5.get("IVSO");
                                                               String Unique=(String)str5.get("UniqueV");
                                                               String RequiredV=(String)str5.get("ValuesR");
                                      %>
    
                       <%
                                     //Unique
                                    if("Yes".equals(Unique)){uniqueV=("onchange=check_product_dynamic(this.value,this.name)");}
                                    else{uniqueV="";}
                                    //Required
                                    if("Yes".equals(RequiredV)){RequiredClass="class='req'"; Frequired="required";}
                                    else{RequiredClass=""; Frequired="";} 
                         if ( "Text Field".equals(inpute_type)) {
                             if("IntegerNumber".equals(ivso_value))
                             {
                       %>    
                                                       <div class="formSep control-group">                                                                                            
                                                           <label <%=RequiredClass%>><%out.print(visible_name);%></label>                                
                                                        <input value=""  type="number" name="<%out.print(visible_name);%>" <%=Frequired%>  id="intid" <%=uniqueV%> />
                                                        <label  id="1<%out.print(visible_name);%>" class="error" ></label>
                                                       </div>
                            <%}
                              if("DecimalNumber".equals(ivso_value))
                             {
                            %>    
                                                       <div class="formSep control-group">                                                                                            
                                                        <label  <%=RequiredClass%>><%out.print(visible_name);%></label>                                
                                                        <input value=""  type="digits" name="<%out.print(visible_name);%>" <%=Frequired%>  id="descid" <%=uniqueV%>/>
                                                        <label  id='"1"+<%out.print(visible_name);%>' class="error" ></label>
                                                       </div>
                            <%}
                             if("ulr".equals(ivso_value))
                             {
                            %>    
                                                       <div class="formSep control-group">                                                                                            
                                                        <label  <%=RequiredClass%>><%out.print(visible_name);%></label>                                
                                                        <input value=""  type="url" name="<%out.print(visible_name);%>" <%=Frequired%>  id="descid" <%=uniqueV%>/>
                                                        <label  id='"1"+<%out.print(visible_name);%>' class="error" ></label>
                                                       </div>
                            <%}
                             if("none".equals(ivso_value))
                             {%>
                                  <div class="formSep control-group">  
                                  <label  <%=RequiredClass%>> <%out.print(visible_name);%></label>
                                  <input value=""  type="text" name="<%out.print(visible_name);%>" <%=Frequired%>  id="val1_text" <%=uniqueV%>/>
                                  <label  id='"1"+<%out.print(visible_name);%>' class="error" ></label>
                                  </div>
                       <%   } 
                          }

                         if ("Text Area".equals(inpute_type)) {
           
                             %>
                             <div class="formSep control-group">
                                   <label  <%=RequiredClass%>>Text Area</label>  
                                   <textarea id="textareaid"  required  name="<%out.print(visible_name);%>" maxlength="160" <%=Frequired%> <%=uniqueV%>></textarea> 
                                   <label  id='"1"+<%out.print(visible_name);%>' class="error" ></label>
                                     </textarea>
                                   </div><%}
            
                         if ("Date".equals(inpute_type)){
                                 %>
                                 <div class="formSep">
                                                    <label  <%=RequiredClass%>> <%out.print(visible_name);%></label>
                                                    <div class="w-box" id="n_datepicker">
                                                     <div class="row-fluid">
                                                       <input class="span10"  data-date-format="dd/mm/yyyy" id="dp5" type="date" <%=Frequired%> name="<%out.print(visible_name);%>"  >
                                                       <span class="help-block">dd/mm/yyyy</span>
                                                         </div>
                                                    </div> 
                                                    </div>
                                 
                       <%}
                        if ("Drop Down".equals(inpute_type)) {
                
                         %>
                         <div class="formSep" id="drop_down_id" >
                            <label  <%=RequiredClass%>><%out.print(visible_name);%></label>
                                <select name="<%out.print(visible_name);%>" id="val1_sport" class="span10" <%=Frequired%> >
                                  <%
                               
                                  BasicDBList list1 = (BasicDBList) str5.get("values");
                                for(Object obj1 : list1 ){
                                   %>
                                 <option  name="<%out.print(visible_name);%>"><%=obj1%></option>  
                              <%}%>
                                  </select>
                                    </div>
                                  <%}
                    if ("Yes/No".equals(inpute_type)) { 
                        %>
    <div class="formSep" id="visible_name_id">
                            <label  <%=RequiredClass%>><%out.print(visible_name);%></label>
                            <input type="radio" name="value" value="Yes" <%=Frequired%> checked>Yes<br>
                              <input type="radio" name="value" value="No">No<br>
                                    </div>
                    
                        <% }
                          if ("Multiple Select".equals(inpute_type)) {%>
   <div class="formSep" id="drop_down_id" >
                            <label  <%=RequiredClass%>><%out.print(visible_name);%></label>
                            <select name="<%out.print(visible_name);%>" id="val1_sport" <%=Frequired%> multiple="multiple">
                                  <%
                               
                                  BasicDBList list1 = (BasicDBList) str5.get("values");
                                for(Object obj1 : list1 ){
                                           

                                  %>
                                    <option value="<%out.print(visible_name);%>"><%=obj1%></option>  
                                        <%}%>
                                  </select>
                          </div>
                                      <%  }

        if ("Price".equals(inpute_type)) {
                          %>
  
                                  <div class="formSep" id="price_id">
                                  <label  <%=RequiredClass%>> <%out.print(visible_name);%></label>
                                  <input value="" class="span10" type="text" name="<%out.print(visible_name);%>" <%=Frequired%> <%=uniqueV%> />
                                  <label  id='"1"+<%out.print(visible_name);%>' class="error" ></label>
                                  </div><%}%>
                                  
                       
                       <%}}} mg1.close(); %>
                       <input type="hidden" id="cid" name="cid" value="<%=cid%>" />
                                                 <script>
                           function show_table()
                           {
                               var cid=document.getElementById("cid").value;
                                     sendInfo(cid); 
    
    var request;  
    function sendInfo(num)  
    {   
    var url="Seller_commission_AJAX?val="+num;  
    
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
    
//                               document.getElementById("table").hidden=false;
                               var Price=  document.getElementById("pprice").value;
                                var Commission0=(Price*(val.Commission))
                                        var Commission=(Commission0/100).toFixed(2);
                                var Shipment_weight=50;
                                var Packaging_cost=val.Packaging_Cost;
                                var Service_Tax0=(Commission*val.Services_Tax)
                                        var Service_Tax=(Service_Tax0/100).toFixed(2);;
                                var in_Hand=(Price-(parseFloat(Commission)+parseFloat(Shipment_weight)+parseFloat(Packaging_cost)+parseFloat(Service_Tax)));
                                document.getElementById("span1").innerHTML=Commission;
                                document.getElementById("span2").innerHTML=Shipment_weight;
                                document.getElementById("span3").innerHTML=Packaging_cost;
                                document.getElementById("span5").innerHTML=Service_Tax;
                                document.getElementById("span6").innerHTML=in_Hand;
                                document.getElementById("commission_on_tax").innerHTML=val.Commission;
                                document.getElementById("on_tax").innerHTML=val.Services_Tax;
        }
    }
}
                           
                           </script>
                                 
                                <!--<input type="button" value="shipment weight" onclick="Cal_weight();">-->
      <script>
function myFunction(id) {
    var x, text;
  
    // Get the value of the input field with id="numb"
    x = document.getElementById(id).value;

    // If x is Not a Number or less than one or greater than 10
    if (isNaN(x) ) {
        
       document.getElementById(id+"1").innerHTML="Enter numeric value only"; 
       document.getElementById('next').disabled = true;
        document.getElementById('next').style.cursor="not-allowed";
    } 
    else {
       document.getElementById(id+"1").innerHTML=""; 
       document.getElementById('next').disabled = false;
        document.getElementById('next').style.cursor="";
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
         document.getElementById("4").innerHTML=x+"kg";
         document.getElementById("f_weight").value=weight;
         document.getElementById("f_height").value=height;
         document.getElementById("f_width").value=width;
         document.getElementById("f_length").value=length;
         document.getElementById("f_shipping_weight").value=x;
     }
</script>
                                           
                       
                                                    </div>
                                                    <div class="span4">
                                                        <div id="table" >
                           <table class="table table-bordered table-hover" style="width: 100%">
                                                    <thead>
                                                        <tr> <th>Commission <span id="commission_on_tax"></span>% </th>
                                                            <th><label  id="span1"></label></th></tr>
                                                        <tr><th>Calculated weight for shipment</th>
                                                            <th><label id="4"></label></th></tr>
                                                        <tr><th>Shipment charge</th>
                                                            <th><label  id="span2"></label></th></tr>
                                                        <tr><th>Packaging cost</th>
                                                            <th><label  id="span3"></label></th></tr>
                                                        <tr><th>Service Tax <span id="on_tax"></span>% on commission</th>
                                                            <th><label  id="span5"></label></th></tr>
                                                        <tr><th>In hand </th>
                                                            <th><label  id="span6"></label></th></tr>
                                                    </thead>
                                                    
                                                </table>
                       </div>   
                                                        <strong>Terms & Condition</strong>
                                                    </div>
                                                </div>
         <!--///////////////////////////////////////////////END....////////////////////////////-->
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      


<script>
    if($(window).width() > '1280') {
        $('body').append('<a href="javascript:void" class="fluid_lay" style="position:fixed;top:6px;right:10px;z-index:10000" title="fluid layout"><i class="splashy-arrow_state_grey_left"></i><i class="splashy-arrow_state_grey_right"></i></a>');
        $('.fluid_lay').click(function() {
            var url = window.location.href;    
            if (url.indexOf('?') > -1){
               url += '&fluid=1'
            }else{
               url += '?fluid=1'
            }
            window.location.href = url;
        });
        $(window).on('resize',function() {
            if($(window).width() > '1280') {
                $('.fluid_lay').show();
            } else {
                $('.fluid_lay').hide();
            }
        })
    }
</script>
<script>       

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
    
    
        $( "#wizard-validation-form" ).submit(function(event){
            event.preventDefault();
        var data = JSON.stringify( $('form').serializeFormJSON() );
        var test =  JSON.stringify(data);
        var jsondata = JSON.parse(test);
        var Success = false;
      alert(data);
     debugger;
   $.ajax({
      
   url: 'Seller_SaveProduct',
           type: "POST",
          async: false,
          cache: false,
 
       data: { 
      loadProds: 1,
      test: JSON.stringify(jsondata)
       
      // look here!
    },
      success: function(data) {
          
          if(data=="Product name already Exists")
          {
              Success = true;
              window.alert("Product Already Exists");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="SKU already Exists")
          {
              Success = true;
              window.alert("SKU Already Exists");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Price")
          {
              Success = true;
              window.alert("Invalid Price");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Special price")
          {
              Success = true;
              window.alert("Invalid Special price");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Wholsale price")
          {
              Success = true;
              window.alert("Invalid Wholsale price");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Min_Wholesale price")
          {
              Success = true;
              window.alert("Invalid Min_Wholesale price");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Max_Wholesale price")
          {
              Success = true;
              window.alert("Invalid Max_Wholesale price");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Enter a valid stock quantity")
          {
              Success = true;
              window.alert("Enter a valid stock quantity");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Product length")
          {
              Success = true;
              window.alert("Invalid Product length");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Product height")
          {
              Success = true;
              window.alert("Invalid Product height");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Product width")
          {
              Success = true;
              window.alert("Invalid Product width");
              window.location='Show_Products.jsp';
              alert("");
          }
          else if(data=="Invalid Product Weight")
          {
              Success = true;
              window.alert("Invalid Product Weight");
              window.location='Show_Products.jsp';
              alert("");
          }
          else
          {
              Success = true;
              window.alert("Product Uploaded Successfully");
          window.location='Upload_product_image.jsp';
          alert("");
          }
     }
     
        
});  
    }); 
});

///////////////////////////////////////////////

</script>
<script>
    var request; 
    var x;
    function check_product_dynamic(value,field)  
    {  
       console.log(value);
       console.log(field);
       x="1"+field;console.log(x);
    var url="Product_dynamic_field_ajax?val="+value+"&field="+field;  
    
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
    
    if(val=="Entered value already exists"){
        document.getElementById(x).innerHTML = val;
        document.getElementById('save').style.display = "none";
        document.getElementById(x).style.display = "block";
    }  
    else
    {
        
        document.getElementById(x).innerHTML = "";
         document.getElementById('save').style.display = "block";
    }    
    }
}
</script>
<script>
    window.history.forward();
   
</script>
    </body>

<!-- Mirrored from beoro-admin.tzdthemes.com/index.php?page=wizard by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:50 GMT -->
</html>
<%@include file="Footer.jsp" %>