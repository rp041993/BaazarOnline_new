<%-- 
    Document   : AddAttribute
    Created on : 4 Mar, 2017, 12:41:46 PM
    Author     : baazarteam4
--%>

<%@include  file="Header.jsp" %>

        
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
                                <form id="surveyForm" action="AddAtribute" method="post" >
                                   <div class="formSep">
                                        <label class="req f-error">Attribute Code</label>
                                        <input value="" class="span10" type="text" name="Attribute_code" required id="Attribute_code"/>
                                     
                                    </div> 
                                    
                                     <div class="formSep" id="vname">
                                        <label class="req">Visible Name</label>
                                        <input value="" class="span10" type="text" name="Visible_name" required id="val1_text"/>
                                    </div>
                                    <div>
                                        <input type="hidden" value="Attribute" name="Attribute">
                                    </div>
                                    <div class="formSep" id="citfso">
                                     <label class="req">Catalog Input Type for Store Owner</label>
                                        <select name="citso" id="val1_sport" class="span10" onchange="check()">
                                            <option value="Text Field" >Text Field</option>
                                            <option value="Text Area">Text Area</option>
                                            <option value="Date" >Date</option>
                                            <option value="Yes/No">Yes/No</option>
                                            <option value="Multiple Select" >Multiple Select</option>
                                            <option value="Drop Down" >Drop Down</option>
                                            <option value="Price" >Price</option>
<!--                                            <option value="fixed product Tax" >fixed product Tax</option>
                                            <option value="Media image" >Media image</option>-->
                                        </select>
                                    </div>
                                    <div  class="formSep" id="Mydiv" style="display: none;">
                                     <input type="button" value="Add Options" class="add" id="add" />
                                        <label class="req"> Options: </label>  
                                        <input type="hidden" id="aavalues" name="opt" value="op">
                                       
                                    </div>
                                    <input id="Default_Value" value="" class="span10" type="hidden" name="Def"  />
                                    <div class="formSep" id="defvalue">
                                        <label class="req">Default Value</label>
                                        <input id="defoul" value="" class="span10" type="text" name="Def"  />
                                    </div>
                                      <div class="formSep" id="dateaf" style="display: none;">
                                        <label class="req">date</label>
                                        <input name="Default_Value_date" id="dp1" class="span8" type="text" data-date-format="dd/mm/yyyy" value="" >
                                       <span class="help-block">dd/mm/yyyy</span>
                                    </div>
                                    <div class="formSep" id="dtexarea" style="display: none;">
                                        <label class="req">Textarea</label>
                                        <textarea id="textareaid" rows="5" cols="15" name="Default_Value_textArea">
                                            
                                        </textarea>
                                    </div>
                                    
                                    <div class="formSep" id="uvalue">
                                        <label class="req"> Unique Value </label>
                                         <select name="unique_value" id="val1_sport" class="span10">
                                            <option>Yes</option>
                                            <option name="s" value="textarea">No</option>
                                         </select>
                                    </div>	
                                    <div class="formSep" id="valueR">
                                        <label class="req"> Values Required </label>
                                         <select name="Values_requier" id="val1_sport" class="span10">
                                           <option>Yes</option>
                                           <option>No</option>
                                         </select>
                                    </div>	
                                     <div class="formSep" id="invfso">
                                        <label class="req"> Input Validation for Store Owner  </label>
                                         <select name="IVFSWAT" id="val1_sport" class="span6">
                                           <option>none</option>
                                           <option value="DecimalNumber">Decimal Number</option>
                                           <option value="IntegerNumber">Integer Number</option>
                                           <option value="Email">Email</option>
                                           <option value="ulr">URL</option>
                                           <option value="latter">latter</option>
                                         </select>              
                                    </div>
                                  <div class="formSep">
                                        <button type="submit" id="sbumitid" class="btn">Save</button>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
             <script>
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
                                              $("#dtexarea").hide();
                                          }
                                        if(ddlcategory=="Text Area")
                                        {
                                          
                                              $("#defvalue").remove();
                                              $("#dateaf").remove();
                                              $("#citfso").show();
                                              $("#defvalue").hide();
                                              $("#uvalue").show();
                                              $("#dtexarea").show();
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
                                              $("#dtexarea").hide();
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
                                               $("#dtexarea").hide();
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
                                               $("#dtexarea").hide();
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
                                               $("#dtexarea").hide();
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
                                               $("#dtexarea").hide();
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
                                               $("#dtexarea").hide();
                                        }
                                         if(ddlcategory=="Price")
                                        { 
                                              $("#defvalue").show().va
                                              $("#citfso").show();
                                              $("#defvalue").show();
                                              $("#uvalue").show();
                                              $("#valueR").show();
                                              $("#invfso").show();
                                              $("#dateaf").hide();
                                              $("#Mydiv").hide();
                                               $("#dtexarea").hide();
                                               
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
                                              $("#dtexarea").hide();
                                        }
                                    }
                                    $('#sbumitid').click(function() {
                                        
         var ddlcategory = document.getElementById('val1_sport').value;
             
       if (ddlcategory=="Text Field") {
           
            var defoul = document.getElementById('defoul').value;
            var def = document.getElementById('Default_Value').value=defoul;
                       
        } if (ddlcategory=="Text Area") {
           
            var textarea = document.getElementById('textareaid').value;
            var def = document.getElementById('Default_Value').value=textarea;    
          }
       if (ddlcategory=="Date") {
            
            var dp1 = document.getElementById('dp1').value;
            var def = document.getElementById('Default_Value').value=dp1; 
}
 
                               
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
         
var opt=[];
    $(".fieldname" ).each(function( index ) {
        opt.push($( this ).val());
       });
   document.getElementById("aavalues").value=opt;
 });

});


</script>
<script type="text/javascript">
var options1 = $('#sel1 option');
var sel1=[];
var sel2=[];
var values = $.map(options1 ,function(option) {
  sel1.push(option.id);
});

var values1 = $.map(options2 ,function(option) {
       sel2.push(option.id);
});
    for (var i = 0; i < sel2.length; i++) {
        
       
        for (var j = 0; j < sel1.length; j++) {
            
            if (sel2[i]===sel1[j])
            {
                $("#"+sel1[j]).remove();
           
             }
              

          }
     
}
  
 
</script>
   <%@include file="Footer.jsp" %>