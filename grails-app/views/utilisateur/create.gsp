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
<!--        <g:hasErrors bean="${utilisateurInstance}">
        <ul class="alert alert-success" id="notification">
          <g:eachError bean="${utilisateurInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
          </g:eachError>-->
<!--        </ul>
      </g:hasErrors>-->
  <div class="not_sortable">
    <div class="w-box">
      <div class="w-box-header">
        Gestion des utilisateurs
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <g:form class="form-horizontal" url="[resource:utilisateurInstance, action:'save']" method="POST" enctype="multipart/form-data" class="form-horizontal form_utilisateur" novalidate="novalidate">
          <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
          <fieldset>
            <g:render template="form"/>                                                                                
          </fieldset>
          <div class="control-group">
            <div class="controls">
              <g:if test="${session.droits.AJOUTER_UTILISATEUR != null}">
              <button class="btn btn-gebo" type="submit">Enregistrer</button>
              <a href="${request.contextPath}/utilisateur/" class="btn">Annuler</a>
              </g:if>
            </div>
          </div>
        </g:form>
      </div>
    </div>
  </div>        
</body>
</html>