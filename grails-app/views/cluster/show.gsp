
<%@ page import="com.rabbahsoft.mnc.Cluster" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cluster.label', default: 'Cluster')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-cluster" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cluster.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clusterInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cluster.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clusterInstance, field: "description")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
