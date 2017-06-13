<!DOCTYPE HTML>
<html lang="en-US">

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:58 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <link rel="icon" type="image/ico" href="favicon.ico">
    <title>Baazaronline.com - CMS Login</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet'>
    <!-- jQuery framework -->
        <script src="../js/jquery.min.js" type="text/javascript"></script>
    <!-- validation -->
        <script src="../js/lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function(a){a.fn.vAlign=function(){return this.each(function(){var b=a(this).height(),c=a(this).outerHeight(),b=(b+(c-b))/2;a(this).css("margin-top","-"+b+"px");a(this).css("top","50%");a(this).css("position","absolute")})}})(jQuery);(function(a){a.fn.hAlign=function(){return this.each(function(){var b=a(this).width(),c=a(this).outerWidth(),b=(b+(c-b))/2;a(this).css("margin-left","-"+b+"px");a(this).css("left","50%");a(this).css("position","absolute")})}})(jQuery);
        $(document).ready(function() {
            if($('#login-wrapper').length) {
                $("#login-wrapper").vAlign().hAlign()
            };
            if($('#login-validate').length) {
                $('#login-validate').validate({
                    onkeyup: false,
                    errorClass: 'error',
                    rules: {
                        login_name: { required: true },
                        login_password: { required: true }
                    }
                })
            }
            if($('#forgot-validate').length) {
                $('#forgot-validate').validate({
                    onkeyup: false,
                    errorClass: 'error',
                    rules: {
                        forgot_email: { required: true, email: true }
                    }
                })
            }
            $('#pass_login').click(function() {
                $('.panel:visible').slideUp('200',function() {
                    $('.panel').not($(this)).slideDown('200');
                });
                $(this).children('span').toggle();
            });
        });
    </script>
    <%
            session.setAttribute("mobile",null);
            session.setAttribute("Name",null);
            session.setAttribute("Email",null);
            session.setAttribute("Random",null);
%>
</head>
<body>
    <div id="login-wrapper" class="clearfix">
        <div class="main-col">
            <div style="padding-bottom: 10px; border-bottom: 1px solid rgb(204, 204, 204); 
                 width: 100%; text-align: center; position: relative; height: 70px; 
                 float: left; margin-bottom: 10px;">
                <img src="../img/baazar.png" alt="" class="logo_img"/>
            </div>
            <div class="panel">
                <p class="heading_main">BaazarOnline Seller Login</p>
                <form id="login-validate" action="Seller_Login" method="post">
                    <label for="u_email">Email/Mobile number</label>
                    <input type="text" id="u_email" name="u_email" onchange='sendInfo();' required/>
                    <label  id='message' class="error" ></label>
<script> 
    var request; 
    function sendInfo()  
    {  
       var x=document.getElementById('u_email').value;
       console.log(x);
    
    var url="sellerEmailAjax?val="+x;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getInfo;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getInfo(){  
    if(request.readyState==4){  
    var val=request.responseText; 
    
    if(val=="Email already exists")
    {
        document.getElementById('message').innerHTML = "You are registered user";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }  
    else
    {
        document.getElementById('message').innerHTML = "you are not registered";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
        
    }
    }  
}
</script>
            
              <label for="login_password">Password</label>
              <input type="password" id="login_password" name="login_password" value="" onchange="check_pass();" />
               <label  id='pass_message' class="error" ></label>
<script>
    function check_pass() {
    var x=document.getElementById('login_password').value;
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
    var ok=re.test(x);
    if (!ok) {
        console.log("!ok")
        document.getElementById('pass_message').innerHTML = "Please Enter valid Password";
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
                    <label for="login_remember" class="checkbox"><input type="checkbox" id="login_remember" name="login_remember" /> Remember me</label>
                    <div class="submit_sect">
                        <button type="submit" name="submit"  value="login"  id="submit" class="btn btn-beoro-3">Sign In</button>
                    </div>
                </form>
            </div>
            <div class="panel" style="display:none">
                <p class="heading_main">Can't sign in?</p>
                <form id="forgot-validate" action="Send_OTP" method="post">
                    <label for="forgot_pass">Your registered mobile number</label>
                    <input type="text" id="forgot_pass" name="u_number"  onchange='check_mobile();' required/>
                    <label  id='forgot_message' class="error" ></label>
<script>
    function check_mobile() {
    var num=document.getElementById('forgot_pass').value;
    var limit = /^\d{10}$/;
    var pattern = /^[789]\d{9}$/;
    var Len_ok=limit.test(num);
    var pattern_ok=pattern.test(num);
    if (!Len_ok || !pattern_ok) 
    {
        document.getElementById('forgot_message').innerHTML = "Enter a valid number";
        document.getElementById('Request_pass').disabled = true;
        document.getElementById('Request_pass').style.cursor="not-allowed";
    }
    else
    {
        sendInfo(num); 
    
    var request1;  
    function sendInfo(num)  
    {  
       
    var url="SellerContactAjax?val="+num;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getInfo;  
    request.open("GET",url,true);  
    request.send();  
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getInfo(){  
    if(request.readyState==4){  
    var val=request.responseText; 
    if(val=="Number already exists"){
        document.getElementById('forgot_message').innerHTML = "";
        document.getElementById('Request_pass').disabled = false;
        document.getElementById('Request_pass').style.cursor="";       
    }  
    else
    {
        document.getElementById('forgot_message').innerHTML = "Entered number is not registered";
        document.getElementById('Request_pass').disabled = true;
        document.getElementById('Request_pass').style.cursor="not-allowed";
    }    
    }
}}}
</script> 
                    <div class="submit_sect">
                        <button type="submit" id="Request_pass" name="Request_pass" value="Request New Password" class="btn btn-beoro-3">Request New Password</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="login_links">
            <a href="javascript:void(0)" id="pass_login"><span>Forgot password?</span><span style="display:none">Account login</span></a>
            <h4>  New to Baazar Online? <a href="Seller_Registration.jsp">Register</a></h4>
        </div>
    </div>
                    <div>
                      
                    </div>
</body>

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:59 GMT -->
</html>
