<%@page import="seller.Seller_Login"%>
<%@page import="seller.Seller_Validate"%>
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
        <link href="../js/lib/select2/select2.css" rel="stylesheet" type="text/css"/>
        <script src="../js/lib/select2/select2.min.js" type="text/javascript"></script>
        <!-- iconSweet2 icon pack (16x16) -->
            <link rel="stylesheet" href="../img/icsw2_16/icsw2_16.css">
    <!-- common stylesheets-->
        <!-- bootstrap framework css -->
            <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
    </head>
    
    <body class="bg_a">    
        <!-- top bar -->
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                       
                        <div id="fade-menu" class="pull-left">
                            <ul class="clearfix" id="mobile-nav"> 
                                <li><a href="javascript:void(0)">Dashboard</a></li>                           
                                <li><a href="javascript:void(0)">Profile</a>
                                    <ul>
                                        <li>
                                            <a href="Javascript:void(0);">User</a>
                                           
                                            <ul>
                                                <li><a href="Seller_Profile.jsp">Personal Information</a></li>
                                                <li><a href="Seller_Business_Info.jsp">Business Information</a></li>
                                                <li><a href="Bank_Details.jsp">Bank Information</a></li>
                                                <li><a href="Attachments.jsp">Attachments</a></li>
                                            </ul>
                                        </li>
                                        
                                         
                                    </ul>
                                </li>
                                <li>
                                            <a href="javascript:void(0)">Products</a>
                                            <ul>
                                                <li><a href="Select_category_for_show_product.jsp">View/Add products</a></li>
                                                <li><a href="Select_category_for_My_product_list.jsp">My product list</a></li>
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
                            <div class="main-logo" style="font-size:20px;">
                                <a href="Seller_Home.jsp">
                                   <img src="../img/baazar.png" width="200"></a></div>
                        </div>
                        <div class="span5">
                        
                        </div>
                        <%
                                            String User_ID=(String)session.getAttribute("User_ID");
                                          Mongo mg3 = new Mongo(Seller_Login.Database,27017);
                                          DB db3 = mg3.getDB("baazaronline");
                                          DBCollection collection3 = db3.getCollection(Seller_Login.seller);
                                          DBObject doc3 = new BasicDBObject();
                                          DBCursor cursor3 = collection3.find();
                                          while(cursor3.hasNext())
                                            {
                                                DBObject str3= cursor3.next();
                                                if(str3.get("Email").equals(User_ID) || str3.get("Number").equals(User_ID))
                                             {
                                                %>
                        <div class="span3">
                            <div class="user-box">
                                <div class="user-box-inner">
                                    <% if(str3.get("Seller_dp").equals(""))
                                    {%>
                                        <img src="../img/No_image.gif" alt="" class="user-avatar img-avatar">
                                    <%}
                                    else{%>
                                    
                                    <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str3.get("Seller_dp")%>" alt="" class="user-avatar img-avatar"> <%}%>
                                    <div class="user-info">
                                        Welcome, <strong><%=str3.get("Full_Name")%></strong>
                                        <ul class="unstyled">
                                            <li><a href="Seller_Profile.jsp">Settings</a></li>
                                            <li>&middot;</li>
                                            <li><a href="logout.jsp">Logout</a></li>
                                        </ul>
                                        <%}} mg3.close();%>
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
           

