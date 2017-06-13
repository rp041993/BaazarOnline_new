<%-- 
    Document   : ShippingCalculator
    Created on : 24 Apr, 2017, 6:28:03 PM
    Author     : baazarteam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>

     <!-- main content -->
             <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="w-box">
                            <div class="w-box-header">
                                <h4>Shipping Calculator</h4>
                            </div>
                            <div class="w-box-content">
<form action="AddCommisionValue" method="get" id="validate_field_types">
    <div class="formSep control-group">
    <label class="req">Commission</label>
    <input type="digits" class="span10" name="Commission" value="" required="">
    <input type="hidden" class="span10" id="cid" name="cid" value="<%= request.getParameter("val")%>">
    <input type="hidden" class="span10" id="name" name="name" value="<%= request.getParameter("name")%>">
    <input type="hidden" class="span10" id="type"name="type" value="<%= request.getParameter("type")%>">
  </div>   
<div class="formSep control-group">
   <label class="req">Shipment</label>
    <input type="text" class="span10" name="Shippment" value="" required="">
  </div>
  <div class="formSep control-group">
       <label class="req">Packaging Cost </label>
  <input type="text"  class="span10" name="Packaging_Cost" value="" required="">
  </div>
<div class="formSep control-group">
  <label class="req">salary</label>
  <input type="text" class="span10" name="Labour_salary" value="" required="">
</div>
<div class="formSep control-group">
   <label class="req">Services Tax %</label>
    <input type="text" class="span10" name="Services_Tax" value="" required="">
</div>
 <input type="submit" value="Submit">
</form>
  </div>
  </div>
  </div>
  </div>
  </div>
  <script>
       
       

$( document ).ready(function() {

 

      //alert("document is ready"+cid);
      
  
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
    
  });
  </script>                     
                    
<%@include file="Footer.jsp"%>