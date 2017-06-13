<%-- 
    Document   : newjsp3
    Created on : 5 May, 2017, 11:22:28 AM
    Author     : baazaronline4
--%>

<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.BasicDBObject"%>
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
         String pid =request.getParameter("pid");
         String type = request.getParameter("type");
         System.out.println("attributeset="+attributeset_name+" cid = "+cid+" pid ="+pid+"type=-"+type);
           String ip = getServletContext().getInitParameter("ip");
//         String set = null;
//         set  = request.getParameter("set");
//         
         String Product_Status =null;
          
         System.out.println(" i am in the jsp................................."+cid+"....   "+pid+"...."+attributeset_name);
             MongoClient mongoClient  = new MongoClient(ip , 27017 );
                                        DB db = mongoClient.getDB("baazaronline");
                                        DBCollection collection1 = db.getCollection("Attribute");
                                        DBCollection coolectionproduct = db.getCollection("products");
                                        DBObject productqruery = new BasicDBObject("_id",new ObjectId(pid));
                                        DBCursor cursor=null;
                                        DBCursor productcorsor = coolectionproduct.find(productqruery);
                                     
                                        DBObject str1=null; 
                                        while (productcorsor.hasNext()) {
                                      
                                            
                                           str1 = productcorsor.next();
                                           
                                          
                                            String Product_Name = str1.get("Product_Name").toString();
                                            String User_Object_ID = str1.get("User_Object_ID").toString();
                                         
                                            String catagoryid =  str1.get("cid").toString();
                                         
                                            String Description =  str1.get("Description").toString();
                                         
                                            String Short_Discripton = str1.get("Short_Discription").toString();
                                         
                                            String meta_keywords = str1.get("Meta_key").toString();
                                         
                                            
                                            String status = str1.get("Status").toString();
                                         
                                           // String Stock = str1.get("Stock").toString();
                                         
                                              Product_Status = (String) str1.get("Product_Status");
                                         
                                             String First_image = (String) str1.get("First_image");
                                             String Product_weight = (String) str1.get("Product_weight");
                                             
                                             String Product_width = (String) str1.get("Product_width");
                                             
                                             String Product_height = (String) str1.get("Product_height");
                                             
                                             String Product_length = (String) str1.get("Product_length");
                                             
                                           //  String Product_shipment_weight = (String) str1.get("Product_shipment_weight");
                                             //System.out.println("fafsffsdfsfsfsfsffs"+Product_shipment_weight);
                                         //   String name =str1.get("name").toString();
                                          
                                          
                                            
                                             
                                            

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
                                                    <h2 class="StepTitle">Step 1: Product General Details</h2>
                                                    <div class="formSep control-group">
                                                        <div class="formSep control-group">
                                                        <label for="v_username" class="control-label req">Product Name:</label>
                                                        <div class="controls">
                                                            <input id="gpname" class="span6"  type="text" name="Product_Name"  value="<%=Product_Name%>" onchange="sendInfo(this.name,  this.value);" required> 
                                                            <input type="hidden" name="cid"  value="<%=cid%>">
                                                            <input type="hidden" name="pid"  value="<%=pid%>">
                                                            <input type="hidden" name="AttributeSet"  value="<%=attributeset_name%>">
                                                            <input type="hidden" name="User_Object_ID"  value="<%=User_Object_ID%>">
                                                            
                                                            <input type="hidden" name="First_image"  value="<%=First_image%>">
                                                            <span class="help-block">At least 3 characters</span>
                                                        </div>
                                                     </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Description" class="control-label req">Description:</label>
                                                         <div class="controls">
                                                            <textarea class="span6" rows="4" cols="5" name="Description"  required>
                                                             <%=Description%>
                                                            </textarea>                                                                          
                                                            <span class="help-block">At least 3 characters</span>
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Short_Discription" class="control-label req">Short Description:</label>
                                                        <div class="controls">
                                                            <textarea  class="span6" rows="4" cols="5" name="Short_Discription" required ><%=Short_Discripton%></textarea>
                                                            <span class="help-block">At least 3 characters</span>
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Meta_key" class="control-label req">Meta Keyword:</label>
                                                        <div class="controls">
                                                            <textarea  class="span6" rows="4" cols="5" name="Meta_key" required><%=meta_keywords%></textarea>
                                                        </div>
                                                    </div>
                                                  
                                                     <div class="formSep control-group">
                                                        <label for="Status" class="control-label">Status:</label>
                                                        <div class="controls">
                                                            <select name="Status" class="span6" required>
                                                             <option value="Enable">Active</option>
                                                             <option value="Disable">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                        <div class="formSep control-group">
                                                     <label for="Product_weight" class="control-label req">Weight</label>
                                                     <div class="controls">
                                                         <input id="vm_ex_weight" type="digits" class="span6"  value="<%=Product_weight%>" name="Product_weight" required onchange="myFunction(this.id);">Kg
                                                       <label  id='vm_ex_weight1' class="error" ></label>    
                                                     </div>
                                                  </div>

                                      <div class="formSep control-group" id="1" >
                                         <label  for="Product_lenght" class="control-label req">Length</label>
                                           <div class="controls">
                                               <input id="length" type="digits" class="span6" value="<%=Product_width%>" name="Product_lenght" required onchange="myFunction(this.id)" >cm
                                               <label  id='length1' class="error" ></label> </div> 
                                          </div>
                                                 
                                     <div class="formSep control-group" id="2" >
                                        <label  for="Product_width" class="control-label req">Width</label>
                                     <div class="controls">  
                                        <input id="width" type="digits" class="span6" value="<%=Product_width%>" name="Product_width" required onchange="myFunction(this.id)" >cm
                                             <label  id='width1' class="error" ></label>     
                                        </div> 
                                </div>
                                 <div class="formSep control-group" id="3" >
                                     <label   for="Product_height" class="control-label req">Height</label>
                                        <div class="controls">  
                                            <input id="height" type="digits" class="span6" value="<%=Product_weight%>" name="Product_height" required onchange="Cal_weight();" >cm
                                            <input type="hidden" name="Product_shipment_weight" value="" id="4">  
                                            <label  id='height1' class="error" ></label>      
                                              </div>
                                        </div>
                                               </div>
                                                            <%}%>
                                                            
                                                    <%
                                                        
                                                    DBCollection pricecollection = db.getCollection("product_prices");
                                                     DBObject pricequery = new BasicDBObject("Product_id",pid);
                                                     DBCursor pricecorsor = pricecollection.find(pricequery);
                                                     
                                               
                                         while (pricecorsor.hasNext()) {
                                             
                                           DBObject priceobj = pricecorsor.next();
                                           System.out.println("this is value of product collection"+priceobj);
                                           String price = priceobj.get("Price").toString();
                                         //  String group_Price = priceobj.get("group_Price").toString();
                                           String special_price = priceobj.get("Special_price").toString();
                                           System.out.println(" this is grups sdfaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaprice.."+special_price);
                                           String Special_price_from_date = priceobj.get("Special_price_from_date").toString();
                                           String Special_price_to_date = priceobj.get("Special_price_to_date").toString();
                                           String sku = priceobj.get("SKU").toString();
                                           String Stock_qty = priceobj.get("Stock_qty").toString();
                                           
//                                           String Product_weight = priceobj.get("Product_weight").toString();
//                                           String Product_lenght = priceobj.get("Product_lenght").toString();
//                                           String Product_width = priceobj.get("Product_width").toString();
//                                           String Product_height = priceobj.get("Product_height").toString();
//                                           
                                                    %>        
                                                <div id="sw-val-step-2">
                                                    <h2 class="StepTitle">Step 2: Price Info</h2>	
                                                 <div class="formSep control-group">
                                                        <label for="Price" class="control-label req">Price:</label>
                                                        <div class="controls">
                                                            <input type="digits" name="Price" id="v_street" class="span6" value="<%=price%>" required >
                                                            <input type="hidden" name="Product_Status" id="v_street" class="span6" value="<%=str1.get("Product_Status")%>" required >
                                                        </div>
                                                    </div>
<!--                                                    <div class="formSep control-group">
                                                        <label for="group_Price" class="control-label req">Group Price:</label>
                                                        <div class="controls">
                                                            <input type="text" name="group_Price" id="group_Price" class="span6" value="safdf" required>
                                                            <input type="button" value="Add Group Price" class="add" id="add" />
                                                        </div>
                                                    </div>-->
                                                    <div class="formSep control-group">
                                                        <label for="Special_price" class="control-label ">Special Price:</label>
                                                        <div class="controls">
                                                            <input type="digits" name="Special_price" id="special_price" class="span6" value="<%=special_price%>">
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Special_price_from_date" class="control-label ">Special Price From Date:</label>
                                                        <div class="controls">
                                                            <input name="Special_price_from_date" id="dp1"  type="text" data-date-format="dd/mm/yyyy" value="<%=Special_price_from_date%>" class="span6"   >
                                                        </div>
                                                    </div>
                                                     <div class="formSep control-group">
                                                        <label for="Special_price_to_date" class="control-label ">Special Price To Date:</label>
                                                        <div class="controls">
                                                            <input name="Special_price_to_date" id="dp2"  type="text" data-date-format="dd/mm/yyyy" value="<%=Special_price_to_date%>" class="span6" >
                                                        </div>
                                                    </div>
<!--                                                      <div class="formSep control-group">
                                                        <label for="tier_price" class="control-label req">tier price:</label>
                                                        <div class="controls">
                                                             <input type="text" name="tier_price" id="v_street" class="span6" value="" required >
                                                        </div>
                                                    </div>-->
                                                    <div class="formSep control-group">
                                                        <label for="SKU" class="control-label req" >SKU:</label>
                                                        <div class="controls">
                                                            <input id="SKU" class="span6"  type="text" name="SKU" value="<%=sku%>" required />
                                                        </div>
                                                    </div>
                                                    <div class="formSep control-group">
                                                        <label for="Stock_qty" class="control-label req" >Stock</label>
                                                        <div class="controls">
                                                            <input id="stock" class="span6" type="digits" name="Stock_qty" value="<%=Stock_qty%>" required />
                                                        </div>
                                                    </div>   
                                                         
                                                    <div class="formSep control-group">
                                                        <label for="Stock" class="control-label">Stock Availability:</label>
                                                        <div class="controls">
                                                            <select name="Stock" class="span6" required>
                                                             <option value="In_stock" name="Stock" >In stock</option>
                                                             <option value="Out_of_stock" name="Stock" >Out of stock</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                           
                                            </div>
                                                  
                                                <% } %>
                                           
                                                <div id="sw-val-step-3">
                                                    <h2 class="StepTitle">Step 3: Additional info</h2>
                                                   <%
     
           MongoClient client = new MongoClient(ip , 27017);
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
                                      System.out.println("aaaa   "+attribure);   
                                              Object ss =  attribure.get("Name");
                                                   String name =ss.toString();
                                                      List<Document> value = (List<Document>) attribure.get("Attributes");
                                                      
                                                     for ( i = 0; i < value.size(); i++) {
                                                                   a.add(value.get(i));
                                                                   
                                                                 
                                                                   }
                                                                  System.out.println("this is the array of the attributes  "+a);                  }
      
                                 
                          
                                    for (Object aaa : a) {
                                       
                                        //System.out.println(" i am in the for looo   "+a.get(j).toString()); 
                                        String attributes = aaa.toString() ;
                                        System.out.println("this is my attribute that witch data is loading for it  "+attributes);
                                        
                                      
                                         DBObject query = new BasicDBObject("attcode", attributes);
                                         System.out.println("this is query that how manny time its exicuteing "+query);
                                         cursor = collection1.find(query);
                                 
                                         while (cursor.hasNext()) {
                                                     
                                             
                                                      String attr = cursor.next().toString();
                                                      Object obj=JSONValue.parse(attr);
                                                      JSONObject jsonObject = (JSONObject) obj;
                                                      System.out.println("sysoutsflsjfskjfskdjsklfjskljfsklsfaf"+jsonObject);
                                                      String visible_name = jsonObject.get("Visiblename").toString();
                                                      String attribute_code = jsonObject.get("attcode").toString();
                                                      String inpute_type =  jsonObject.get("citso").toString();
                                                      String default_value =str1.get(visible_name).toString();
                                                      String unique_value = jsonObject.get("UniqueV").toString();
                                                      String  requierd_value = jsonObject.get("UniqueV").toString();
                                                      String ivso_value = jsonObject.get("IVSO").toString();
                                                      String option_valuesa = jsonObject.get("values").toString();
                                                      String op = option_valuesa.replace("[", "");
                                                      String opt = op.replace("]", "");
                                                      
                                                      List<String> option_values = new ArrayList<String>(Arrays.asList(opt.split(",")));
                                                    
                                                      System.out.println("option values are like that ...."+option_values);

                                                   %> 
                                                  
<%             
    System.out.println("Text Field=========="+inpute_type+"Yes====="+unique_value);
                       if("Text Field".equals(inpute_type) &&  "Yes".equals(unique_value)){
                           System.out.println("ye to sab ke liyeeeeeeeeeeeee  he bhai");
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
                                     if("Text Field".equals(inpute_type) &&  "none".equals(ivso_value)){
                                  
                                    System.out.println(" this condition is true above for thrrreeee");
                                   %>
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
                        </div>      
                     </div>
                                                   <% }
            
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
                    
                          <% }
        if ("Price".equals(inpute_type)) {%>
  
           <div class="formSep control-group " id="price_id">
              <label class="control-label req"><%out.print(visible_name);%></label>
                  <div class="controls">
                  <input value="<%out.print(default_value);%>"  type="text" name="<%out.print(visible_name);%>" class="span6" required/>
                </div>
           </div>                        
              <% }%>
              
                        <% 
                            
                            
                            System.out.println("this is my jsp is complitely run  ");  }
 
}
         

                        %>
                        <% if (type.equals("a") && Product_Status.equals("Unapproved")) {
                        
                          System.out.println("the condition is true.......");
                        %>
                          <div class="formSep control-group " id="Producsaratuc">
              <label class="control-label req">approve</label>
                  <div class="controls">
                      
                       <input type="radio" name="Aprrovecheck" value="yes" >approve<br>
                       <input type="radio" name="Aprrovecheck" value="no" checked=""> Unpprove<br>
                </div>
           </div>      
                           <%  }
                        %>
                                          
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
        </div> 
   
                                                
            <div class="footer_space"></div>
        </div>
            
        </div> 
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
    
    $("#save").click(function(){
    
           var data = JSON.stringify( $('form').serializeFormJSON() );
        var test =  JSON.stringify(data);
        console.log("this is test   "+test);
        var jsondata = JSON.parse(test);
        console.log("jsondata  "+jsondata);
    debugger;
    $.ajax({
      
           url: 'UpdateProduct',
           type: "POST",
          async: false,
          cache: false,
 
       data: { 
      loadProds: 1,
      test: JSON.stringify(jsondata) // look here!
    },
           dataType: "json",
           success: function(result){
        window.location.href='${pageContext.request.contextPath}/admin/Show_Products.jsp';    
        alert(result.amit);
               
          console.log('i am in side sucess funtion '+result.amit);
          
          
          
         }});
  
   
    
    });
});
</script>

    </body>

    
    <%@include file="Footer.jsp" %>