
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
    <div class="not_sortable">
      <div class="w-box">
        <div class="w-box-header">
          Gestion des comités thématiques
        </div>
        <div class="w-box-content cnt_a">
          <g:render template="nav"/>
          <table class="table table-striped table-bordered table-condensed">
            <tbody>
              <tr class="prop">
                <td valign="top" class="name"><g:message code="comiteThematique.code.label" default="Code" /></td>
            <td valign="top" class="value"><g:message code="comiteThematique.description.label" default="Description" /></td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name">${fieldValue(bean: comiteThematiqueInstance, field: "code")}</td>
              <td valign="top" class="value">${fieldValue(bean: comiteThematiqueInstance, field: "description")}</td>
            </tr>
            </tbody>
          </table>
          </br>
          <h3 class="heading">Liste des utilisateurs du comité</h3>
          <table class="table table-striped table-bordered table-condensed">
            <tbody>
              <tr class="prop">
<!--                <th></th>-->
                <th><g:message code="comiteThematique.code.label" default="Nom" /></th>
            <th><g:message code="comiteThematique.description.label" default="Prénom" /></th>
            <th><g:message code="comiteThematique.description.label" default="Email" /></th>
            </tr>
            <g:set var="president" value="${comiteThematiqueInstance.president}"/>
            <g:each in="${listeutilisateurs}" status="i" var="utilisateur">
              <tr class="prop">
<!--                <td><input type="radio" name="president" value="${utilisateur.id}" id="${utilisateur.id+','+comiteThematiqueInstance.id}" <g:if test="${utilisateur.id==president}">checked</g:if>/></td>-->
              <td valign="top" class="name">${utilisateur.nom}</td>
              <td valign="top" class="value">${utilisateur.prenom}</td>
              <td valign="top" class="value">${utilisateur.email}</td>
              </tr>
            </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>

</body>

</html>
