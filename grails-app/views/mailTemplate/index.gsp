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
      <table class="table table-striped table-bordered dTableR" id="dt_a">
        <thead>
          <tr>
            <th>${message(code: 'mailTemplate.code.label', default: 'Template Mail')}</th>
            <th>${message(code: 'mailTemplate.description.label', default: 'Objet')}</th>
          </tr>
        </thead>
        <tbody>
        <g:each in="${mailTemplateInstanceList}" status="i" var="mailTemplateInstance">
          <tr>
          <td><g:link action="edit" id="${mailTemplateInstance.id}">${fieldValue(bean: mailTemplateInstance, field: "code")}</g:link></td>
          <td>${fieldValue(bean: mailTemplateInstance, field: "description")}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
