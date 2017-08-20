
<%@ page import="com.rabbahsoft.securite.Utilisateur" %>
<html>
  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />          
    <meta name="form" content="FORM" />          
    <meta name="extendedform" content="EXTENDEDFORM" />          
    <meta name="layout" content="main"/>
  </head>
  <body>
  <g:if test="${flash.message}">
    <div class="alert alert-success" id="notification">
      <a class="close" data-dismiss="alert">×</a>
${flash.message}
    </div>
  </g:if>
  <div class="not_sortable">
    <div class="w-box">
      <div class="w-box-header">
        Gestion des templates
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <table class="table table-striped table-bordered dTableR">
          <thead>
            <tr>
             
              <th>Code</th>
              <th>Description</th>
             <th>Template</th>
            </tr>
          </thead>
          <tbody>
          <g:each var="template" in="${mailTemplateInstanceList}">
            <tr>
            <td><g:link action="show" id="${template.id}">${template.code}</g:link></td>
            <td>${template.description}</td>
            <td>${template.template}</td>
            </tr>         
          </g:each>                                             
          </tbody>
        </table>
        <bs:paginate total="${utilisateurInstanceCount}" />
      </div>
<!--      <span class="countcandidat">Nombre total : ${utilisateurInstanceCount}</span>-->
    </div>
  </div>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.js"></script>
</body>

</html>