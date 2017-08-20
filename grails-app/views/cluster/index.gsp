
<%@ page import="com.rabbahsoft.mnc.Cluster" %>
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
        Gestion des clusters
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <table class="table table-striped table-bordered dTableR" id="dt_a">
          <thead>
            <tr>
              <th>Code</th>
              <th>Déscription</th>
            </tr>
          </thead>
          <tbody>
          <g:each in="${clusterInstanceList}" status="i" var="clusterInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td><g:link action="edit" id="${clusterInstance.id}">${fieldValue(bean: clusterInstance, field: "code")}</g:link></td>
            <td>${fieldValue(bean: clusterInstance, field: "description")}</td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
