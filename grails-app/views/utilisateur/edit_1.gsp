<%@ page import="com.rabbahsoft.securite.Utilisateur" %>
<html>
  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" /> 
    <meta name="edituser" content="EDITUSER" />  
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
        Gestion des utilisateurs 
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <g:form class="form-horizontal" url="[resource:utilisateurInstance, action:'update']" method="PUT" enctype="multipart/form-data" class="form-horizontal form_utilisateur" novalidate="novalidate">
          <g:hiddenField name="version" value="${utilisateurInstance?.version}" /> 
          <fieldset>
            <g:render template="form_1"/>                                                                                
          </fieldset>
        </g:form>
      </div>
    </div>
  </div>    
</body>
</html>