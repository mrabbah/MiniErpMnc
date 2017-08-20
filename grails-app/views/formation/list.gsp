
<%@ page import="com.rabbahsoft.mnc.Formation" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'formation.label', default: 'Formation')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-formation" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<g:sortableColumn property="acronymeFormation" title="${message(code: 'formation.acronymeFormation.label', default: 'Acronyme Formation')}" />
			
				<g:sortableColumn property="nomformation" title="${message(code: 'formation.nomformation.label', default: 'Nomformation')}" />
			
				<g:sortableColumn property="dateCreationFormation" title="${message(code: 'formation.dateCreationFormation.label', default: 'Date Creation Formation')}" />
			
				<g:sortableColumn property="etablissementFormation" title="${message(code: 'formation.etablissementFormation.label', default: 'Etablissement Formation')}" />
			
				<g:sortableColumn property="statutAdhesion" title="${message(code: 'formation.statutAdhesion.label', default: 'Statut Adhesion')}" />
			
				<g:sortableColumn property="accredidationEtat" title="${message(code: 'formation.accredidationEtat.label', default: 'Accredidation Etat')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${formationInstanceList}" status="i" var="formationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${formationInstance.id}">${fieldValue(bean: formationInstance, field: "acronymeFormation")}</g:link></td>
			
				<td>${fieldValue(bean: formationInstance, field: "nomformation")}</td>
			
				<td><g:formatDate date="${formationInstance.dateCreationFormation}" /></td>
			
				<td>${fieldValue(bean: formationInstance, field: "etablissementFormation")}</td>
			
				<td>${fieldValue(bean: formationInstance, field: "statutAdhesion")}</td>
			
				<td>${fieldValue(bean: formationInstance, field: "accredidationEtat")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${formationInstanceCount}" />
	</div>
</section>
</body>

</html>
