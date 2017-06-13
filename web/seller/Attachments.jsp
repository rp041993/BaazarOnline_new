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
                    <div class="span12">
                        <div class="w-box w-box-blue"
                        <div class="w-box">
                             <form action='Attachments' method="POST" enctype="multipart/form-data">
                            <div class="w-box-header">
                                <h4>Attachments</h4>
                            </div>
                            <div class="w-box-content cnt_a user_profile">
                                <div class="row-fluid">
                                    <div class="span6" style="margin-left: 0px;">
                                        <div class="formSep">
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
                                        <label>PAN Image</label>
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <% if(str2.get("PAN_Proof").equals(""))
                                                 {%>
                                                <img src="../img/No_image.gif" alt="" id="image">
                                            <%}else
                                            {%>
                                    <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("PAN_Proof")%>" alt="" id="image"> <%}%>
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='PAN_file' name='PAN_file' accept="image/jpeg" ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                        </div>
                                        
                                        <div class="formSep">
                                        <label>VAT/TIN Proof:</label>
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <% if(str2.get("VAT_Proof").equals(""))
                                                 {%><img src="../img/No_image.gif" alt="" id="image"><%}else{%>
                                    <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("VAT_Proof")%>" alt="" id="image"> <%}%>
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='TIN_file' name='TIN_file' accept="image/jpeg" ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                        </div>
                                        
                                        <div class="formSep">
                                        <label>CST Proof:</label>
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <% if(str2.get("CST_Proof").equals(""))
                                                 {%><img src="../img/No_image.gif" alt="" id="image"><%}else{%>
                                                 <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("CST_Proof")%>" alt="" id="image"> <%}%>
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='CST_file' name='CST_file' accept="image/jpeg" ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                    </div>
                                            <div class="span6">
                                    <div class="formSep">
                                        <label>Gumasta Proof:</label>
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <% if(str2.get("GUMASTA_Proof").equals(""))
                                                 {%><img src="../img/No_image.gif" alt="" id="image"><%}else{%>
                                                  <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("GUMASTA_Proof")%>" alt="" id="image"> <%}%>
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='Gumasta_file' name='Gumasta_file' accept="image/jpeg"></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                       <div class="formSep">
                                        <label>KYC Proof:</label>
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <% if(str2.get("KYC_Proof").equals(""))
                                                 {%><img src="../img/No_image.gif" alt="" id="image"><%}else{%>
                                                  <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("KYC_Proof")%>" alt="" id="image"> <%}%> 
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='Gumasta_file' name='KYC_file' accept="image/jpeg" ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>

                                    <div class="formSep">
                                        <label>ID Proof:</label>
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 60px; height: 60px;">
                                                <% if(str2.get("ID_Proof").equals(""))
                                                 {%><img src="../img/No_image.gif" alt="" id="image"><%}else{%>
                                                  <img src="../img/Seller/Seller_Details/<%=Seller_Validate.id+"/"+str2.get("ID_Proof")%>" alt="" id="image"> <%}%> 
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 60px; height: 60px;"></div>
                                            <span class="btn btn-small btn-file">
                                                <span class="fileupload-new">Select image</span>
                                                <span class="fileupload-exists">Change</span>
                                                <input type="file" id='Gumasta_file' name='ID_file' accept="image/jpeg" ></span>
                                            <a href="#" class="btn btn-small btn-link fileupload-exists" data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                        
                                        
                                        
                                        
                                        <%}}
                                        mg2.close();%>
                                        <button type="submit" name="Save_Attachments"  value="Save_Attachments"  id="Save_Attachments" class="btn btn-beoro-3" style="float: right" >Save </button>
                                        </div>
                                    </div>
                                   <!--///////////////////////////////////////////////////////////////////////////////////////////////////////-->
                            
                            </div></form>
                        </div></div>
                        </div>
                    </div>
                        </div>
           </body>
   </html>
<%@include file="Footer.jsp" %>
   