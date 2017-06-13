<!DOCTYPE HTML>
<html lang="en-US">

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:58 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <link rel="icon" type="image/ico" href="favicon.ico">
    <title>Baazaronline.com - CMS Login</title>
    <link rel="stylesheet" href="../css/login.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet'>
    <!-- jQuery framework -->
        <script src="../js/jquery.min.js"></script>
    <!-- validation -->
        <script src="../js/lib/jquery-validation/jquery.validate.js"></script>
    <script type="text/javascript">
        (function(a){a.fn.vAlign=function(){return this.each(function(){var b=a(this).height(),c=a(this).outerHeight(),b=(b+(c-b))/2;a(this).css("margin-top","-"+b+"px");a(this).css("top","50%");a(this).css("position","absolute")})}})(jQuery);(function(a){a.fn.hAlign=function(){return this.each(function(){var b=a(this).width(),c=a(this).outerWidth(),b=(b+(c-b))/2;a(this).css("margin-left","-"+b+"px");a(this).css("left","50%");a(this).css("position","absolute")})}})(jQuery);
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
                 <form id="login-validate" action="Match_OTP" method="post">
                     <%  String Mobile_num=(String)session.getAttribute("mobile");%>
                <p class="heading_main">We have sent a login verification code to your mobile number(<%= Mobile_num%>)</p>
                    <label for="otp">Enter your verification code:</label>
                    <input type="text" id="otp" name="otp" value="" onchange='otp_length();' required/>
                    <label  id='otp_message' class="error" ></label>
<script>
function otp_length() {
    var otp=document.getElementById('otp').value;
    var limit = /^\d{6}$/;
    var limit_ok=limit.test(otp);
    if (!limit_ok) 
    {
        console.log(otp);
        document.getElementById('otp_message').innerHTML = "Enter 6 digit OTP";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {   console.log("ok");
        document.getElementById('otp_message').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }
}
</script>  
                    <div class="submit_sect">
                        <p class="heading_main">  Don't get code? <a href="Insert_OTP.jsp" onclick="alert('Your otp is genrated');">click</a></</p>
                        <button type="submit" name="submit"  value="registration"  id="submit" class="btn btn-beoro-3" >Next</button>
                    </div>

                </form>
            </div>
        </div>
       
    </div>
</body>

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:59 GMT -->
</html>
