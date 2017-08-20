<%@ page import="com.rabbahsoft.securite.ComiteThematique" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" />  
    <meta name="layout" content="main"/>
  </head>

  <body>
  <g:hasErrors bean="${societeInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${societeInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:if test="${flash.message}">
    <div class="alert alert-success" id="notification">
      <a class="close" data-dismiss="alert">×</a>
${flash.message}
    </div>
  </g:if>
  <div class="not_sortable">
    <div class="w-box">
      <div class="w-box-header">
        Gestion des comités thématiques
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <g:form method="post" class="form-horizontal" role="form" >
          <g:hiddenField name="id" value="${comiteThematiqueInstance?.id}" />
          <g:hiddenField name="version" value="${comiteThematiqueInstance?.version}" />
          <g:hiddenField name="_method" value="PUT" />
          <fieldset>
            <g:render template="form"/>
          </fieldset>
          <div class="control-group">
            <div class="controls">
              <g:actionSubmit class="btn btn-danger" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
<!--              <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>-->
            </div>
          </div>
        </g:form>
      </div>
    </div>
  </div>
</body>

</html>
