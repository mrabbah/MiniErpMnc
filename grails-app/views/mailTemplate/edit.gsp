<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
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
        <g:form method="post" class="form-horizontal" role="form" >
          <g:hiddenField name="id" value="${mailTemplateInstance?.id}" />
          <g:hiddenField name="version" value="${mailTemplateInstance?.version}" />
          <g:hiddenField name="_method" value="PUT" />
          <g:render template="form_1"/>
          <h3 class="dashed"></h3>
            <g:actionSubmit class="btn btn-danger" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </g:form>
      </div>
    </div>
  </div>
</body>

</html>
