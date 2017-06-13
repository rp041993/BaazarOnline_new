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
                        <div class="w-box">
                            <form action='Update_Bank_info' method="POST" onsubmit="formmodified=0" >
                                <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                <h4>Bank Information</h4>
                                <button type="submit" name="submit"  value="save_value" style="float: right; margin-right: 50px;" id="submit" class="btn " >Save</button>
                            </div>
                            <div class="w-box-content cnt_b">
                                <div class="row-fluid">
                                    <div class="span8">
                                        <div class="tabbable tabbable-bordered">
                                            
                                           
                                                    <div class="w-box-content">
                                           
                                    <%
                                            String User_ID1=(String)session.getAttribute("User_ID");
                                            
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
                                                <label for="u_name">Beneficiary Name:</label>
                                                <%if(str.get("Bene_name")==""){%>
                                                <input  type="text" id="Bene_name" name="Bene_name" class="span8" value="" /><%}
                                                else{%>
                                                <input  type="text" id="Bene_name" name="Bene_name" class="span8" value="<%=str.get("Bene_name")%>" /><%}%>
                                                </div>
                                            <div class="formSep">
                                                <label>Bank Name:</label>
                                                <%if(str.get("Bank_Name")==""){%>
                                                <input  type="text" id="Bank_Name" name="Bank_Name" class="span8" value="" /><%}
                                                else{%>
                                                <input  type="text" id="Bank_Name" name="Bank_Name" class="span8" value="<%=str.get("Bank_Name")%>" /><%}%>
                                            </div>
                                            <div class="formSep">
                                                <label>Bank Account Number:</label>
                                                <%if(str.get("Account_Number")==""){%>
                                                <input  type="text" id="Account_Number" name="Account_Number" class="span8" value=""  /><%}
                                                else{%><input  type="text" id="Account_Number" name="Account_Number" class="span8" value="<%=str.get("Account_Number")%>"  /><%}%>
                                            </div>
                                             <div class="formSep">
                                                <label>IFSC Code:</label>
                                                 <%if(str.get("IFSC_Code")==""){%>
                                                <input  type="text" id="IFSC_Code" name="IFSC_Code" class="span8" value="" /><%}
                                                else{%>
                                                <input  type="text" id="IFSC_Code" name="IFSC_Code" class="span8" value="<%=str.get("IFSC_Code")%>" /><%}%>
                                               </div>
                                             <div class="formSep">
                                                <label>Pincode:</label>
                                                <%if(str.get("Bank_pinnumber")==null){%>
                                                <input  type="text" id="Pincode" name="Pincode" class="span8" value="" onchange='check_pin();'/><%}
                                                 else{%>
                                                 <input  type="text" id="Pincode" name="Pincode" class="span8" value="" onchange='check_pin();' /><%}%>
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
                                           <% }} mg.close();%>

                                                 </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    </form>
                    </div>
                </div>
            </div>
            </div>
           </body>
   </html>
<%@include file="Footer.jsp" %>
   