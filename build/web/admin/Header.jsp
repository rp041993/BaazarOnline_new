<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>

<html lang="en-US">
<head>
        <meta charset="UTF-8">
        <title>Baazaronline Admin Panel</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        
    <!-- common stylesheets-->
        <!-- bootstrap framework css -->
            <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" href="../bootstrap/css/bootstrap-responsive.min.css">
         <!-- iconSweet2 icon pack (16x16) -->
            <link rel="stylesheet" href="../img/icsw2_16/icsw2_16.css">
         <!-- flag icons -->
            <link rel="stylesheet" href="../img/flags/flags.css">
            <!-- splashy icon pack -->
        <link rel="stylesheet" href="../img/splashy/splashy.css">
        <!-- power tooltips -->
            <link rel="stylesheet" href="../js/lib/powertip/jquery.powertip.css">
        <!-- google web fonts -->
            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Abel">
            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300">
            <link href="../js/lib/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css"/>
    <!-- aditional stylesheets -->
    
        <!-- colorbox -->
            <link rel="stylesheet" href="../js/lib/colorbox/colorbox.css">
 


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
        <!-- actual width/height of hidden DOM elements -->
            <script src="../js/jquery.actual.min.js"></script>
        <!-- jquery easing animations -->
            <script src="../js/jquery.easing.1.3.min.js"></script>
         
        <!-- power tooltips -->
            <script src="../js/lib/powertip/jquery.powertip-1.1.0.min.js"></script>
        <!-- date library -->
            <script src="../js/moment.min.js"></script>
        <!-- common functions -->
            <script src="../js/beoro_common.js"></script>
        
            <script src="../js/pages/beoro_wizard.js"></script>
            <!-- smart wizard -->
            <link rel="stylesheet" href="../js/lib/smart-wizard/styles/smart_wizard.css">


        <!-- main stylesheet -->
            <link rel="stylesheet" href="../css/beoro.css">


    </head>
    <body class="bg_a">    
        <!-- top bar -->
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                       
                        <div id="fade-menu" class="pull-left">
                            <ul class="clearfix" id="mobile-nav"> 
                                <li><a href="javascript:void(0)">Dashboard</a></li>                           
                                <li><a href="javascript:void(0)">Utility</a>
                                    <ul>
                                        <li>
                                            <a href="Javascript:void(0);">User</a>
                                           
                                            <ul>
                                                <li><a href="Role?Page=Registration.jsp">User Registration</a></li>
                                                <li><a href="Role?Page=UserView.jsp">User view/edit</a></li>
                                                
                                            </ul>
                                        </li>
                                        
                                         
                                    </ul>
                                </li>
                                <li><a href="Role?Page=Category_form.jsp">Category</a></li> 
                                <li>
                                            <a href="javascript:void(0)">Attribute</a>
                                            <ul>
                                                <li><a href="Role?Page=showAttribute.jsp">Add Attribute</a></li>
                                                <li><a href="Role?Page=CreateAttributeSet.jsp">Add Attribute Set</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">Pincode</a>
                                            <ul>
                                                <li><a href="Role?Page=AddPin.jsp">Add Addpin</a></li>
                                                <li><a href="Role?Page=ReadPin.jsp">Show pincode</a></li>
                                            </ul>
                                        </li>
                                        <li> 
                                            <a href="javascript:void(0)">Product</a>
                                             <ul>
                                                <li><a href="ChosseCatagory.jsp?type=product">Add Product</a></li>
                                                <li><a href="Role?Page=Show_Products.jsp">Show Product </a></li>
                                                <li><a href="Role?Page=unapprove_product.jsp"> Unapproved Product</a></li>
                                                <li><a href="Role?Page=UserViewAdmin.jsp">user wise  products</a></li>
                                                <li><a href="Role?Page=Seller_wise_products.jsp">Seller wise  products</a></li>
                                                
                                            </ul>
                                      </li>
                                      <li> 
                                            <a href="javascript:void(0)">commission</a>
                                          <ul>
                                                <li><a href="ChosseCatagory.jsp?type=comision">Add commission</a></li>
                                                <li><a href="Role?Page=showComission.jsp">Show commission </a></li>
                                            </ul>
                                      </li>
                                      
                                      <li> 
                                            <a href="javascript:void(0)">Product Availablity</a>
                                            <ul>
                                                <li><a href="Role?Page=Product_Availablity_At_Pincode.jsp">Product_Availablity</a></li>
                                                
                                            </ul>
                                      </li>
                                         <li> 
                                            <a href="javascript:void(0)">Bulk Upload</a>
                                            <ul>
                                                <li><a href="ChosseCatagory.jsp?type=export">Export Formate</a></li>
                                                <li><a href="ChosseCatagory.jsp?type=Imports">Import </a></li>
                                            </ul>
                                      </li>
                               </ul>
                            
                                
                        </div>
                    </div>
                </div>
            </div>

        <!-- header -->
            <header>
                <div class="container">
                    <div class="row">
                        <div class="span4">
                            <div class="main-logo" style="font-size:20px;"><a href="index.jsp">BAAZARONLINE.COM</a></div>
                        </div>
                        <div class="span5">
                        
                        </div>
                        <div class="span3">
                            <div class="user-box">
                                <div class="user-box-inner">
                                    
                                    <div class="user-info">
                                        <%
                                          HttpSession session1 = request.getSession(true);
                                          String U_Name = (String) session1.getAttribute("User_ID");%>
                                        Welcome, <strong><%=U_Name%></strong> <a href="login.jsp">Logout</a>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
                                        
        <div class="container">
                <div class="row-fluid">
                &nbsp;
                </div>
         </div>
           

