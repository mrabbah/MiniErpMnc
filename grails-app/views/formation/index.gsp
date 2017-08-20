
<%@ page import="com.rabbahsoft.mnc.Formation" %>
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
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <div class="not_sortable">
    <div class="w-box">
      <div class="w-box-header">
        Labélisation des formations
      </div>
      <div class="w-box-content cnt_a">
        <table class="table table-striped table-bordered dTableR" id="dt_a">
          <thead>
            <tr>
              <th>${message(code: 'formation.acronymeFormation.label', default: 'Acronyme Formation')}</th>
              <th>${message(code: 'formation.nomformation.label', default: 'Nomformation')} </th>
              <th>${message(code: 'formation.dateCreationFormation.label', default: 'Date Creation Formation')} </th>
              <th>${message(code: 'formation.etablissementFormation.label', default: 'Etablissement Formation')}</th>
              <th>${message(code: 'formation.statutAdhesion.label', default: 'Statut Adhesion')} </th>
              <th>${message(code: 'formation.accredidationEtat.label', default: 'Accredidation Etat')} </th>
            </tr>
          </thead>
          <tbody role="alert" aria-live="polite" aria-relevant="all">
          <g:each in="${formationInstanceList}" status="i" var="formationInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td><g:link action="create" id="${formationInstance.id}">${fieldValue(bean: formationInstance, field: "acronymeFormation")}</g:link></td>
            <td>${fieldValue(bean: formationInstance, field: "nomformation")}</td>
            <td><g:formatDate date="${formationInstance.dateCreationFormation}" /></td>
            <td>${fieldValue(bean: formationInstance, field: "etablissementFormation")}</td>
            <td>${fieldValue(bean: formationInstance, field: "statutAdhesion")}</td>
            <td>${fieldValue(bean: formationInstance, field: "accredidationEtat")}</td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>
