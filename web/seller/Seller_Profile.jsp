<%@page import="seller.Seller_Login"%>
<%@page import="seller.Seller_Validate"%>
<%@include file="Header.jsp" %>     
   <html>
       <body>
           <!-- breadcrumbs -->
            <div class="container">
                <ul id="breadcrumbs">
                    <li><a href="Seller_Profile.jsp">Personal Information</a></li>
                    <li><a href="Seller_Business_Info.jsp">Business Information</a></li>
                    <li><a href="Bank_Details.jsp">Bank Information</a></li>
                    <li><a href="Attachments.jsp">Attachments</a></li>
                </ul>
            </div>
<%
HttpSession session2 = request.getSession(true);
String User_ID2 = (String) session2.getAttribute("User_ID");
//String U_Image2=(String)session2.getAttribute("U_Image");
%>
           <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="w-box">
                            <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Personal Information</h4>
                                <button type="submit" name="edit" style="float: right; margin-right: 20px;" value="edit"  id="edit" class="btn" onclick='sendInfo();' >Edit</button>
                            </div>
<script> 
    var request; 
    function sendInfo()  
    {  
       
    var url="update_Profile_Ajax";  
    
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
        var val=JSON.parse(request.responseText);
    document.getElementById("u_id").value=val._id.$oid;
    document.getElementById("u_id1").value=val._id.$oid;
    document.getElementById("u_name").value=val.Full_Name;
    (document.getElementById("u_male").value==val.Gender)? (document.getElementById("u_male").checked=true):document.getElementById("u_male").checked=false;
    (document.getElementById("u_female").value==val.Gender)? (document.getElementById("u_female").checked=true):document.getElementById("u_female").checked=false;
    (val.DOB==null)?(document.getElementById("dp1").value=""):(document.getElementById("dp1").value=val.DOB);
    document.getElementById("u_email").value=val.Email;
    document.getElementById("u_num").value=val.Number;
    document.getElementById("u_num1").value=val.Number;
    (val.alt_Number==null)?(document.getElementById("u_alt_num").value=""):(document.getElementById("u_alt_num").value=val.alt_Number);
    (val.tel_Number==null)?(document.getElementById("u_tel_no").value=""):(document.getElementById("u_tel_no").value=val.tel_Number);
    (val.Seller_dp=="")?(document.getElementById("image1").src=("../img/No_image.gif")):(document.getElementById("image1").src=("../img/Seller/Seller_Details/"+(document.getElementById("Seller_Validate.id").value)+"/"+val.Seller_dp).toString());
     document.getElementById("savechanges1").disabled=false;
    document.getElementById("saveImages1").disabled=false;
    
   
    }  
}
</script>
                            <div class="w-box-content cnt_a user_profile">
                                <div class="row-fluid">
                                    <div class="span2">
                                        <%
                                          Mongo mg2 = new Mongo(Seller_Login.Database,27017);
                                          DB db2 = mg2.getDB("baazaronline");
                                          DBCollection collection2 = db2.getCollection(Seller_Login.seller);
                                          DBObject doc2 = new BasicDBObject();
                                          DBCursor cursor2 = collection2.find();
                                          while(cursor2.hasNext())
                                            {
                                                DBObject str2= cursor2.next();
                                                if(str2.get("Email").equals(User_ID2) || str2.get("Number").equals(User_ID2))
                                             {%>
                                       <div class="img-holder">
                                    <% if(str2.get("Seller_dp").equals(""))
                                    {%>
                                        <img src="../img/No_image.gif" alt="" class="user-avatar img-avatar" >
                                    <%}
                                    else
                                    {%>
                                    <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("Seller_dp")%>" alt="" class="user-avatar img-avatar"> <%}%>
                                        </div>
                                    </div>
                                   <!--///////////////////////////////////////////////////////////////////////////////////////////////////////-->
                                     <div class="span10">
                                          <input  type="hidden" id="Seller_Validate.id" name="u_num1" class="span8" value="<%=Seller_Validate.id%>" />
                                        <p class="formSep"><small class="muted">Name:</small><%=str2.get("Full_Name")%></p>
                                        <!--/////////////////////////////////////////////////////////////////////////////////////////////////-->
                                    <% if(str2.get("Gender")==null)
                                    {%>
                                        <p class="formSep"><small class="muted">Gender:</small></p>
                                    <%}
                                    else{%>
                                    <p class="formSep"><small class="muted">Gender:</small><%=str2.get("Gender")%> </p><%}%>
                                      <!--///////////////////////////////////////////////////////////////////////////////////////////////////-->  
                                      <% if(str2.get("DOB")==null)
                                    {%>
                                        <p class="formSep"><small class="muted">Birthday:</small></p>
                                    <%}
                                    else{%>
                                    <p class="formSep"><small class="muted">Birthday:</small><%=str2.get("DOB")%></p><%}%> 
                                    <!--////////////////////////////////////////////////////////////////////////////////////////////////////-->
                                        <p class="formSep"><small class="muted">Email:</small><%=str2.get("Email")%></p>
                                        <p class="formSep"><small class="muted">Mobile Number:</small><%=str2.get("Number")%></p>
                                       <!--//////////////////////////////////////////////////////////////////////////////////////////////////-->
                                       <% if(str2.get("alt_Number")==null)
                                    {%>
                                        <p class="formSep"><small class="muted">Alternate Number:</small></p>
                                    <%}
                                    else{%>
                                    <p class="formSep"><small class="muted">Alternate Number:</small><%=str2.get("alt_Number")%></p><%}%>  
                                       <!--//////////////////////////////////////////////////////////////////////////////////-->
                                       <% if(str2.get("tel_Number")==null)
                                    {%>
                                       <p class="formSep"><small class="muted">Tel. Number:</small></p>
                                    <%}
                                    else{%>
                                    <p class="formSep"><small class="muted">Tel. Number:</small><%=str2.get("tel_Number")%></p><%}%>  
                                        
                                        </div>
                                         <%}
                                            }
                                          mg2.close();
                                        %>
                                </div>
                            </div>
                        </div></div>
                    </div>
                    <div class="span6">
                        <div class="w-box">
                            <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Personal settings</h4>
                            </div>
                            <div class="w-box-content">
                                <form action='Update_personal_image' method="POST" enctype="multipart/form-data">
                                    <div class="formSep">
                                        <input  type="hidden" id="u_num1" name="u_num1" class="span8" value="" />
                                        <input type="hidden" id="u_id1" name="u_id1" class="span8" value=""  />
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                              
                                                <img src="../img/No_image.gif" alt="" id="image1">
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='file' name='file' accept="image/jpeg" ></span>&nbsp;&nbsp;<button type="submit" name="submit"  value="SaveImage1"  id="saveImages1" class="btn btn-beoro-3" disabled="" >Update Images</button>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                </form>
                                <form action='Update_personal_info' method="POST">
                                        <input type="hidden" id="u_id" name="u_id" class="span8" value=""  />
                                    
                                    <div class="formSep">
                                        <label for="u_name">Name</label>
                                        <input type="text" id="u_name" name="u_name" class="span8" value="" required />
                                    </div>
                                    <div class="formSep">
                                        <label>Gender</label>
                                        <label for="u_male" class="radio inline"><input type="radio" name="u_gender" id="u_male" value="Male" required /> Male</label>
                                        <label for="u_female" class="radio inline"><input type="radio" name="u_gender" id="u_female" value="Female" required /> Female</label>
                                    </div>
                                    <div class="formSep"> 
                                      <div class="w-box" id="n_datepicker">
                                        <label>Birthday</label>
                                        <div class="row-fluid">
                                            <input class="span8"  data-date-format="dd/mm/yyyy" id="dp1" type="text" name="dp1" value required >
                                            <span class="help-block">dd/mm/yyyy</span>
                                        </div>
                                      </div> 
                                    </div>
                                    <div class="formSep">  
                                        <div class="span10">
                                                <div class="input-prepend">
                                                    <label for="u_email">Email:</label>
                                                    <span class="add-on"><i class="icon-envelope"></i></span><input type="text" id="u_email"  class="span8" readonly />
                                    </div>
                                            </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="span10">
                                                <div class="input-prepend">
                                                    <label for="u_tel_no">Contact Number:</label>
                                                    <span class="add-on">(+91)</span><input  type="text" id="u_num" name="u_num" class="span8" value="" readonly />
                                        </div>
                                            </div>
                                    </div>
                                    <div class="formSep">
                                        <label for="u_alt_num">Alternate Number</label>
                                        <div class="span10">
                                                <div class="input-prepend">
                                                    <span class="add-on">(+91)</span><input  type="text" id="u_alt_num" name="u_alt_num" class="span8" value="" onchange='check_alt_num();' />
                                                </div>  
                                        </div>
                                    </div>
                                     <label  id='message_num' class="error" ></label>
<script>
    function check_alt_num()
    {
    var num=document.getElementById('u_alt_num').value;
    var pattern = /^[7-9][0-9]{10}$/;
    var pattern_ok=pattern.test(num);
    if ( !pattern_ok) 
    {
        document.getElementById('message_num').innerHTML = "Enter a valid number";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        document.getElementById('message_num').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";  
    }
   }
</script>
                                    <div class="formSep">
                                        <label for="u_tel_no">Telephone Number</label>
                                        <input type="text" id="u_tel_no" name="u_tel_no" size="12" class="span8" value="" />
                                    </div>
                                    <div class="formSep sepH_b">
                                        <button type="submit" name="submit"  value="SaveChanges1"  id="savechanges1" class="btn btn-beoro-3" disabled="" >Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div></div>
                    </div>
                </div>
            </div>

           </body>
   </html>
<%@include file="Footer.jsp" %>
   