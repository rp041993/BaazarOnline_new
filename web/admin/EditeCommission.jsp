<%-- 
    Document   : EditeCommission
    Created on : 19 May, 2017, 5:15:52 PM
    Author     : baazaronline4
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<%
String cid = request.getParameter("cid");
                String ip = getServletContext().getInitParameter("ip");
               Mongo mg = new Mongo(ip ,27017);
               DB db = mg.getDB("baazaronline");
               DBCollection collection = db.getCollection("baazarCommision");
               DBObject doc = new BasicDBObject("cid", cid);
               DBCursor cursor = collection.find(doc);
               
             while (cursor.hasNext()) {
               DBObject data = cursor.next();
               System.out.println("this is data those  i am getting from server"+data);
                    int Commission = Integer.parseInt(data.get("Commission").toString());
                    int Shippment = Integer.parseInt(data.get("Shippment").toString());
                    int Packaging_Cost = Integer.parseInt(data.get("Packaging_Cost").toString());
                    int Labour_salary = Integer.parseInt(data.get("Labour_salary").toString());
                    int Services_Tax = Integer.parseInt(data.get("Services_Tax").toString());
                   
                    
                 
                    

%>
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
    <input type="digits" class="span10" name="Commission" value="<%=Commission%>" required="">
    <input type="hidden" class="span10" id="cid" name="cid" value="<%= cid%>">
    <input type="hidden" class="span10" id="name" name="name" value="<%= request.getParameter("name")%>">
    <input type="hidden" class="span10" id="type"name="type" value="<%= request.getParameter("type")%>">
  </div>   
<div class="formSep control-group">
   <label class="req">Shipment</label>
    <input type="text" class="span10" name="Shippment" value="<%=Shippment%>" required="">
  </div>
  <div class="formSep control-group">
       <label class="req">Packaging Cost </label>
  <input type="text"  class="span10" name="Packaging_Cost" value="<%=Packaging_Cost%>" required="">
  </div>
<div class="formSep control-group">
  <label class="req">salary</label>
  <input type="text" class="span10" name="Labour_salary" value="<%=Labour_salary%>" required="">
</div>
<div class="formSep control-group">
   <label class="req">Services Tax %</label>
    <input type="text" class="span10" name="Services_Tax" value="<%=Services_Tax%>" required="">
</div>
<%}%>
 <input type="submit" value="update">
 <input type="submit" value="delete" onclick="change()">
 <script>
    function change(){
        debugger;
        document.getElementById("type").value = "delete";
    } 
     
 </script>
</form>
  </div>
  </div>
  </div>
  </div>
  </div>
<%@include file="Footer.jsp"%>