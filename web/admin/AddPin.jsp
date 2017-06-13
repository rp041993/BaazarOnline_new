
<%-- 
    Document   : AddPin
    Created on : 14 Mar, 2017, 11:18:46 AM
    Author     : baazarteam5
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html lang="en-US">
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
                             
                                <h4>Add Pin</h4>
                               </div>
                   <div class="w-box-content">
               <form  action="Addcity" method="post">
               <div class="formSep">
                                                                                                                                         
              <label class="req">City Code</label>
                                
             <input id="cicode" class="span10" type="text" name="CityCode"  value="" required="">
                                                                          
                </div>    
                                   
               <div class="formSep">
                 <label class="req">District</label>
                 <lable class="error"for="vall_url"generated="true">Please inter Valid District</lable>
                 <input id="distic" class="span10" type="text" name="District"  value="" required=""  onchange="capitalizeFirstLetter()">                    
                     </div>     
                                                                                                     
<!--                  <!--    <div class="formSep">
                              <input type="hidden" value="Pincode" name="pincode">
                              <label class="req">Catalog Input Type for Store Owner</label>
                             <select name="Code" id="mySelect" class="span10" onchange="check()">
                             </select>    
                             </div>-->
               <div class="formSep">
               <label class="req">PinCode</label>
                                        
               <input id="pinco" class="span10" type="text" name="Pincode" required onchange="valid()"/>
                 </div>
                                    	
                <div class="formSep">
              <label class=""> State</label>
              <input id="state" value=""class="span10" type="text" name ="State" required=""/>
                                            
                    </select>
                   </div>	                                         
                     <div class="formSep">
                        <button type="submit" class="btn" >Save</button>
                           </div>
                              </form>
                            </div>
                        </div>
                    </div>
   <div>
    <div class="footer_space"></div>
</div>

<script type="text/javascript">
function valid()
{
var pin_code=document.getElementById("pinco");

var pat1=/^\d{6}$/;
if(!pat1.test(pin_code.value))
{
alert("Pin code should be 6 digits ");
pin_code.focus();
return false;
}
}
function capitalizeFirstLetter(string) {
    var dist=document.getElementById("distic");
    var state=document.getElementById("state");
    return dist.charAt(0).toUpperCase() + dist.slice(1);
}
</script>
                                <script language="JavaScript">
                                    
                                    

    $(document).ready(function() {
        //* form validation
        beoro_validate.simple();
        beoro_validate.extended();
    });

    //* form validation
    beoro_validate = {
        simple: function() {
            if($('#validate_field_types').length) {
                $('#validate_field_types').validate({
                    onkeyup: false,
                    errorClass: 'error',
                    validClass: 'valid',
                    highlight: function(element) {
                        $(element).closest('div').addClass("f-error");
                    },
                    unhighlight: function(element) {
                        $(element).closest('div').removeClass("f-error");
                    },
                    errorPlacement: function(error, element) {
                        $(element).closest('div').append(error);
                    },
                    rules: {
                        val1_url: { required: true, url: true },
                        val1_text: { required: true },
                        val1_sport: { required: true },
                        val1_sport2: { required: true, minlength: 2 },
                        val1_group0: { required: true },
                        val1_group1: { required: true, minlength: 2 },
                        val1_file: { required: true }
                    },
                    invalidHandler: function(form, validator) {
                        // callback
                    }
                })
            }
        },
        extended: function() {
            if($('#s2_val').length) {
                $("#s2_val").select2({
                    placeholder: "Select a State",
                    allowClear: true
                })
            }
            if($('#dp_val').length) {
                $('#dp_val').datepicker({
                    autoclose: true
                }).on('changeDate', function(ev){
                    $('#dp_val').valid();
                })
            }
            if($('#wysiwg_val').length) {
                ck_wysiwg = CKEDITOR.replace( 'wysiwg_val', {
                    toolbar: 'Standard'
                });
                
                // custom rule for ckeditor
                jQuery.validator.addMethod("ckeditor", function(value, element) { 
                    var textData = ck_wysiwg.getData();
                    if(textData.length>0) return true;
                    return false;
                }, "No data in editor");
            }
            if($('#count_textarea_val').length) {
                $('#count_textarea_val').textareaCount({
                    'maxCharacterSize': 200,
                    'originalStyle': 'originalTextareaInfo',
                    'warningStyle' : 'warningTextareaInfo',
                    'warningNumber': 40,
                    'displayFormat' : '#input/#max | #words words'
                })
            }
            if($('#validate_extended').length) {
                var $form_ext = $("#validate_extended");
                
                $form_ext.validate({
                    onkeyup: false,
                    errorClass: 'error',
                    validClass: 'valid',
                    highlight: function(element) {
                        $(element).closest('div').addClass("f-error");
                    },
                    unhighlight: function(element) {
                        $(element).closest('div').removeClass("f-error");
                    },
                    errorPlacement: function(error, element) {
                        $(element).closest('div').append(error);
                    },
                    rules: {
                        s2_val: { required: true },
                        dp_val: { required: true },
                        wysiwg_val: "ckeditor",
                        count_textarea_val: { required: true, minlength: 50 }
                    },
                    invalidHandler: function(form, validator) {
                        // callback
                    }
                });
                var settings = $.data($form_ext[0], 'validator').settings;
                // select2
                settings.ignore += ':not(#s2_val)';
                // wysiwg
                settings.ignore += ':not(#wysiwg_val)';
            }
        }
    };

</script>                               
                                
                                <script>
 
 
 
                                        function check(){
                                        var ddlcategory = document.getElementById('mySelect').value;
                                        if(ddlcategory=="Text Field")
                                        {
                                            var div = document.getElementById('Mydiv');
                                           div.style.display='none';
                                        }
                                        if(ddlcategory=="Text Area")
                                        {
                                            var div = document.getElementById('Mydiv');
                                           div.style.display='none';
                                        }
                                        if(ddlcategory=="Date")
                                        {
                                            var div = document.getElementById('Mydiv');
                                           div.style.display='none';
                                        }
                                        if(ddlcategory=="Yes")
                                        {
                                            var div = document.getElementById('Mydiv');
                                           div.style.display='none';
                                        }
                                        if(ddlcategory=="Multiple Select")
                                        {
                                            var div = document.getElementById('Mydiv');
                                           div.style.display='block';
                                        }
                                        if(ddlcategory=="Drop Down")
                                        {
                                           var div = document.getElementById('Mydiv');
                                           div.style.display='block';
                                        }
                                    }
                                </script>

                                <%@include file="Footer.jsp" %>