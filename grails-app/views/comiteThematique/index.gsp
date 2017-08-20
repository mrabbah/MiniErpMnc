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
        <table class="table table-striped table-bordered dTableR" id="dt_a">
          <thead>
            <tr>
              <th>${message(code: 'comiteThematique.code.label', default: 'Code')}</th>
              <th>${message(code: 'comiteThematique.description.label', default: 'Description')}</th>
            </tr>
          </thead>
          <tbody>
          <g:each in="${comiteThematiqueInstanceList}" status="i" var="comiteThematiqueInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td><g:link action="show" id="${comiteThematiqueInstance.id}">${fieldValue(bean: comiteThematiqueInstance, field: "code")}</g:link></td>
            <td>${fieldValue(bean: comiteThematiqueInstance, field: "description")}</td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
