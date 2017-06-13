<%-- 
    Document   : EditeAttribute
    Created on : 10 Mar, 2017, 3:01:06 PM
    Author     : baazarteam4
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="java.util.List"%>
<%@page import="org.bson.Document"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%@include  file="Header.jsp" %>
 <%
                      try {
//                  
                   String name = request.getParameter("Attribute_code");
                String ip = getServletContext().getInitParameter("ip");
                    MongoClient client = new MongoClient(ip , 27017);
                    MongoDatabase database = client.getDatabase("baazaronline");
                    MongoCollection<Document> collection = database .getCollection("Attribute");
                    BasicDBObject doc = new BasicDBObject("attcode", name);
            
            List<Document> attributeSet = (List<Document>) collection.find(doc).into(new ArrayList<Document>());
                  for (Document attribure : attributeSet) {
                     Object ido =  attribure.get("attcode");
                     Object citsoo =  attribure.get("citso");
                     Object IVSOo =  attribure.get("IVSO");
                     Object DefautVo =  attribure.get("DefautV");
                     Object UniqueVo =  attribure.get("UniqueV");
                     Object ValuesRo =  attribure.get("ValuesR");
                     Object Visiblenameo =  attribure.get("Visiblename");
                      String id =ido.toString();
                       String citso =citsoo.toString();
                        String IVSO =IVSOo.toString();
                         String DefautV =DefautVo.toString();
                          String UniqueV =UniqueVo.toString();
                          String ValuesR =ValuesRo.toString();
                           String Visiblename =Visiblenameo.toString();
                      ArrayList<Document> value = (ArrayList<Document>) attribure.get("values");
                    
                     System.out.println("afsa  "+value);
%>  

    <!-- breadcrumbs -->
            <div class="container">
                <ul id="breadcrumbs">
                    
                     
                </ul>
            </div>
      <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="w-box">
                            <div class="w-box-header"> 
                              
                                <h4>Add Attribute</h4>
                            </div>
                            <div class="w-box-content">
                                <form action="Update" method="get">
                                    <div class="formSep"> 
                     <div class="formSep" id="acode">
                          <label class="req">Attribute Code</label>
                          <input type="text" value="<%out.print(id);%>" name="Attribute_code" readonly>
                   </div>
                         
                        <div>
                               
                               <input type="hidden" value="Attribute" name="Attribute" readonly>
                         </div>    
                   
                                  
                                     <div class="formSep" id="vname">
                                        <label class="req">Visible Name</label>
                                        <input value="<%out.print(Visiblename);%>" class="span10" type="text" name="Visible_name" required id="val1_text"/>
                                    </div>
                                      <div class="formSep" id="citfso">
                                           <label class="req">Catalog Input Type for Store Owner</label>
                                        <select  name="citso" id="val1_sport" class="span10"    onchange="check()">
                                            
                                            <option selected="selected"><%out.print(citso);%></option>
                                            <option value="Text Field" >Text Field</option>
                                            <option value="Text Area">Text Area</option>
                                            <option value="Date" >Date</option>
                                            <option value="Yes/No">Yes/No</option>
                                            <option value="Multiple Select" >Multiple Select</option>
                                            <option value="Drop Down" >Drop Down</option>
                                            <option value="Price" >Price</option>
                                            <option value="fixed product Tax" >fixed product Tax</option>
                                            <option value="Media image" >Media image</option>
                                        </select>
                                    </div>
                                  <div  class="formSep" id="Mydiv" style="display: block;">
                                            <input type="hidden" id="aavalues" name="opt1" value="op">
                                         <input type="button" value="Add Options" class="add" id="add" />
                                        <label class="req"> Options 1: </label> 
                                        <%          for (int i = 0; i < value.size(); i++) { %>
<!--                                        <div class="fieldwrapper" id="field<%out.print(i);%>">-->
                                        <input type="text" class="fieldname" name="v1" value="<%out.print(value.get(i));%>">
                                      <input type="button" class="remove" value="remove" />
                                     <%}
                                        %>
                                    </div>
                                   
                                    <div class="formSep" id="defvalue">
                                        <label class="req">Default Value</label>
                                        <input value="<%out.print(DefautV);%>" class="span10" type="text" name="Default_Value"  />
                                    </div>
                                       <div class="formSep" id="dateaf" style="display: none;">
                                        <label class="req">date</label>
                                       <input id="dp1" class="span8" type="text" data-date-format="dd/mm/yyyy" value="12/02/2017">
                                       <span class="help-block">dd/mm/yyyy</span>
                                    </div>
                                  	
                                    <div class="formSep" id="uvalue">
                                        <label class="req"> Unique Value </label>
                                         <select name="unique_value" id="val1_sport" class="span10" value="<%out.print(UniqueV);%>">
                                            <option>Yes</option>
                                            <option name="s" value="textarea">No</option>
                                         </select>
                                    </div>
                                           
                                     <div class="formSep" id="valueR">
                                        <label class="req"> Values Required </label>
                                         <select name="Values_requier" id="val1_sport" class="span10" name="<%out.print(ValuesR);%>">
                                           <option>Yes</option>
                                           <option>No</option>
                                         </select>
                                    </div>
                                           
                                           
                                     <div class="formSep" id="invfso">
                                        <label class="req"> Input Validation for Store Owner  </label>
                                         <select name="IVFSWAT" id="val1_sport" class="span6" value="<%=request.getParameter("IVFSWAT")%>">
                                           <option>none</option>
                                           <option value="DecimalNumber">Decimal Number</option>
                                           <option value="IntegerNumber">Integer Number</option>
                                           <option value="Email">Email</option>
                                           <option value="ulr">URL</option>
                                           <option value="latter">latter</option>
                                         </select>              
                                    </div>
                                    
                                   
                                    <div class="formSep">
                                        <button id="editatt" type="submit" class="btn">Update</button>
                                        <a href="DeleteAttributes?Attribute_code=<%out.print(id);%>">  <button type="button" class="btn">Delete</button><a> 
                                    </div>
                                   
                                </form>  
                                          
                           </div>
                        </div>
                    </div>
                    <div>
 <div class="footer_space"></div>
</div>
       
             <% 
     
               }

               } catch (Exception e) {
               }
   
                     
                    %>
                                <script> 
                                     window.onload = check();
                                    
                                    function check(){
                                        var ddlcategory = document.getElementById('val1_sport').value;
                                        if(ddlcategory=="Text Field")
                                        {
                                              $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").show();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                        if(ddlcategory=="Text Area")
                                        {
                                              $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").show();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                        if(ddlcategory=="Date")
                                        {
                                            
                                             $("#dateaf").show();
                                              $("#citfso").show();
                                              $("#defvalue").hide();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#Mydiv").hide();
                                             
                                        }
                                        if(ddlcategory=="Yes")
                                        {
                                             $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").show();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                        if(ddlcategory=="Multiple Select")
                                        {
                                              $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").hide();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                              $("#Mydiv").show();
                                        }
                                        if(ddlcategory=="Drop Down")
                                        {
                                            $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").hide();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").show();
                                        }
                                          if(ddlcategory=="fixed product Tax")
                                        {
                                           $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").hide();
                                              $("#uvalue").hide();
                                              $("#valueR").hide();
                                              $("#invfso").hide();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                        
                                         if(ddlcategory=="Media image")
                                        {
                                             $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").hide();
                                              $("#uvalue").hide();
                                              $("#valueR").hide();
                                              $("#invfso").hide();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                         if(ddlcategory=="Price")
                                        { 
                                            $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").numeric() 
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                         if(ddlcategory=="Yes/No")
                                        {
                                              $("#defvalue").show();
                                              $("#citfso").show();
                                              $("#defvalue").show();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                        }
                                    }
                                </script>
                                  <script>
    $(document).ready(function() {
        
        $("#editatt").click(function() {
    var intId = $("#Mydiv div").length + 1;
        var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
        var fName = $("<input type=\"text\" class=\"fieldname\" name=\"option[" + intId + "]\" />");
        //var fType = $("<select class=\"fieldtype\"><option value=\"checkbox\">Checked</option><option value=\"textbox\">Text</option><option value=\"textarea\">Paragraph</option></select>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"remove\" />");
        removeButton.click(function() {
            $(this).parent().remove();
        });
   fieldWrapper.append(fName);
       //  fieldWrapper.append(fType);
        fieldWrapper.append(removeButton);
        $("#Mydiv").append(fieldWrapper);
     
var opt=[];
    $(".fieldname" ).each(function( index ) {
        opt.push($( this ).val());
    
    });
//       alert("thsi is testing"+opt)
   document.getElementById("aavalues").value=opt;
//  alert("thsAMI  "+ document.getElementById("aavalues").value) 

});
});

        </script>
        
        
                                       <script>
    $(document).ready(function() {
    $("#add").click(function() {
        var intId = $("#Mydiv div").length + 1;
        var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
        var fName = $("<input type=\"text\" class=\"fieldname\" name=\"option[" + intId + "]\" />");
        //var fType = $("<select class=\"fieldtype\"><option value=\"checkbox\">Checked</option><option value=\"textbox\">Text</option><option value=\"textarea\">Paragraph</option></select>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"remove\" />");
        removeButton.click(function() {
            $(this).parent().remove();
        });
   fieldWrapper.append(fName);
       //  fieldWrapper.append(fType);
        fieldWrapper.append(removeButton);
        $("#Mydiv").append(fieldWrapper);

 });

});


        </script>
 <%@include file="Footer.jsp" %>