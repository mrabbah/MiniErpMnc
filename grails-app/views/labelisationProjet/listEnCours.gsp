<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" />  
    <meta name="layout" content="main"/>
    <script src="${request.contextPath}/js/gebo_datatables_BP.js"></script>
  </head>
  <body>

    <div class="not_sortable">
      <div class="w-box">
        <div class="w-box-header">
          Labélisation des projets
        </div>
        <div class="w-box-content cnt_a">
           <table id="example1">
          <thead>
            <tr>
                <th>nomProjet</th>
                <th>etatProjet</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>nomProjet</th>
                <th>etatProjet</th>
            </tr>
        </tfoot>
          
       </table>   
         
<!--<thead>
<tr><th>nomProjet</th>
<th>etatProjet</th>
</tr></thead>
<tbody>
</tbody>-->

        </div>
      </div>
    </div>
  </body>

</html>