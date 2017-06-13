<%-- 
    Document   : aadProductPrice
    Created on : 14 Apr, 2017, 12:22:29 PM
    Author     : baazaronline4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>

<form action="AddPriceProduct" method="get">
 <div class="container">
                <ul id="breadcrumbs">
                 </ul>
            </div>
      <div class="container">
                    <div class="row-fluid">
                        <div class="span6">
                            <div class="w-box">
                                <div class="w-box-header"> 

                 <h4>Product Price</h4>
                     </div>
                               
          <div class="w-box-content">
        <div class="formSep">                                                                                                                    
            <label for="price" class="control-label req"> Price</label>
            <input id="product_name" type="hidden" name="product_name"  value="" >                                                                          
                <input id="pprice" class="span6" type="digits" name="price"  value="" required="">         
                <input id="sd" class="span6" type="hidden" name="product_status"  value="<%= request.getParameter("product_status")%>" >         
                     </div>                                       
<div class="formSep" id ="groupprice" > 
               <label for="group_Price" class="control-label req">Group Price</label>
                  <input id="gpprice" class="span6" type="digits" name="group_Price"  value="" >                    
                        <input type="button" value="Add Group Price" class="add" id="add" />
       </div>     
        <div class="formSep">
               <label for="special_price" class="control-label req">Special Price</label>                                        
                 <input id="spprice" class="span6" type="text" name="special_price" />
           </div>                                    	
      <div class="formSep" id="date_id">
            <label for="Special_price_from" class="control-label req"> Special Price From Date</label>
              <input name="Special_price_from" id="dp1" class="span6" type="text" data-date-format="dd/mm/yyyy" value="" >
        </div>	
       <div class="formSep" id="date_id" >
        <label for="Special_price_from" class="control-label req">Special Price To Date</label>                                        
        <input name="Special_price_from" id="dp2" class="span6" type="text" data-date-format="dd/mm/yyyy" value="" >
     </div>
        <div class="formSep" id="addtprice">
            <label for="tier_price" class="control-label req">Tier Price</label>                                        
               <input id="pinco" class="span6" type="digits" name="tier_price"  />
                  <input type="button" value="Add Group Price" class="add" id="addtp" />
         </div>
                <div class="formSep">
    <label for="SKU" class="control-label req">SKU</label>                                        
    <input id="SKU"  type="digits" name="SKU" class="span6" onchange="checkuniqe(this.name,this.value,this.id)" required />
          </div>
       <div class="formSep control-group">
                                                        <label for="Stock_qty" class="control-label req" >Stock</label>
                                                        <div class="controls">
                                                           <input id="stock" class="span6" type="digits" name="Stock_qty" required />
                                                        </div>
                                                    </div> 
<!--    <div class="formSep">
        <label class="req">Display Actual cost</label>                                        
             <select>
                   <option value="incard">In Cart</option>
                       <option value="comform befor_oder" >Conform Before Order</option>
                           <option value="ongesture">OnGesture</option>
                              <option value="Use Config">Use Config</option>
                        </select>
                 </div>-->
            
               
                    <button class="btn-success"  >Add Price</button>

                
                <div>
                    <input type="hidden" value="<%= request.getParameter("producid") %>" name="Product_id">
                                    </div>
                <div>
                                        <input type="hidden" value="User_ID" name="User_ID">
       
                       
                
                </div>
                   </div>
                            
             </div>    
       </div>
  </div>
</div>
                                                                
</form>
                
                <script>
            $(document).ready(function() {
    $("#add").click(function() {
        var intId = $("#groupprice div").length + 1;
        var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
        var fName = $("<input type=\"text\" class=\"fieldname\" />");
        var fType = $("<select class=\"fieldtype\"><option value=\"General\">General</option><option value=\"Wholesale\">Wholesale</option><option value=\"Retailer\">Retailer</option></select>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"-\" />");
        removeButton.click(function() {
            $(this).parent().remove();
        });
        fieldWrapper.append(fName);
        fieldWrapper.append(fType);
        fieldWrapper.append(removeButton);
        $("#groupprice").append(fieldWrapper);
    });
    $("#preview").click(function() {
        $("#yourform").remove();
        var fieldSet = $("<fieldset id=\"yourform\"><legend>Your Form</legend></fieldset>");
        $("#buildyourform div").each(function() {
            var id = "input" + $(this).attr("id").replace("field","");
            var label = $("<label for=\"" + id + "\">" + $(this).find("input.fieldname").first().val() + "</label>");
            var input;
            switch ($(this).find("select.fieldtype").first().val()) {
                case "checkbox":
                    input = $("<input type=\"checkbox\" id=\"" + id + "\" name=\"" + id + "\" />");
                    break;
                case "textbox":
                    input = $("<input type=\"text\" id=\"" + id + "\" name=\"" + id + "\" />");
                    break;
                case "textarea":
                    input = $("<textarea id=\"" + id + "\" name=\"" + id + "\" ></textarea>");
                    break;    
            }
            fieldSet.append(label);
            fieldSet.append(input);
        });
        $("body").append(fieldSet);
    });
    
    
    $("#addtp").click(function() {
        var intId = $("#addtprice div").length + 1;
        var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
        var fName = $("<input type=\"text\" class=\"fieldname\" />");
        var fType = $("<select class=\"fieldtype\"><option value=\"General\">General</option><option value=\"Wholesale\">Wholesale</option><option value=\"Retailer\">Retailer</option></select>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"-\" />");
        removeButton.click(function() {
            $(this).parent().remove();
        });
        fieldWrapper.append(fName);
        fieldWrapper.append(fType);
        fieldWrapper.append(removeButton);
        $("#addtprice").append(fieldWrapper);
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

       alert("name is already exite\n\pleas reenter value");
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
<%@include file="Footer.jsp" %>>
