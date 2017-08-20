
<%@ page import="com.rabbahsoft.mnc.Document" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-document" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'document.code.label', default: 'Code')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${documentInstanceList}" status="i" var="documentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "code")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${documentInstanceCount}" />
	</div>
</section>
</body>

</html>
