<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@include file="Header.jsp" %>
<html>
    <head> <meta charset="UTF-8"></head>
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
    
    
        $( "#form1" ).submit(function(){
        var data = JSON.stringify( $('form').serializeFormJSON() );
        
        var Success = false;
      alert(data);
     debugger;
   $.ajax({
      
        url: 'Add_Varient?test='+data,
        type: 'POST',
        async:false,
        cache: false,
        contentType: 'application/json; charset=utf-8',
       dataType: 'text',  
        data: { 
      loadProds: 1,
      test: data
       
      // look here!
    },
      success: function(data) {
          debugger;
          
           if(data=="SKU already Exists")
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
          
          else if(data=="Enter a valid stock quantity")
          {
              Success = true;
              window.alert("Enter a valid stock quantity");
              window.location='Show_Products.jsp';
              alert("");
          }
          else
          {
              Success = true;
              window.alert("Varient Uploaded Successfully");
              window.location='Upload_varient_image.jsp';
                alert("");
          }
     }
     
        
});  
    }); 
});

        </script>

  
    <body>
        <div id="Add_Product" class="span12 w-box w-box-blue" >
            <form  id='form1' method="post">
        <%String Product_id=request.getParameter("p_id");
        String i=request.getParameter("i");
        System.out.println("yyyyyyyyyyyyyyyyy "+Product_id+"vvvvvvvvvvv"+i);
        if(i.equals("m"))
        {
          Mongo mg = new Mongo("Localhost",27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("product_price");
            DBObject by_P_id = new BasicDBObject("Product_id", Product_id);  
                DBObject by_User_ID = new BasicDBObject("User_ID", "amit25parmars@gmail.com");    
                BasicDBList And = new BasicDBList();
                And.add(by_P_id);
                And.add(by_User_ID);
                DBObject doc1 = new BasicDBObject("$and", And);
                DBCursor cursor = collection.find(doc1);
                 while(cursor.hasNext())
                 {
                 
                 DBObject str=cursor.next();
                 String Stock=(String)str.get("Stock");
          %>
          
              
   
    <div class="w-box-header" >
                <h4>Update your product</h4>
                <input type="submit" id="save_product" value="Save" class="btn" >
    </div>
       <input type="hidden" name="Product_id" value="<%=Product_id%>">
       
    <div class="w-box-content">
        <div class="row-fluid">
                     <div class="span6" style="margin-left: 0px">
                                                           <div class="formSep control-group">
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
                  <label class="req"> Price in Rs.</label>                                
                   <input id="pprice" class="span10" type="text" name="price" value="<%=str.get("Price")%>" required>                                                                          
           </div>                                       

        <div class="formSep">
               <label >Special Price in Rs.</label>                                        
               <input id="spprice" class="span10" type="text" name="special_price" value="<%=str.get("Special_price")%>" />
         </div>                                    	
                           
                                          <div class="formSep">
                                                    <label class=""> Special Price From Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                      <div class="row-fluid">
                                                          <input class="span10"  data-date-format="dd/mm/yyyy" id="datePick4" type="date" name="Special_price_from_date2" value="<%=str.get("Special_price_from_date")%>" >
                                                      </div>
                                                    </div> 
                                                </div>	
                                                       <div class="formSep">
                                                    <label class=""> Special Price to Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                     <div class="row-fluid">
                                                       <input class="span10"  data-date-format="dd/mm/yyyy" id="datePick3" type="date" name="Special_price_to_date1" value="<%=str.get("Special_price_to_date")%>" >
                                                         </div>
                                                    </div> 
                                                    </div>
                                          
         <div class="formSep">
               <label class="req">Stock</label>                                        
               <input id="stock" class="span10" type="text" name="stock_qty" required value="<%=str.get("Stock_qty")%>" />
          </div>
        <div class="formSep">
               <label class="req">Stock Availability</label>                                        
               
               <select name="Stock" required >
                   <option value="In_stock" name="Stock" <%= ("In_stock".equals(Stock))?("selected='selected'"):""%> >In stock</option>
                     <option value="Out_of_stock" name="Stock" <%= ("Out_of_stock".equals(Stock))?("selected='selected'"):""%> >Out of stock</option>
               </select>
        </div>   
    </div>
        </div></div>
    <%}}else{
       %>
    
                
                 <div class="w-box-header" >
                             <h4>Add product varient</h4>
                             <input type="submit" id="save_product" value="Save" class="btn" style="float: right; margin-right: 40px;">
                 </div>
                    <input type="hidden" name="Product_id" value="<%=Product_id%>">
                 <div class="w-box-content">
                     <div class="row-fluid">
                         
                     <div class="span6" style="margin-left: 0px">
                                                                        <div class="formSep control-group">
                                                                             <label class="req">SKU</label>                                        
                                                                             <input id="SKU" class="span12" type="text" required name="SKU" onchange='sendInfo2();' required  />
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
                               <label class="req"> Price in Rs.</label>                                
                                <input id="pprice" class="span12" type="number" name="price" value="" required >                                                                          
                        </div>                                       

                     <div class="formSep">
                            <label >Special Price in Rs.</label>                                        
                            <input id="spprice" class="span12" type="number" name="special_price" value="" />
                      </div>                                    	
                      <div class="formSep">
                                                                 <label class=""> Special Price From Date</label>
                                                                 <div class="w-box" id="n_datepicker">
                                                                   <div class="row-fluid">
                                                                       <%
                                                                           DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                                                           String formattedDate = df.format(new Date());
                                                                       %>
                                                                       <input class="span12"  data-date-format="dd/mm/yyyy" id="datePick1" type="date" name="Special_price_from_date" value="<%= formattedDate %>" >
                                                                   </div>
                                                                 </div> 
                                                             </div>	
                                                                    <div class="formSep">
                                                                 <label class=""> Special Price to Date</label>
                                                                 <div class="w-box" id="n_datepicker">
                                                                  <div class="row-fluid">
                                                                    <input class="span12"  data-date-format="dd/mm/yyyy" id="datePick2" type="date" name="Special_price_to_date"  >
                                                                      </div>
                                                                 </div> 
                                                                 </div>	
                      <div class="formSep">
                            <label class="req">Stock</label>                                        
                            <input id="stock" class="span12" type="digits" name="stock_qty" required value="" />
                       </div>
                     <div class="formSep">
                            <label class="req">Stock Availability</label>                                        

                            <select name="Stock" required >
                                <option value="In_stock" name="Stock"  >In stock</option>
                                  <option value="Out_of_stock" name="Stock"  >Out of stock</option>
                            </select>
                     </div>   
                     </div>
                   <!--/////////////////////////////////Dynamic///////////////////////////////////////////-->
                     <div class="span6">
                         <%
                                   Mongo mg1 = new Mongo("Localhost",27017);
                                   DB db1 = mg1.getDB("baazaronline");
                                   DBCollection collection10 = db1.getCollection("product");
                                    DBObject doc10 = new BasicDBObject("_id",new ObjectId(Product_id));
                                    DBCursor cursor10 = collection10.find(doc10);
                                    while(cursor10.hasNext())
                                    {
                                        DBObject str10=cursor10.next();
                                        String cid=(String)str10.get("cid");
                                    
                                    String AttributeSet = request.getParameter("Attset");
                                       String uniqueV="";
                                       String RequiredClass="";
                                       String Frequired="";
                                          
                            
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
                                  
                       
                       <%}}}} mg1.close(); %>
                         
                     </div>
                     </div>

                 </div> <%}%>
               
      </form> </div>  
    </body>
</html>
<%@include file="Footer.jsp" %>