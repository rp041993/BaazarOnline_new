<%@page import="java.util.Arrays"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.bson.Document"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>

<!DOCTYPE HTML>
<%@include file="Header.jsp" %>
    <body class="bg_d">
    <!-- main wrapper (without footer) -->    
        <div class="main-wrapper">
        <!-- top bar -->

        <!-- header -->

        <!-- breadcrumbs -->
        <%
            String attributeset_name = request.getParameter("AttributeSet");
         String cid = request.getParameter("cid");
         String pid =request.getParameter("producid");
           String ip = getServletContext().getInitParameter("ip");
         System.out.println("this is the attribute sertsdsaasdfsdafs   "+attributeset_name);
        System.out.println(" i am in the jsp................................."+cid+"....   "+pid+"...."+attributeset_name);
        %>
      
        <!-- main content -->
                 <div class="container">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="w-box">
                          <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Add Product</h4>
                            </div>
                            <div class="w-box-content">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <form id="wizard-validation-form" class="form-horizontal">
                                            <div id="wizard-validation" class="swMain">
                                                <ul>
                                                    <li>
                                                        <a href="#sw-val-step-1">
                                                            <span class="stepNumber">1</span>
                                                            <span class="stepDesc">
                                                               General<small>Fill general details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#sw-val-step-2">
                                                            <span class="stepNumber">2</span>
                                                            <span class="stepDesc">
                                                               Price<small>Fill Price informations</small>
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
                                                <div id="sw-val-step-1">
                                                    <h2 class="StepTitle">Step 1: General Details</h2>
                                                    <div class="formSep control-group">
                                                    <div class="formSep control-group">
                                                        <label id="uniq" for="Product_Name" class="control-label req">Product Name:</label>
                                                         <div class="controls">
                                                            <input id="gpname" class="span6"  type="text" name="Product_Name"  value="" onchange="checkuniqe(this.name,  this.value ,this.id);" required=""> 
                                                            <input id="cid" type="hidden" name="cid"  value="<%=cid%>">
                                                               <input type="hidden" name="AttributeSet"  value="<%=attributeset_name%>">
                                                            <span class="help-block">At least 3 characters</span>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Description" class="control-label req">Description:</label>
                                                        <div class="controls">
                                                            <textarea  class="span6" rows="4" cols="5" name="Description" required ></textarea>
                                                            <span class="help-block">At least 3 characters</span>
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Short_Discripton" class="control-label req">Short Description:</label>
                                                        <div class="controls">
                                                            <textarea  class="span6" rows="4" cols="5" name="Short_Discription" required ></textarea>
                                                            <span class="help-block">At least 3 characters</span>
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="meta_keywords" class="control-label req">Meta Keyword:</label>
                                                        <div class="controls">
                                                            <textarea  class="span6" rows="4" cols="5" name="Meta_key" required></textarea>
                                                        </div>
                                                    </div>
                                               
                                                     <div class="formSep control-group">
                                                        <label for="Status" class="control-label req">Status:</label>
                                                        <div class="controls">
                                                            <select name="Status" class="span6" required>
                                                            <option value="Enable">Active</option>
                                                            <option value="Disable">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                               
                                                </div>
                                                <div id="sw-val-step-2">
                                                    <h2 class="StepTitle">Step 2: Price Info</h2>	
                                                 <div class="formSep control-group">
                                                        <label for="Price" class="control-label">Price:</label>
                                                        <div class="controls">
                                                            <input type="digits" name="Price" id="pprice" class="span6" required onchange="show_table()">
                                                        </div>
                                                    </div>
<!--                                                    <div class="formSep control-group">
                                                        <label for="group_Price" class="control-label req">Group Price:</label>
                                                        <div class="controls">
                                                            <input type="text" name="group_Price" id="group_Price" class="span6" required>
                                                            <input type="button" value="Add Group Price" class="add" id="add" />
                                                        </div>
                                                    </div>-->
                                                    <div class="formSep control-group">
                                                        <label for="Special_price" class="control-label req">Special Price:</label>
                                                        <div class="controls">
                                                            <input type="digits" name="Special_price" id="special_price" class="span6" required>
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Special_price_from_date" class="control-label req">Special Price From Date:</label>
                                                        <div class="controls">
                                                            <input name="Special_price_from_date" id="dp1"  type="text" data-date-format="dd/mm/yyyy" value="" class="span6" required>
                                                        </div>
                                                    </div>
                                                     <div class="formSep control-group">
                                                        <label for="Special_price_to_date" class="control-label req">Special Price To Date:</label>
                                                        <div class="controls">
                                                           <input name="Special_price_to_date" id="dp2"  type="text" data-date-format="dd/mm/yyyy" value="" class="span6" required>
                                                        </div>
                                                    </div>
                                                       <div class="formSep control-group">
                                                        <label for="SKU" class="control-label req">SKU:</label>
                                                        <div class="controls">
                                                            <input id="SKU" class="span6"  type="text" name="SKU" value="" onchange="checkuniqe(this.name,  this.value ,this.id)" required />
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Stock_qty" class="control-label req">Stock:</label>
                                                        <div class="controls">
                                                            <input id="Stock_qty" class="span6"  type="digits" name="Stock_qty" value="" required />
                                                        </div>
                                                    </div>
                                                  <div class="formSep control-group">
                                                     <label for="Product_weight" class="control-label req">Weight</label>
                                                     <div class="controls">
                                                     <input id="vm_ex_weight" type="digits" class="span6"  value="" name="Product_weight" required onchange="myFunction(this.id);">Kg
                                                       <label  id='vm_ex_weight1' class="error" ></label>    
                                                     </div>
                                                  </div>

                                      <div class="formSep control-group" id="1" >
                                         <label  for="Product_lenght" class="control-label req">Length</label>
                                           <div class="controls">
                                               <input id="length" type="digits" class="span6" value="" name="Product_lenght" required onchange="myFunction(this.id)" >cm
                                               <label  id='length1' class="error" ></label> </div> 
                                          </div>
                                                 
                                     <div class="formSep control-group" id="2" >
                                        <label  for="Product_width" class="control-label req">Width</label>
                                     <div class="controls">  
                                        <input id="width" type="digits" class="span6" value="" name="Product_width" required onchange="myFunction(this.id)" >cm
                                             <label  id='width1' class="error" ></label>     
                                        </div> 
                                </div>
                                 <div class="formSep control-group" id="3" >
                                     <label   for="Product_height" class="control-label req">Height</label>
                                        <div class="controls">  
                                            <input id="height" type="digits" class="span6" value="" name="Product_height" required onchange="Cal_weight();" >cm
                                            <input type="hidden" name="Product_shipment_weight" value="" id="4">  
                                            <label  id='height1' class="error" ></label>      
                                              </div>
                                        </div>
                                      <div class="formSep control-group ">
                                          <label  for="Stock" class="control-label req">Stock Availability</label>                                        
                                          <select name="Stock" class="span6" required >
                                              <option  value="In_stock" name="Stock" >In stock</option>
                                              <option value="Out_of_stock" name="Stock" >Out of stock</option>
                                            </select>
                                         </div>
<!--      <input type="button" value="shipment weight" onclick="Cal_weight();">-->

                                                </div>
                                                            
                                                            
                                                            
                                                            
                                                <div id="sw-val-step-3">
                                                    <h2 class="StepTitle">Step 3: Additional info</h2>
                                                   <%
     
     
         
           MongoClient client = new MongoClient( ip , 27017);
               MongoDatabase database = client.getDatabase("baazaronline");
                     MongoCollection<Document> collection = database .getCollection("Attribute");
                         BasicDBObject doc = new BasicDBObject("Name", attributeset_name);
                             JSONObject jsondata =null;    
                         List<Document> attributeSet = (List<Document>) collection.find(doc).into(new ArrayList<Document>());
                            
                                    ArrayList<JSONObject> attibuteproperty = new ArrayList<JSONObject>();
                          // out.print(attributeSet);
                                int i=0;
                                  ArrayList a = new ArrayList();
                                    for (Document attribure : attributeSet) {
                                     // System.out.println("aaaa   "+attribure);        
                                              Object ss =  attribure.get("Name");
                                                   String name =ss.toString();
                                                      List<Document> value = (List<Document>) attribure.get("Attributes");
                                                      
                                                     for ( i = 0; i < value.size(); i++) {
                                                                   a.add(value.get(i));
                                                                 
                                                                         }
                                                                                    }

                        
                                        MongoClient mongoClient  = new MongoClient( ip , 27017 );
                                        DB db = mongoClient.getDB("baazaronline");
                                        DBCollection collection1 = db.getCollection("Attribute");
                                        DBCollection coolectionproduct = db.getCollection("products");
                                        DBCursor cursor=null;
                                 for (int j = 0; j < a.size(); j++) {
                                       
                                        //System.out.println(" i am in the for looo   "+a.get(j).toString()); 
                                        String attributes = a.get(j).toString();
                                        System.out.println("this is my attribute that witch data is loading for it  "+attributes);
                                        
                                      
                                         DBObject query = new BasicDBObject("attcode", attributes);
                                         cursor = collection1.find(query);
                                        
                                         while (cursor.hasNext()) {
                                                      String attr = cursor.next().toString();
                                                      Object obj=JSONValue.parse(attr);  
                                                      JSONObject jsonObject = (JSONObject) obj;
                                                  
                                                      String visible_name = jsonObject.get("Visiblename").toString();
                                                      String attribute_code = jsonObject.get("attcode").toString();
                                                      String inpute_type =  jsonObject.get("citso").toString();
                                                      String default_value =jsonObject.get("DefautV").toString();
                                                      String unique_value = jsonObject.get("UniqueV").toString();
                                                      String  requierd_value = jsonObject.get("UniqueV").toString();
                                                      String ivso_value = jsonObject.get("IVSO").toString();
                                                      String option_valuesa = jsonObject.get("values").toString();
                                                      String op = option_valuesa.replace("[", "");
                                                      String opt = op.replace("]", "");
                                                      List<String> option_values = new ArrayList<String>(Arrays.asList(opt.split(",")));

%> 
<%             
                       if("Text Field".equals(inpute_type) &&  "Yes".equals(unique_value)){
                    %>
                            <% 
                                    if( "Text Field".equals(inpute_type) &&  "IntegerNumber".equals(ivso_value)){
                            %>
                                       <div class="formSep control-group ">
                                           <label class="control-label req"  ><%out.print(visible_name);%></label>
                                           <div class="controls">
                                              <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="intid"  onchange="checkint( this.name ,this.value);" class="span6"/>
                                           </div>
                                       </div>     
                                   <% }
                                    if("Text Field".equals(inpute_type) &&  "Email".equals(ivso_value)){
                                       %>
                                         <div class="formSep control-group " id="visible_emai_id">
                                           <label class="control-label req"><%out.print(visible_name);%></label>
                                            <div class="controls">
                                              <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="mailid"  onchange="checkEmail(this.value , this.name);" class="span6"/>
                                            </div>
                                         </div>
                                   <% }
                                    if("Text Field".equals(inpute_type) &&  "DecimalNumber".equals(ivso_value)){ %>
                                        <div class="formSep control-group " id="visible_deciamal_id">
                                            <label class="control-label req"><%out.print(visible_name);%></label>
                                             <div class="controls">
                                              <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="desimalid"  onchange="checkdesimal(this.name,  this.value);" class="span6"/>
                                             </div>
                                             </div>
                                   <% }
                                     if("Text Field".equals(inpute_type) &&  "none".equals(ivso_value)){ %>
                                        <div class="formSep control-group " id="visible_deciamal_id">
                                            <label class="control-label req" ><%out.print(visible_name);%></label>
                                        <div class="controls">
                                              <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="noneid" class="span6"/>
                                        </div>
                                        </div>
                                   <% }
                                    if("Text Field".equals(inpute_type) &&  "ulr".equals(ivso_value)){ %>
                                        <div class="formSep control-group " id="visible_url_id">
                                            <label class="control-label req"><%out.print(visible_name);%></label>
                                            <div class="controls">
                                                <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="urlid"  onchange="checkurl(this.name,  this.value);" class="span6"/>
                                            </div>
                                            </div>
                                   <% }
                           }

               if("Text Field".equals(inpute_type) &&  "No".equals(unique_value)) {%>
                                   <% 
                                       System.out.println("i am coming in the values requierd NO.......hello");
                                        if( "Text Field".equals(inpute_type) &&  "none".equals(ivso_value)){
                                          %>
                                       <div class="formSep control-group " id="visible_name_id">
                                           <label class="control-label req"><%out.print(visible_name);%></label>
                                           <div class="controls">
                                               <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>"   id="intid"  class="span6" />
                                           </div>
                                           </div>
                                  <% 
                                       }
                                    if( "Text Field".equals(inpute_type) &&  "IntegerNumber".equals(ivso_value)){
                                   %>
                                       <div class="formSep control-group " id="visible_name_id">
                                           <label class="control-label req"><%out.print(visible_name);%></label>
                                           <div class="controls">
                                               <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="intid"  onchange="checkint( this.name ,this.value);" class="span6"/>
                                           </div>
                                           </div>
                                  <% }
                                    if("Text Field".equals(inpute_type) &&  "Email".equals(ivso_value)){
                                       %>
                                        <div class="formSep control-group " id="visible_name_id">
                                            <label class="control-label req"><%out.print(visible_name);%></label>
                                            <div class="controls">
                                                  <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="mailid"  onchange="checkEmail(this.value , this.name);" class="span6" />
                                            </div>
                                            </div>
                                  <% }
                                    if("Text Field".equals(inpute_type) &&  "DecimalNumber".equals(ivso_value)){ %>
                                        <div class="formSep control-group " id="visible_name_id">
                                            <label class="control-label req"><%out.print(visible_name);%></label>
                                            <div class="controls">
                                                  <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="desimalid"  onchange="checkdesimal(this.name,  this.value);" class="span6" />
                                            </div>
                                            </div>
                                  <% }

                                    if("Text Field".equals(inpute_type) &&  "ulr".equals(ivso_value)){ %>
                                        <div class="formSep control-group" id="visible_name_id">
                                           <label class="control-label req"><%out.print(visible_name);%></label>
                                           <div class="controls">
                                                  <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" required  id="urlid"  onchange="checkurl(this.name,  this.value);" class="span6" />
                                           </div>
                                           </div>
                                  <% }
                             }

                            if("Text Area".equals(inpute_type)) {
                             %>
                     <div class="formSep control-group " id="textarea_id" >
                        <label class="control-label req"><%out.print(visible_name);%></label>
                        <div class="controls">   
                        <textarea id="textareaid" rows="5" cols="15" name="<%out.print(visible_name);%>" class="span6">
                                <%out.print(default_value);%> </textarea>
                        </div>        </div><% }
            
        if ("Date".equals(inpute_type)){ %>
                     <div class="formSep control-group" id="date_id" >
                       <label class="control-label req"><%out.print(visible_name);%></label>
                     <div class="controls"> 
                       <input name="<%out.print(visible_name);%>" id="<%out.print(visible_name);%>"  type="text" data-date-format="dd/mm/yyyy" value="<%out.print(default_value);%>" class="span6">
                           <span class="help-block">dd/mm/yyyy</span>
                                  </div>
                     </div>
                       <% }
        if ("Yes/No".equals(inpute_type)) { %>
                  
    <div class="formSep control-group " id="visible_name_id">
                            <label class="control-label req"><%out.print(visible_name);%></label>
                            <div class="controls">
                            <input type="radio" name="gender" value="male" checked>Yes<br>
                              <input type="radio" name="gender" value="female">No<br>
                                    </div>
    </div>
<% }

  if ("Multiple Select".equals(inpute_type)) {%>
   <div class="formSep control-group " id="drop_down_id" >
                            <label class="control-label req"><%out.print(visible_name);%></label>
                            <div class="controls">
                            <select name="<%out.print(visible_name);%>" id="val1_sport" multiple="multiple"  onchange="check()" class="span6">
                                  <%
                                for (int k = 0; k <option_values.size(); k++) {
                                     
                                        String value = option_values.get(k);
                                       
                                         String s =  value.replace("\"","");                                
                                  %>
                                  <option value="<%out.print(s);%>" class="span6"><%out.print(s);%></option>  
                                        <%}%>
                                  </select>
                          </div>
   </div>          
                                      <%  }
        if ("Drop Down".equals(inpute_type)) {
                    %>
                         <div class="formSep control-group " id="drop_down_id" >
                            <label class="control-label req"><%out.print(visible_name);%></label>
                             <div class="controls">   
                            <select name="<%out.print(visible_name);%>" id="val1_sport"  onchange="check()" class="span6">
                                  <%
                                for (int k = 0; k <option_values.size(); k++) {
                                                                     
                                                                          
                                         String value = option_values.get(k);
                                       
                                         String s =  value.replace("\"","");   

                                  %>
                                  <option value="<%out.print(s);%>" class="span6"><%out.print(s);%> </option>  
                                        <%}%>
                                  </select>
                          </div>
                         </div>          
                    
                          <%}
        if ("Price".equals(inpute_type)) {%>
  
           <div class="formSep control-group " id="price_id">
              <label class="control-label req"><%out.print(visible_name);%></label>
                  <div class="controls">
                  <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" class="span6" required/>
                </div>
           </div>                        
              <%      }
                    }
                  }
          %>
                               <div class="span4">
                                                        <div id="table" >
                           <table class="table table-bordered table-hover" style="width: 100%">
                                                    <thead>
                                                        <tr> <th>Commission %</th>
                                                            <th><label  id="span1">%</label></th></tr>
                                                        <tr><th>Calculated weight for shipment</th>
                                                            <th><label id="weight_i"></label></th></tr>
                                                        <tr><th>Shipment charge</th>
                                                            <th><label  id="span2"></label></th></tr>
                                                        <tr><th>Packaging cost</th>
                                                            <th><label  id="span3"></label></th></tr>
                                                        <tr><th>Packaging salary</th>
                                                            <th><label  id="span4"></label></th></tr>
                                                        <tr><th>Service Tax % on commission</th>
                                                            <th><label  id="span5">%</label></th></tr>
                                                        <tr><th>In hand </th>
                                                            <th><label  id="span6"></label></th></tr>
                                                    </thead>
                                                    
                                                </table>
                       </div>   
                                                        <strong>Terms & Condition</strong>
                                                    </div>   

          
          
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                   </div>
             </div>
        </div> 
   
                                                
            <div class="footer_space"></div>
        </div>
            
        </div>

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
        // alert(x);
         document.getElementById("4").value =x;
         document.getElementById("4").hidden=false;
         document.getElementById("vm_Product_shipment_weight").value=x;
         document.getElementById("f_weight").value=weight;
         document.getElementById("f_height").value=height;
         document.getElementById("f_width").value=width;
         document.getElementById("f_length").value=length;
         document.getElementById("f_shipping_weight").value=x;
         window.show_table(x);
     }
</script>  
                       <script>
                           function show_table(x)
                           { 
                               debugger;
//                               document.getElementById("table").hidden=false;
                               var x ;
                               var Price=  document.getElementById("pprice").value;   
                               var cid=  document.getElementById("cid").value;   
                               
                        //  alert("price is"+Price+"  cid" +cid);   
                          
                              var Commission=(Price*.08).toFixed(2);
                              var Shipment_weight=50;
                              var Packaging_cost=50;
                              var Packaging_salary=50;
                              var Service_Tax=(Commission*.15).toFixed(2);
                   
                            $.ajax({
      
        url: 'GetCommision?cid='+cid,
        type: 'POST',
         dataType: 'json', 
         async: false, success: function(result){
             Commission = result.Commission;
             
             
            Shipment_weight = result.Labour_salary;
            Packaging_cost = result.Commission;
            Shipment_weight = result.Shippment;
            Packaging_salary = result.Packaging_Cost;
            Service_Tax = result.Services_Tax;
         }
});
              //Commission=(Price*Commission).toFixed(2);
            var in_Hand=(Price-(Commission+Shipment_weight+Packaging_cost+Packaging_salary)).toFixed(2);
            document.getElementById("span1").innerHTML=Commission;
            document.getElementById("span2").innerHTML=Shipment_weight;
            document.getElementById("span3").innerHTML=Packaging_cost;
            document.getElementById("span4").innerHTML=Packaging_salary;
            document.getElementById("span5").innerHTML=Service_Tax;
            document.getElementById("span6").innerHTML=in_Hand;
            document.getElementById("4").value =x;
        
                           }
                           
                           </script>


 <script type="text/javascript">
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
    
    $("#save").click(function(){
    debugger;
        var data = JSON.stringify( $('form').serializeFormJSON() );
        var test =  JSON.stringify(data);
        var jsondata = JSON.parse(test);
        console.log("jsondata  "+jsondata)
          
       $.ajax({
      
           url: 'SaveProduct',
           type: "POST",
          async: false,
          cache: false,
 
       data: { 
      loadProds: 1,
      test: JSON.stringify(jsondata) // look here!
    },
           dataType: "json",
           success: function(result){
        window.location.href='${pageContext.request.contextPath}/admin/Upload_product_image.jsp?type='+result.type;    
        alert(result.amit);
         }});
 
       
    
    });
});
</script>
<script> 
    
    function checkuniqe(name,value,id)  
    {       
        var ids = id;
        
      //  alert(id);
        debugger;
        
           $.ajax({
      
        url: 'CheckValueUnique?name='+name+'&value=' + value +'&id='+id,
        type: 'GET',
         dataType: 'json', 
         async: false, success: function(result){
            if(result.status==="yes")
             {

       alert(result.name+" is already exite\n\pleas reenter value");
         $("#"+id).val("");
        $("#"+id).focus();
    
     }  
    else
    {
      
   //     alert("there is no duplicate value found ");
          
       
        
    }
         }
});
    }    
  
</script>

    </body>
<%@include file="Footer.jsp" %>