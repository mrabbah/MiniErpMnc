
<%@ page import="com.rabbahsoft.securite.Profil" %>
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
      Gestion des profils
    </div>
    <div class="w-box-content cnt_a">
      <g:render template="nav"/>
      <table class="table table-striped table-bordered dTableR" id="dt_a">
        <thead>
          <tr>
            <th>${message(code: 'profil.code.label', default: 'Code')}</th>
            <th>${message(code: 'profil.description.label', default: 'Description')}</th>
          </tr>
        </thead>
        <tbody role="alert" aria-live="polite" aria-relevant="all">
        <g:each in="${profilInstanceList}" status="i" var="profilInstance">
          <tr>
           <g:if test="${session.droits.VISUALISER_PROFIL != null}">
          <td><g:link action="edit" id="${profilInstance.id}">${fieldValue(bean: profilInstance, field: "code")}</g:link></td>
           </g:if>
          <g:else>
            <td>${fieldValue(bean: profilInstance, field: "code")}</td>
          </g:else>
           <td>${fieldValue(bean: profilInstance, field: "description")}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
