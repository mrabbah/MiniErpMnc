<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" />  
    <meta name="layout" content="main"/>
    <script>
  function Submit() {

      

          alert("Rabbit "+i+" out of the hat!");

      }

    </script>
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
        <g:form action="save" class="form-horizontal"  class="form-horizontal form_template" novalidate="novalidate">
          <g:render template="form"/>
          <h3 class="dashed"></h3>
          <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-danger" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
          </div>
        </g:form>
      </div>
    </div>
  </div>
</body>

</html>

