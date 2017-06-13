<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>

<%@include file="Header.jsp" %>
 <form id="1" action="UpdateUser" method="post">
                        <div class="span12">
                            
                        <div class="w-box">
                            <div class="w-box-header">
                                <h4>User settings</h4>                       
                            </div>
                           
                                 
                                <%
            String UserName=request.getParameter("UserName");
            String Name="";
            String UserName1="";
            String Email="";
            String Gender="";
            String Password="";
            String Status="";
              String ip = getServletContext().getInitParameter("ip");
            Mongo mg = new Mongo( ip ,27017);
            DB db = mg.getDB("baazaronline");
            DBCollection collection = db.getCollection("Admin_Details");
            BasicDBObject doc = new BasicDBObject();
            DBCursor cursor = collection.find();
            while(cursor.hasNext())
             {
                 DBObject str=cursor.next();
                 if(str.get("UserName").equals(UserName))
                 {  
                          UserName1=(String)str.get("UserName");
                          Name=(String)str.get("First_Name");
                          Email=(String)str.get("Email");
                          Gender=(String)str.get("Gender");
                          Password=(String)str.get("Password");
                          Status=(String)str.get("Status");
                 }
             }
            mg.close();
                         %>
                                 <div class="w-box-content cnt_b">
                                <div class="row-fluid">
                                    <div class="span12">
                                        
                                         <div style="float:right; text-align: right;">
                                   
                                            <div style=" float:left; margin-right:10px;"><button  class="btn btn-success" name="Button" id="SaveChanges" value="SaveChanges" type="submit">Save Changes</button></div>
                                            <div style="float:left; margin-right:10px;"><button  class="btn btn-danger" type="submit" id="Delete" name="Button" value="Delete">Delete User</button></div>
                                            <div style=" float:left;"><a href="UserView.jsp" class="btn">Back</a></div>

                                        </div> 

                                        
                                    </div>
                                    <div class="span12" style="margin-left: 0px;">
                                        
                                        <div class="tabbable tabs-left tabbable-bordered">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab" href="#tb3_a">Profile</a></li>
                                                <li><a data-toggle="tab" href="#tb3_b">Role</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="tb3_a" class="tab-pane active">
                                                    <div class="w-box-content">
                                                     <div class="span6">   
                                                        <div class="formSep">
                                                            <label for="u_username"  >User-<%=UserName1%></label><br>
                                                            <input type="hidden" id="u_username" name="u_username" value="<%=UserName1%>" required class="span8" />
                                                        </div>
                                                        <div class="formSep">
                                                            <label for="u_username">New Username</label>
                                                            <input type="text" id="u_username" name="u_newusername" value="<%=UserName1%>" class="span8" />
                                                        </div>
                                                        <div class="formSep">
                                                            <label for="u_name">Name</label>
                                                            <input type="text" id="u_name" name="u_name" value="<%=Name%>" required class="span8" />
                                                        </div>
                                                        <div class="formSep">
                                                            <label for="u_email">Email</label>
                                                            <input type="text" id="u_email" name="u_email" value="<%=Email%>" required class="span8" onchange='check_email()' />
                                                            <label  id='message' class="error" ></label>
                                                        </div>
<script>
    function check_email() {
        var x=document.getElementById('u_email').value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        document.getElementById('message').innerHTML = "Enter a valid email";
        document.getElementById('SaveChanges').disabled = true;
        document.getElementById('Delete').disabled = true;
        document.getElementById('SaveChanges').style.cursor="not-allowed";
        document.getElementById('Delete').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('message').innerHTML = "";
        document.getElementById('SaveChanges').disabled = false;
        document.getElementById('Delete').disabled = false;
        document.getElementById('SaveChanges').style.cursor="";       
        document.getElementById('Delete').style.cursor="";
    }
}
</script>

                                                     </div>
                                                     <div class="span6">
                                                        <div class="formSep">
                                                            <% if("Male".equals(Gender)){%>
                                                            <label for="u_male" class="radio inline"><input type="radio" name="u_gender" required value="Male" id="u_male" checked /> Male</label>
                                                            <label for="u_female" class="radio inline"><input type="radio" name="u_gender" required value="Female" id="u_female" /> Female</label><%}
                                                            else{%>
                                                            <label for="u_male" class="radio inline"><input type="radio" name="u_gender" required value="Male" id="u_male" /> Male</label>
                                                            <label for="u_female" class="radio inline"><input type="radio" name="u_gender" required value="Female" id="u_female" checked /> Female</label><%}%>
                                                        </div>
                                                        <div class="formSep">
                                                            <label for="a_password">Current Admin Password</label>
                                                           <input type="password" id="a_password" name="a_password" value="Admin" required class="span8" />
                                                            <span class="help-block">Enter Password</span>
                                                        </div>
                                                        <div class="formSep">
                                                            <label for="u_password">Password</label>
                                                            <span class="help-block">New Password</span>
                                                            <input type="password" id="u_newpassword" name="u_newpassword"  value="<%=Password%>" class="span8" onchange='check_pass()' />
                                                            <label  id='pass_message' class="error" ></label>
                                                        </div>
<script>
    function check_pass() {
    var x=document.getElementById('u_newpassword').value;
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
    var ok=re.test(x);
    if (!ok) {
        console.log("!ok")
        document.getElementById('pass_message').innerHTML = "Password should contaion atleast one,capital,small and number";
        document.getElementById('SaveChanges').disabled = true;
        document.getElementById('Delete').disabled = true;
        document.getElementById('SaveChanges').style.cursor="not-allowed";
        document.getElementById('Delete').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('pass_message').innerHTML = "";
        document.getElementById('SaveChanges').disabled = false;
        document.getElementById('Delete').disabled = false;
        document.getElementById('SaveChanges').style.cursor="";       
        document.getElementById('Delete').style.cursor="";
    }
}
</script>

                                                        <div class="formSep">
                                                            <label for="u_account">Account </label>
                                                            <select name="u_account">
                                                                <option value="Active" <%= ("Active".equals(Status))?("selected='selected'"):""%> >Active</option>
                                                             <option value="InActive" <%= ("InActive".equals(Status))?("selected='selected'"):""%>>InActive</option>
                                                            </select>
                                                        </div>
                                                            
                                                     </div>      
                                                            
                                                    </div> 
                                                </div>
                                       <%
                                        String a="";
                MongoClient client = new MongoClient("localhost", 27017);
                MongoDatabase database = client.getDatabase("Register1");
                MongoCollection<Document> collection1 = database.getCollection("reg");
                ArrayList<String> s = new ArrayList<String>();
                List<Document> Documents = (List<Document>) collection1.find().into(new ArrayList<Document>());
                    for (Document field : Documents) {
                        if(field.get("UserName").equals(UserName))
                        {
                        List<Document> roles = (List<Document>) field.get("role");
                        //////////////////////////////////////
                        for (Document role : roles) {
                            a=role.getString("Roles");
                            s.add(a);
                        }}
                    }    mg.close();    %>
                               <div id="tb3_b" class="tab-pane" >                                
                              <div class="w-box-content cnt_a">
                                  <div class="w-box-content">
                                <input type="hidden" name="role" value="None" <%=(s.contains("None") ? "checked":"checked")%>>
                                <input type="checkbox"  name="role" value="Registration.jsp" <%=(s.contains("Registration.jsp") ? "checked":"")%>> User Registration<BR>
                                    <input type="checkbox"  name="role" value="UserView.jsp" <%=(s.contains("UserView.jsp") ? "checked":"")%>> User View/Edit<BR>
                                    <input type="checkbox"  name="role" value="Category_form.jsp" <%=(s.contains("Category_form.jsp") ? "checked":"")%>> Category<BR>
                                    <input type="checkbox"  name="role" value="showAttribute.jsp" <%=(s.contains("showAttribute.jsp") ? "checked":"")%>> Add Attribute<BR>
                                    <input type="checkbox"  name="role" value="CreateAttributeSet.jsp" <%=(s.contains("CreateAttributeSet.jsp") ? "checked":"")%>> Add Attribute set<BR>
                                    <input type="checkbox"  name="role" value="AddPin.jsp" <%=(s.contains("AddPin.jsp") ? "checked":"")%>> Add Pin<BR>
                                    <input type="checkbox"  name="role" value="ReadPin.jsp" <%=(s.contains("ReadPin.jsp") ? "checked":"")%>> Show PinCode<BR>
                                    </div>
                            </div>                       <!-- code prettifier -->
            <script src="../js/lib/google-code-prettify/prettify.js"></script>
            <script type="text/javascript">
                if(typeof prettyPrint == 'function') {
                    prettyPrint();
                }
            </script>
        <!-- tree plugin -->
            <script src="../js/lib/dynatree/jquery.dynatree.min.js"></script>
            <script type="text/javascript">
                $(function(){
                    $("#tree").dynatree({checkbox: true});
                });
            </script>

        </div>
                                                    
    </div>
   </div>
  </div>
</div>
                                 </div>
                        </div>
                        </div>                          </form>

<%@include file="Footer.jsp" %>

