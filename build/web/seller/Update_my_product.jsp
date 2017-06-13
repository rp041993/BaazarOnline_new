<%@page import="seller.Seller_Login"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="org.bson.types.ObjectId"%>
<%@include file="Header.jsp" %>
<html>
    <head>
        
    </head>
    <body>
        <%String Product_id=request.getParameter("p_id");
        String i=request.getParameter("i");
        if(i.equals("m"))
        {
          Mongo mg = new Mongo(Seller_Login.Database,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection(Seller_Login.Product_price_collection);
            DBObject by_P_id = new BasicDBObject("Product_id", Product_id);
            String User_Object_ID=(String)session.getAttribute("Object_ID");
                DBObject by_User_ID = new BasicDBObject("User_Object_ID", User_Object_ID);    
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
          <form action="Update_Seller_product" method="Post">
   <div id="Add_Product" class="span12 w-box w-box-blue">
    <div class="w-box-header" >
                <h4>Update Product</h4>
                <button type="submit" id="save_product" value="Save_Product" class="btn" >Save Details</button>
    </div>
       <input type="hidden" name="Product_id" value="<%=Product_id%>">
       
    <div class="w-box-content">
                                                           <div class="formSep control-group">
                                                                <label class="req">SKU</label>                                        
                                                                <input id="SKU" class="span10" type="text" required name="SKU" value="<%=str.get("SKU")%>" onchange='sendInfo2();' required  />
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
                                                          <input class="span10"  data-date-format="dd/mm/yyyy" id="datePick14" type="date" name="Special_price_from_date2" value="<%=str.get("Special_price_from_date")%>" >
                                                      </div>
                                                    </div> 
                                                </div>	
                                                       <div class="formSep">
                                                    <label class=""> Special Price to Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                     <div class="row-fluid">
                                                       <input class="span10"  data-date-format="dd/mm/yyyy" id="datePick13" type="date" name="Special_price_to_date1" value="<%=str.get("Special_price_to_date")%>" >
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
   </div></form>
    <%}}else{%>
        <form action="Add_product_price" method="Post">
   <div id="Add_Product" class="span12 w-box w-box-blue">
    <div class="w-box-header" >
                <h4>Add product price</h4>
                <button type="submit" id="save_product" value="Save_Product" class="btn" >Save Details</button>
    </div>
       <input type="hidden" name="Product_id" value="<%=Product_id%>">
       
    <div class="w-box-content">
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
                   <input id="pprice" class="span10" type="text" name="price" value="" required>                                                                          
           </div>                                       

        <div class="formSep">
               <label >Special Price in Rs.</label>                                        
               <input id="spprice" class="span10" type="text" name="special_price" value="" />
         </div>                                    	
         <div class="formSep">
                                                    <label class=""> Special Price From Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                      <div class="row-fluid">
                                                          <%
                                                              DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                                              String formattedDate = df.format(new Date());
                                                          %>
                                                          <input class="span10"  data-date-format="dd/mm/yyyy" id="datePick11" type="date" name="Special_price_from_date" value="<%= formattedDate %>" >
                                                      </div>
                                                    </div> 
                                                </div>	
                                                       <div class="formSep">
                                                    <label class=""> Special Price to Date</label>
                                                    <div class="w-box" id="n_datepicker">
                                                     <div class="row-fluid">
                                                       <input class="span10"  data-date-format="dd/mm/yyyy" id="datePick12" type="date" name="Special_price_to_date"  >
                                                         </div>
                                                    </div> 
                                                    </div>	
         <div class="formSep">
               <label class="req">Stock</label>                                        
               <input id="stock" class="span10" type="text" name="stock_qty" required value="" />
          </div>
        <div class="formSep">
               <label class="req">Stock Availability</label>                                        
               
               <select name="Stock" required >
                   <option value="In_stock" name="Stock"  >In stock</option>
                     <option value="Out_of_stock" name="Stock"  >Out of stock</option>
               </select>
        </div>   
    </div>
   </div></form>
        
        <%}%>
    </body>
</html>
<%@include file="Footer.jsp" %>