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
            <g:render template="form"/>                                                                                
          </fieldset>
          <div class="control-group">
            <div class="controls">
                <button class="btn btn-gebo" type="submit">Enregistrer</button>
                <a href="${request.contextPath}/labelisationProjet/list_projet?encours=true" class="btn">Annuler</a>
            </div>
          </div>
        </g:form>
      </div>
    </div>
  </div>    
</body>
</html>