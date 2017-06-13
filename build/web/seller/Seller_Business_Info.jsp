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
           <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="w-box w-box-blue">
                        <div class="w-box">
                            <form action='Update_Business_info' method="POST" enctype="multipart/form-data">
                            <div class="w-box-header">
                                <h4>Business Information</h4>
                                <button type="submit" name="submit" style="float: right; margin-right: 50px;" value="save_value"  id="submit" class="btn " >Save</button>
                            </div>
                            <div class="w-box-content cnt_b">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <div class="tabbable tabbable-bordered">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab" href="#tb1_a">Business Details</a></li>
                                                <li><a data-toggle="tab" href="#tb1_b">PAN & Other Details</a></li>
                                                
                                            </ul>
                                            <div class="tab-content">
                                                <div id="tb1_a" class="tab-pane active">
                                                    <div class="w-box-content">
                                           
                                    <%
                                          Mongo mg = new Mongo(Seller_Login.Database,27017);
                                          DB db = mg.getDB("baazaronline");
                                          DBCollection collection = db.getCollection(Seller_Login.seller);
                                          DBObject doc = new BasicDBObject();
                                          DBCursor cursor = collection.find();
                                          while(cursor.hasNext())
                                            {
                                                DBObject str= cursor.next();
                                                if(str.get("Email").equals(User_ID) || str.get("Number").equals(User_ID))
                                             {
                                                %>
                                            <div class="formSep">
                                                <label for="u_name">Business Type:</label>
                                                <label for="Sole" class="radio inline"><input type="radio" name="v_btype" id="Sole" value="Sole" required  <% if(str.get("Business_Type").equals("Sole")){%>checked<%}%>/> Sole Proprietorship</label>
                                                <label for="Pvt_Ltd" class="radio inline"><input type="radio" name="v_btype" id="Pvt_Ltd" value="Pvt_Ltd" required <% if(str.get("Business_Type").equals("Pvt_Ltd")){%>checked<%}%>/> Private Limited</label>
                                                <label for="Public_Ltd" class="radio inline"><input type="radio" name="v_btype" id="Public_Ltd" value="Public_Ltd" required <% if(str.get("Business_Type").equals("Public_Ltd")){%>checked<%}%>/> Public Limited</label>
                                            </div>
                                            <div class="formSep">
                                                <label>Registered Business Name:</label>
                                                <%if(str.get("Business_Name")==null){%>
                                                <input  type="text" id="Reg_B_Name" name="Reg_B_Name" class="span8" value="" /><%}
                                                else{%>
                                                <input  type="text" id="Reg_B_Name" name="Reg_B_Name" class="span8" value="<%=str.get("Business_Name")%>" /><%}%>
                                                
                                            </div>
                                            <div class="formSep">
                                                <label>Display Name:</label>
                                                <input  type="text" id="Dis_Name" name="Dis_Name" class="span8" value="<%=str.get("Full_Name")%>" disabled />
                                            </div>
                                             <div class="formSep">
                                                <label>Registered Business Address:</label>
                                                <%if(str.get("Business_Address")==null){%>
                                                <input  type="text" id="Reg_B__Add" name="Reg_B__Add" class="span8" value="" /><%}
                                                else{%>
                                                <input  type="text" id="Reg_B__Add" name="Reg_B__Add" class="span8" value="<%=str.get("Business_Address")%>" /><%}%>
                                             </div>
                                             <div class="formSep">
                                                <label>Pincode:</label>
                                                <%if(str.get("Pincode")==null){%>
                                                <input  type="text" id="Pincode" name="Pincode" class="span8" value="" /><%}
                                                 else{%>
                                                 <input  type="text" id="Pincode" name="Pincode" class="span8" value="<%=str.get("Pincode")%>" onchange='check_pin();' /><%}%>
                                                <label  id='message_num' class="error" ></label>
                                                <label>State & City</label>
                                                <table><tr><td><input  type="text" id="state" name="state" class="span8" value="" readonly /></td>
                                                        <td><input  type="text" id="city" name="city" class="span8" value="" readonly /></td></tr></table>
                                                </div>
     
<script>
    function check_pin()
    {
    var num=document.getElementById('Pincode').value;
    var pattern = /^[1-9][0-9]{5}$/;
    var pattern_ok=pattern.test(num);
    if (!pattern_ok) 
    {
        document.getElementById('message_num').innerHTML = "Enter 6 digit pincode";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }
    else
    {
        sendInfo(num); 
    
    var request;  
    function sendInfo(num)  
    {  
       
    var url="PincodeAjax?val="+num;  
    
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
    console.log(val);
   
    if(val.Message=="Please Enter a valid Pincode"){
        document.getElementById("city").value="";
        document.getElementById("state").value="";
        document.getElementById('message_num').innerHTML = "Please Enter a valid Pincode";
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor="not-allowed";
    }  
    else
    {
        document.getElementById("city").value=val.City;
        document.getElementById("state").value=val.State;
        document.getElementById('message_num').innerHTML = "";
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor="";
    }    
    }
}}}
</script>     
                                                    </div>
                                                </div>
                                                <div id="tb1_b" class="tab-pane">
                                                    <h4>Important Instructions</h4>
                                                    <p> PAN should be in the name of business (except in the case of sole propreitorship</p>
                                                    <p> PAN image should be attested (signed and stamped) by authorized signatory of business</p>
                                                    <br>
                                                    <div class="formSep">
                                         <label>PAN Card Holder Name:</label>
                                         <%if(str.get("PAN_Card_Name")==null){%>
                                        <input  type="text" id="PAN_Name" name="PAN_Name" class="span8" value="" /><%}
                                                 else{%><input  type="text" id="PAN_Name" name="PAN_Name" class="span8" value="<%=str.get("PAN_Card_Name")%>" /><%}%>
                                                    </div>
                                    <div class="formSep">
                                        <label>PAN Card Number:</label>
                                        <%if(str.get("PAN_Num")==null){%>
                                        <input  type="text" id="PAN_Num" name="PAN_Num" class="span8" value="" onchange="checkPAN(this);"/><%}
                                        else{%><input  type="text" id="PAN_Num" name="PAN_Num" class="span8" value="<%=str.get("PAN_Num")%>" onchange="checkPAN(this);"/><%}%>
                                        <label  id='PAN_msg' class="error" ></label>
                                     </div>
                                   
                                    
                                             
<script> 
    var request; 
    function checkPAN(object)  
    {  
        var x=document.getElementById('PAN_Num').value;
        var y=object.id;
        console.log(x);
        console.log(y);
    var url="Check_Numbers?id="+y+"&value="+x;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getPAN;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getPAN(){  
    if(request.readyState==4){  
    var val=request.responseText; 
    
    if(val=="exists")
    {
        document.getElementById('PAN_msg').innerHTML = "PAN Number Already Exists";
    }  
    else
    {
        document.getElementById('PAN_msg').innerHTML = "";
    }
    }  
}
</script>
                                               
                                           <div class="formSep">     
                                        <label>VAT/TIN Number:</label>
                                         <%if(str.get("TIN_Num")==null){%>
                                        <input  type="text" id="VAT_Num" name="VAT_Num" class="span8" value="" onchange="checkVAT(this);" /><%}
                                        else{%><input  type="text" id="VAT_Num" name="VAT_Num" class="span8" value="<%=str.get("TIN_Num")%>" onchange="checkVAT(this);" /><%}%>
                                        <label  id='VAT_msg' class="error" ></label>
                                           </div>
<script> 
    var request; 
    function checkVAT(object)  
    {  
        var x=document.getElementById('VAT_Num').value;
        var y=object.id;
        console.log(x);
        console.log(y);
    var url="Check_Numbers?id="+y+"&value="+x;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getVAT;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getVAT(){  
    if(request.readyState==4){  
        var val=request.responseText; 
       if(val=="exists")
    {
        document.getElementById('VAT_msg').innerHTML = "VAT/TIN Number Already Exists";
    }  
    else
    {
        document.getElementById('VAT_msg').innerHTML = "";
    }  
    }  
}
</script>
                                   
                                    
                                    <div class="formSep">
                                        <label>CST Number:</label>
                                        <%if(str.get("CST_Num")==null){%>
                                        <input  type="text" id="CST_Num" name="CST_Num" class="span8" value="" onchange="checkCST(this);" /><%}
                                        else{%><input  type="text" id="CST_Num" name="CST_Num" class="span8" value="<%=str.get("CST_Num")%>" onchange="checkCST(this);" /><%}%>
                                        <label  id='CST_msg' class="error" ></label>
                                    </div>
<script> 
    var request; 
    function checkCST(object)  
    {  
        var x=document.getElementById('CST_Num').value;
        var y=object.id;
        console.log(x);
        console.log(y);
    var url="Check_Numbers?id="+y+"&value="+x;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getCST;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getCST(){  
    if(request.readyState==4){  
      var val=request.responseText; 
       if(val=="exists")
    {
        document.getElementById('CST_msg').innerHTML = "CST Number Already Exists";
    }  
    else
    {
        document.getElementById('CST_msg').innerHTML = "";
    }  
      
    }  
}
</script>
                                    
                                    <div class="formSep">
                                        <label>Gumasta:</label>
                                        <%if(str.get("GUMASTA_Num")==null){%>
                                        <input  type="text" id="Gumasta" name="Gumasta" class="span8" value="" onchange="checkGumasta(this);" /><%}
                                        else{%><input  type="text" id="Gumasta" name="Gumasta" class="span8" value="<%=str.get("GUMASTA_Num")%>" onchange="checkGumasta(this);" /><%}%>
                                        <label  id='Gumasta_msg' class="error" ></label>
                                    </div>
<script> 
    var request; 
    function checkGumasta(object)  
    {  
        var x=document.getElementById('Gumasta').value;
        var y=object.id;
        console.log(x);
        console.log(y);
    var url="Check_Numbers?id="+y+"&value="+x;  
    
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
      
    try{  
    request.onreadystatechange=getGumasta;  
    request.open("GET",url,true);  
    request.send(); 
    
    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getGumasta(){  
    if(request.readyState==4){  
    var val=request.responseText; 
       if(val=="exists")
    {
        document.getElementById('Gumasta_msg').innerHTML = "Gumasta Number Already Exists";
    }  
    else
    {
        document.getElementById('Gumasta_msg').innerHTML = "";
    }  
    }  
}
</script>
                                    <%}} mg.close();%>
                                    
                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>
                                    </form>
                    </div>
                    </div></div>
            </div>
            </div>
           </body>
   </html>
<%@include file="Footer.jsp" %>
   