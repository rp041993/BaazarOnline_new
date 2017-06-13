<%@page import="org.bson.types.ObjectId"%>
<%@page import="com.mongodb.DB"%>
 <link rel="icon" type="image/ico" href="favicon.ico">
        
    <!-- common stylesheets-->
        <!-- bootstrap framework css -->
            <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" href="../bootstrap/css/bootstrap-responsive.min.css">
            
<!--            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js">
         splashy icon pack -->
            <link rel="stylesheet" href="../img/splashy/splashy.css">
        <!-- power tooltips -->
            <link rel="stylesheet" href="../js/lib/powertip/jquery.powertip.css">
        <!-- google web fonts -->
            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Abel">
            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300">
                <link href="../js/lib/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css"/>
    <!-- aditional stylesheets -->
        

        <!-- main stylesheet -->
            <link rel="stylesheet" href="../css/beoro.css">
      
            <!-- Common JS -->
        <!-- jQuery framework -->
            <script src="../js/jquery.min.js"></script>
            <script src="../js/jquery-migrate.js"></script>
            <script src="../js/lib/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <!-- bootstrap Framework plugins -->
            <script src="../bootstrap/js/bootstrap.min.js"></script>
        <!-- top menu -->
            <script src="../js/jquery.fademenu.js"></script>
        <!-- top mobile menu -->
            <script src="../js/selectnav.min.js"></script>
        <!-- actual width/height of hidden DOM elements -->
            <script src="../js/jquery.actual.min.js"></script>
        <!-- jquery easing animations -->
            <script src="../js/jquery.easing.1.3.min.js"></script>
        <!-- power tooltips -->
            <script src="../js/lib/powertip/jquery.powertip-1.1.0.min.js"></script>
        <!-- date library -->
        <script src="../js/form/bootstrap-fileupload.min.js" type="text/javascript"></script>
            <script src="../js/moment.min.js"></script>
        <!-- common functions -->
            <script src="../js/beoro_common.js"></script>
           <link href="../js/lib/smart-wizard/styles/smart_wizard.css" rel="stylesheet" type="text/css"/>
       <body >
           <!-- breadcrumbs -->
            

           <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="w-box w-box-blue">
                             <form action='Upload_product_image' method="POST" enctype="multipart/form-data">
                            <div class="w-box-header">
                                <h4>Upload Product Images</h4>
                            </div>
                            <div class="w-box-content cnt_a user_profile">
                                <div class="row-fluid">
                                    <div class="span8">
                                        <div class="formSep">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <img src="../img/No_image.gif" alt="" id="image">
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='PAN_file' name='PAN_file' required ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                        </div>
                                        <!--////////////////////////////////////////////////-->
                                        <div class="formSep">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <img src="../img/No_image.gif" alt="" id="image">
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='TIN_file' name='TIN_file' ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                        </div>
                                        <!--/////////////////////////////////////////////////////////////////-->
                                        <div class="formSep">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                               <img src="../img/No_image.gif" alt="" id="image">
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='CST_file' name='CST_file' ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                    <!--/////////////////////////////////////////////////////////////-->    
                                    <div class="formSep">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <img src="../img/No_image.gif" alt="" id="image">
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='Gumasta_file' name='Gumasta_file' ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                            <!--/////////////////////////////////////////-->
                                     
                                        <button type="submit" name="Save_Attachments"  value="Save_Attachments"  id="Save_Attachments" class="btn btn-beoro-3"  >Save Attachments</button>
                                        </div>
                                    </div>
                                   <!--///////////////////////////////////////////////////////////////////////////////////////////////////////-->
                            
                            </div></form>
                            </div>
                        </div>
                    </div>
                        </div>
           <script>
    window.history.forward();
   
</script>
           </body>
           
   </html>
<%@include file="Footer.jsp" %>
   