       
<%@include file="Header.jsp" %>

 
        <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <form id="1" action="InputValidate" method="post">
                    <div class="span8">
                        <div class="w-box">
                            <div class="w-box-header">
                                <h4>User Registration</h4>
                            </div>
                            
                            
                            <div class="w-box-content">
                                
                                <div class="span6"> 
                                    <div class="formSep">
                                        <label for="u_username">Username</label>
                                        <input type="text" id="u_username" name="u_username" required class="span8" />       
                                    </div>
                                    <div class="formSep">
                                        <label for="u_name">Name</label>
                                        <input type="text" id="u_name" name="u_name" required class="span8" />
                                    </div>
                                    <div class="formSep">
                                        <label for="u_email">Email</label>
                                        <input type="text" id="u_email" name="u_email" required class="span8" onchange='check_email()'/>
                                        <label  id='message' class="error" ></label>
                                    </div>
<script>
    function check_email() {
        var x=document.getElementById('u_email').value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        document.getElementById('message').innerHTML = "Enter a valid email";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('message').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }
}
</script>
                                    <div class="formSep">
                                        <label>Gender</label>
                                        <label for="u_male" class="radio inline"><input type="radio" name="u_gender" required value="Male" id="u_male"/> Male</label>
                                        <label for="u_female" class="radio inline"><input type="radio" name="u_gender" required value="Female" id="u_female"/> Female</label>
                                    </div>
                                </div>    
                                     
                                <div class="span6">      
                                     
                                    <div class="formSep">
                                        <label for="a_password">Current Admin Password</label>
                                        <input type="password" id="a_password" name="a_password" class="span8" value="Admin" />
                                        <span class="help-block">Enter Password</span>
                                    </div>
                                    <div class="formSep">
                                        <label for="u_password">Password</label>
                                        <span class="help-block">Enter Password</span>
                                        <input type="password" id="u_password" name="u_password" required class="span8" onchange='check_pass()'/>                                      
                                        <label  id='pass_message' class="error" ></label>
<script>
    function check_pass() {
    var x=document.getElementById('u_password').value;
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
    var ok=re.test(x);
    if (!ok) {
        console.log("!ok")
        document.getElementById('pass_message').innerHTML = "Password should contaion atleast one,capital,small and number";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('pass_message').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }
}
</script>
                                        <span class="help-block">Repeat Password</span>
                                        <input type="password" id="u_repassword" name="u_repassword" required class="span8" onchange='check_re_pass();'/>  
                                        <label  id='repass_message' class="error" ></label>                                       
                                    </div>
<script>
    function check_re_pass() {
    var pass=document.getElementById('u_password').value;
     var re=document.getElementById('u_repassword').value;
    if (re!=pass) {
        document.getElementById('repass_message').innerHTML = "Password not Matched";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('repass_message').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }
}
</script> 
    
                                    
    
                                    <div class="formSep">
                                        <label for="u_account">Account </label>
                                        <select name="u_account">
                                         <option value="Active">Active</option>
                                         <option value="InActive">InActive</option>
                                        </select>
                                    </div>
    
                                </div>
    
                                    <div class="formSep sepH_b">
                                        <button  class="btn btn-beoro-3" type="submit" name="submit"  value="registration"  id="submit" >Register</button>
                                        <a href="Registration.jsp" class="btn btn-link">Cancel</a>
                                    </div>
                                </div></div></div>
                        
                    <div class="span4">
                        <div class="w-box">
                            <div class="w-box-header">
                                <h4>Page Role Permission</h4>
                            </div>
                            <div class="w-box-content">
                                    <input type="checkbox" name="role" value="None" style="display:none" checked > <BR>
                                    <input type="checkbox"  name="role" value="Registration.jsp"> User Registration<BR>
                                    <input type="checkbox"  name="role" value="UserView.jsp"> User View/Edit<BR>
                                    <input type="checkbox"  name="role" value="Category_form.jsp"> Category<BR>
                                    <input type="checkbox"  name="role" value="showAttribute.jsp"> Add Attribute<BR>
                                    <input type="checkbox"  name="role" value="CreateAttributeSet.jsp"> Add Attribute set<BR>
                                    <input type="checkbox"  name="role" value="AddPin.jsp"> Add Pin<BR>
                                    <input type="checkbox"  name="role" value="ReadPin.jsp"> Show PinCode<BR>
                                    </div>        
                               </div> 
                            </div></form>
                        </div>
                    </div> 
             
  

<%@include file="Footer.jsp" %>