
<%@ page import="com.rabbahsoft.mnc.Cluster" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cluster.label', default: 'Cluster')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-cluster" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'cluster.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'cluster.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${clusterInstanceList}" status="i" var="clusterInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clusterInstance.id}">${fieldValue(bean: clusterInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: clusterInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${clusterInstanceCount}" />
	</div>
</section>
</body>

</html>
