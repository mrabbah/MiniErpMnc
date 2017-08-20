
<%@ page import="com.rabbahsoft.mnc.Document" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-document" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="document.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentInstance, field: "code")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
