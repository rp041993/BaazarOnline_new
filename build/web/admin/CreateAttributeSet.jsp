<%-- 
    Document   : CreateAttributeSet
    Created on : 4 Mar, 2017, 2:22:23 PM
    Author     : baazarteam4
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include  file="Header.jsp" %>

        
        <!-- breadcrumbs -->
            <div class="container">
                <ul id="breadcrumbs">
                    
                     
                </ul>
            </div>
           
        <!-- aditional stylesheets -->
        <!-- jQuery UI theme -->
            <link rel="stylesheet" href="../js/lib/jquery-ui/css/Aristo/Aristo.css">
        <!-- 2 col multiselect -->
            <link rel="stylesheet" href="../js/lib/multi-select/css/multi-select.css">
        <!-- enchanced select box, tag handler -->
            <link rel="stylesheet" href="../js/lib/select2/select2.css">
        <!-- datepicker -->
            <link rel="stylesheet" href="../js/lib/bootstrap-datepicker/css/datepicker.css">
        <!-- timepicker -->
            <link rel="stylesheet" href="../js/lib/bootstrap-timepicker/css/timepicker.css">
        <!-- colorpicker -->
            <link rel="stylesheet" href="../js/lib/bootstrap-colorpicker/css/colorpicker.css">
        <!-- switch buttons -->
            <link rel="stylesheet" href="../js/lib/ibutton/css/jquery.ibutton.css">
        <!-- UI Spinners -->
            <link rel="stylesheet" href="../js/lib/jqamp-ui-spinner/css/jqamp-ui-spinner.css">
        <!-- multiupload -->
            <link rel="stylesheet" href="../js/lib/plupload/js/jquery.plupload.queue/css/plupload-beoro.css">


                          <%
                      try {
     
                            String ip = getServletContext().getInitParameter("ip");
                          MongoClient mongoClient = new MongoClient( ip , 27017 );

                      DB db = mongoClient.getDB("baazaronline");
                      DBCollection collection = db.getCollection("Attribute");
                        // out.print("<h1>"+collection.getReadPreference()+"</h1>");
                      DBCursor cursor = collection.find();
                      DBCursor cursor2 = collection.find();
                     // cursor.getQuery();
                    
                    DBObject query = new BasicDBObject("Attribute", "Attribute");
                    cursor = collection.find(query);
                     DBObject query2 = new BasicDBObject("attset", "Attribute");
                    cursor2 = collection.find(query);
                   int i = 0;
                   %>
            
        <!-- main content -->
        
                    <form action="AddAtributeSet" method="post">
                        <div class="w- -" id="n_multiselect">
                            <div class="w-box-header">
                                <h4>Add Attribute Set</h4>
                            </div>
                            <div class="w-box-content cnt_a">
                                <div class="row-fluid">
                                    <div class="span5">
                                   <div class="formSep">
                                        <label class="req f-error" >Enter Attribute Set Name</label>
                                        <input value="" class="span10" type="text" name="name" required id="Attribut">
                                    </div> 
                                    <div class="formSep">
                                        <label> Select Attribute </label>
                                        <select id="custom-headers" multiple="multiple" name="multiple" required >
                                    </div> 
                 <%   
                while (cursor.hasNext()) { 
                    //DBObject str= cursor.next();
                    //System.out.println(str);
                    String s= cursor.next().toString();
                    System.out.println("before"+s);
                   
                     Object obj=JSONValue.parse(s);  
                   JSONObject jsonObject = (JSONObject) obj;
                   System.out.println("this io json object"+jsonObject);
                    
                   System.out.println("this is debuging  "+s);
//                   out.println("<h1>heeeer"+s+"</h1>");
                
                    String id =  (String) jsonObject.get("attcode");%> 
                    <%out.println(id);%>
                   
                   <option value="<%out.print(id);%>"><%out.println(id);%></option>
              <%  }%>

              <%} catch (Exception e) {
               }
   
                     
                    %>
</select>
              <div class="btn-toolbar">
              <div><input type="submit" value="save"></div>
             </div>
 </div>
</div>
 </form>

                       <div class="span4">
                        <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Attribute Set List</h4>
                            </div>
                            <div class="w-box-content">
                                <div id="list_basic" class="jQ-list">
                                    <ul>
                                        <li>
                                          
                                            <ul>
                                                <%
                                                        String ip = getServletContext().getInitParameter("ip");
                                                 MongoClient client = new MongoClient(ip , 27017);
                                                 MongoDatabase database = client.getDatabase("baazaronline");
                                                 MongoCollection<Document> collection = database .getCollection("Attribute");
                                                 BasicDBObject doc = new BasicDBObject("attset", "AttributeSet");
            
            List<Document> attributeSet = (List<Document>) collection.find(doc).into(new ArrayList<Document>());
            System.out.println("emolyee"+attributeSet);
                 
              for (Document attribure : attributeSet) {
                     Object ss =  attribure.get("Name");
                      String name =ss.toString();
                     List<Document> value = (List<Document>) attribure.get("Attributes");
                     System.out.println("name  "+name +"    valuese"+value);
                               %>
  
                                              
                                                    <span class="list-username"> <a href="EditeAttributeSet.jsp?Attribute_code=<%out.print(name);%>"> <%out.print(name);%> </a></span>
                                                    <span class="list-info"><span><%out.print(value);%></span>
                                        
                                        <%}%>
                                        
                                        </li>
                              
                                        <li>
                                            
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

<div>
 <div class="footer_space"></div>
</div>
    

    <!-- Forms -->  
        <!-- jQuery UI -->
            <script src="../js/lib/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
        <!-- touch event support for jQuery UI -->
            <script src="../js/lib/jquery-ui/jquery.ui.touch-punch.min.js"></script>
        <!-- progressbar animations -->
            <script src="../js/form/jquery.progressbar.anim.min.js"></script>
        <!-- 2col multiselect -->
            <script src="../js/lib/multi-select/js/jquery.multi-select.min.js"></script>
            <script src="../js/lib/multi-select/js/jquery.quicksearch.min.js"></script>
        <!-- combobox -->
            <script src="../js/form/fuelux.combobox.min.js"></script>
        <!-- file upload widget -->
            <script src="../js/form/bootstrap-fileupload.min.js"></script>
        <!-- masked inputs -->
            <script src="../js/lib/jquery-inputmask/jquery.inputmask.min.js"></script>
            <script src="../js/lib/jquery-inputmask/jquery.inputmask.extensions.js"></script>
            <script src="../js/lib/jquery-inputmask/jquery.inputmask.date.extensions.js"></script>
        <!-- enchanced select box, tag handler -->
            <script src="../js/lib/select2/select2.min.js"></script>
        <!-- password strength metter -->
            <script src="../js/lib/pwdMeter/jquery.pwdMeter.min.js"></script>
        <!-- datepicker -->
            <script src="../js/lib/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <!-- timepicker -->
            <script src="../js/lib/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
        <!-- colorpicker -->
            <script src="../js/lib/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <!-- metadata -->
            <script src="../js/lib/ibutton/js/jquery.metadata.min.js"></script>
        <!-- switch buttons -->
            <script src="../js/lib/ibutton/js/jquery.ibutton.beoro.js"></script>
        <!-- autosize textarea -->
            <script src="../js/form/jquery.autosize.min.js"></script>
        <!-- textarea counter -->
            <script src="../js/lib/jquery-textarea-counter/jquery.textareaCounter.plugin.min.js"></script>
        <!-- UI Spinners -->
            <script src="../js/lib/jqamp-ui-spinner/globalize/globalize.min.js"></script>
            <script src="../js/lib/jqamp-ui-spinner/globalize/cultures/globalize.culture.fr-FR.js"></script>
            <script src="../js/lib/jqamp-ui-spinner/globalize/cultures/globalize.culture.ja-JP.js"></script>
            <script src="../js/lib/jqamp-ui-spinner/globalize/cultures/globalize.culture.zh-CN.js"></script>
            <script src="../js/lib/jqamp-ui-spinner/compiled/jqamp-ui-spinner.min.js"></script>
            <script src="../js/lib/jqamp-ui-spinner/compiled/jquery-mousewheel-3.0.6.min.js"></script>
        <!-- plupload and the jQuery queue widget -->
            <script type="text/javascript" src="../js/lib/plupload/js/plupload.full.js"></script>
            <script type="text/javascript" src="../js/lib/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>
        <!-- WYSIWG Editor -->
            <script src="../js/lib/ckeditor/ckeditor.js"></script>

            <script src="../js/pages/beoro_form_elements.js"></script>

