
<%@ page import="com.rabbahsoft.securite.Profil" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profil.label', default: 'Profil')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profil" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profil">
			
				<g:if test="${profilInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="profil.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${profilInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profilInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="profil.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${profilInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profilInstance?.droits}">
				<li class="fieldcontain">
					<span id="droits-label" class="property-label"><g:message code="profil.droits.label" default="Droits" /></span>
					
						<g:each in="${profilInstance.droits}" var="d">
						<span class="property-value" aria-labelledby="droits-label"><g:link controller="droit" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${profilInstance?.utilisateurs}">
				<li class="fieldcontain">
					<span id="utilisateurs-label" class="property-label"><g:message code="profil.utilisateurs.label" default="Utilisateurs" /></span>
					
						<g:each in="${profilInstance.utilisateurs}" var="u">
						<span class="property-value" aria-labelledby="utilisateurs-label"><g:link controller="utilisateur" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:profilInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${profilInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
