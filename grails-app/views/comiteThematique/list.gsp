
<%@ page import="com.rabbahsoft.securite.ComiteThematique" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'comiteThematique.label', default: 'ComiteThematique')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-comiteThematique" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'comiteThematique.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'comiteThematique.description.label', default: 'Description')}" />
			
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
	<div>
		<bs:paginate total="${comiteThematiqueInstanceCount}" />
	</div>
</section>
</body>

</html>
