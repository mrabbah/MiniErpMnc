<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<%@page defaultCodec="none"%>
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
        <table class="table table-striped table-bordered table-condensed">
          <tbody>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="mailTemplate.code.label" default="Code" /></td>
          <td valign="top" class="value">${fieldValue(bean: mailTemplateInstance, field: "code")}</td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name"><g:message code="mailTemplate.description.label" default="Description" /></td>
          <td valign="top" class="value">${fieldValue(bean: mailTemplateInstance, field: "description")}</td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name"><g:message code="mailTemplate.template.label" default="Template" /></td>
          <td valign="top" class="value">${raw(mailTemplateInstance.template)}</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>
</body>
</html>
