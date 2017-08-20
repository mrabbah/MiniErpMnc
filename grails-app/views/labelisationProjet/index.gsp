
<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'labelisationProjet.label', default: 'LabelisationProjet')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
		<g:render template="submenubar"/>														
	</g:if>
<section id="index-labelisationProjet" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="interlocuteur" title="${message(code: 'labelisationProjet.interlocuteur.label', default: 'Interlocuteur')}" />
			
				<g:sortableColumn property="fonction" title="${message(code: 'labelisationProjet.fonction.label', default: 'Fonction')}" />
			
				<g:sortableColumn property="nomProjet" title="${message(code: 'labelisationProjet.nomProjet.label', default: 'Nom Projet')}" />
			
				<g:sortableColumn property="nomCompletProjet" title="${message(code: 'labelisationProjet.nomCompletProjet.label', default: 'Nom Complet Projet')}" />
			
				<g:sortableColumn property="website" title="${message(code: 'labelisationProjet.website.label', default: 'Website')}" />
			
				<g:sortableColumn property="aap" title="${message(code: 'labelisationProjet.aap.label', default: 'Aap')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${labelisationProjetInstanceList}" status="i" var="labelisationProjetInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "interlocuteur")}</g:link></td>
			
				<td>${fieldValue(bean: labelisationProjetInstance, field: "fonction")}</td>
			
				<td>${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</td>
			
				<td>${fieldValue(bean: labelisationProjetInstance, field: "nomCompletProjet")}</td>
			
				<td>${fieldValue(bean: labelisationProjetInstance, field: "website")}</td>
			
				<td>${fieldValue(bean: labelisationProjetInstance, field: "aap")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${labelisationProjetInstanceCount}" />
	</div>
</section>

</body>

</html>
