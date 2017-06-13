
<html lang="en-US">

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:58 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="icon" type="image/ico" href="favicon.ico">
    <title>Baazaronline.com - CMS Login</title>
    <link rel="stylesheet" href="../css/login.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet'>
    <!-- jQuery framework -->
        <script src="../js/jquery.min.js"></script>
    <!-- validation -->
        <script src="../js/lib/jquery-validation/jquery.validate.js"></script>
    <script type="text/javascript">
        (function(a){a.fn.vAlign=function(){return this.each(function(){var b=a(this).height(),c=a(this).outerHeight(),b=(b+(c-b))/2;a(this).css("margin-top","-"+b+"px");a(this).css("top","45%");a(this).css("position","absolute")})}})(jQuery);(function(a){a.fn.hAlign=function(){return this.each(function(){var b=a(this).width(),c=a(this).outerWidth(),b=(b+(c-b))/2;a(this).css("margin-left","-"+b+"px");a(this).css("left","50%");a(this).css("position","absolute")})}})(jQuery);
        $(document).ready(function() {
            if($('#login-wrapper').length) {
                $("#login-wrapper").vAlign().hAlign()
            };
        });
    </script>
</head>
<body>
    <div id="login-wrapper" class="clearfix">
        <div class="main-col">
            <div style="padding-bottom: 10px; border-bottom: 1px solid rgb(204, 204, 204); 
                 width: 100%; text-align: center; position: relative; height: 70px; 
                 float: left; margin-bottom: 10px;">
                <img src="../img/baazar.png" alt="" class="logo_img">
            </div>
            <div class="panel">
                <p class="heading_main">Create Account</p>
                <form id="login-validate" action="Send_OTP" method="post">
                    <label for="login_name">Your Name</label>
                    <input type="text" id="login_name" name="login_name" value="" required/>
                    <label for="u_email">Email</label>
                    <input type="text" id="u_email" name="u_email" onchange='check_email();' required/>
                    <label  id='message' class="error" ></label>
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
       sendInfo(x); 
    
    var request;  
    function sendInfo(x)  
    {  
       
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
    document.getElementById('message').innerHTML = val;
    if(val=="Email already exists")
    {
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }  
    else
    {
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }
    }  
}}}
</script>
<%
            session.setAttribute("mobile",null);
            session.setAttribute("Name",null);
            session.setAttribute("Email",null);
            session.setAttribute("Random",null);
%>
                    <label for="u_number">Mobile Number</label>
                    <input type="text" id="u_number" name="u_number" onchange='check_mobile();' required/>
                    <label  id='message_num' class="error" ></label>
<script>
    function check_mobile() {
    var num=document.getElementById('u_number').value;
    var limit = /^\d{10}$/;
    var pattern = /^[789]\d{9}$/;
    var Len_ok=limit.test(num);
    var pattern_ok=pattern.test(num);
    if (!Len_ok || !pattern_ok) 
    {
        document.getElementById('message_num').innerHTML = "Enter a valid number";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        sendInfo(num); 
    
    var request;  
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
    document.getElementById('message_num').innerHTML = val;
    if(val=="Number already exists"){
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }  
    else
    {
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }    
    }
}}}
</script>                    
                    <div class="submit_sect">
                        <button type="submit" name="submit"  value="registration"  id="submit" class="btn btn-beoro-3" >Next</button>
                    </div>
            </form>             
            </div>
            </div>
                    <div class="login_links">
                      <h4>  Already have an account? <a href="Seller_Login.jsp">Login</a></h4>
                    </div>
            
    </div>
 
</body>

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:59 GMT -->
</html>
