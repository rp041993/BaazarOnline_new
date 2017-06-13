
<%@include file="Header.jsp" %>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
          
        
        <style>
            tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
    tfoot {
    display: table-header-group; 
          }
        </style>
   
<div class="container">
                <div class="row-fluid">
                    <div class="span12">
                            <div class="w-box-header">
                                <h4>User profile</h4></div>
     <div class="container">
                <div class="row-fluid">
                &nbsp;
                </div>
         </div> 
                        
    <table id="example" class="display" width="100%" cellspacing="0" style="font-size:12px !important;">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Status</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>User Name</th>
                <th>Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Status</th>
            </tr>
        </tfoot>
         
        <tbody>
     
            <tr onclick="document.location='UserEdit.jsp?UserName=<%=//(String)str.get("UserName")%>'" style="cursor:hand">
                <td ><%=//(String)str.get("UserName")%></td>
                <td ><%=//(String)str.get("First_Name")%></td>
                <td ><%=//(String)str.get("Email")%></td>
                <td ><%=//(String)str.get("Gender")%></td>
                <td ><%=//(String)str.get("Status")%></td>
            </tr>
       </tbody>
    </table>
           
 

        <script>$(document).ready(function() {
    // Setup - add a text input to each footer cell
    $('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input style="height: 28px; font-size:12px;" type="text"  placeholder="Search '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#example').DataTable();
 
    // Apply the search
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
} );</script>
                       
                                  </div>
                            </div>
                        </div>
       <div><br><br><br><br><br><br></div>
</body>
</html>
<%@include file="Footer.jsp" %>