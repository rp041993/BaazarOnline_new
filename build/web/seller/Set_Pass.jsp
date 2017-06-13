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
                <p class="heading_main">Set your password</p>
                <form id="login-validate" action="Set_Password" method="post">
                   
                    <label > Enter password</label>
                    <input type="password" id="u_pass" name="u_pass" onchange='check_pass();' required/>
                    <label  id='message' class="error" ></label>
<script>
    function check_pass() {
    var x=document.getElementById('u_pass').value;
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
    var ok=re.test(x);
    if (!ok) {
        console.log("!ok")
        document.getElementById('message').innerHTML = "Please Enter valid Password";
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
                    <label > Re-enter password</label>
                    <input type="password" id="re_password" name="re_password" value="" onchange='check_re_pass();' required />
                    <label  id='re_message' class="error"></label>
                    <script>
    function check_re_pass() {
    var pass=document.getElementById('u_pass').value;
     var re=document.getElementById('re_password').value;
    if (re!=pass) {
        document.getElementById('re_message').innerHTML = "Password not Matched";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('re_message').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }
}
         </script>           <div class="submit_sect">
                        <button type="submit" name="submit"  value="set_pass"  id="submit" class="btn btn-beoro-3">Set-password</button>
                    </div>
                </form>
            </div>
            
        </div>
        
    </div>
</body>

<!-- Mirrored from beoro-admin.tzdthemes.com/login.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Feb 2017 09:36:59 GMT -->
</html>
