<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home'
}">
<div id="jCrumbs" class="breadCrumb nav-pills module">
                            <ul>
                                <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		<li class="${ params.action == "list" ? 'actives' : '' }">
			<g:link action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.list.label" args="[entityName]"/></g:link>
		</li>
		<li class="${ params.action == "create" ? 'actives' : '' }">
			<g:link action="create"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'add-item.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.new.label"  args="[entityName]"/></g:link>
		</li>
		<g:if test="${ params.action == 'show' || params.action == 'edit' }">
			<!-- the item is an object (not a list) -->
			<li class="${ params.action == "edit" ? 'actives' : '' }">
				<g:link action="edit" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.edit.label"  args="[entityName]"/></g:link>
			</li>
			<li class="">
				<g:render template="/_common/modals/deleteTextLink"/>
			</li>
                        <li class="navbar-right">
			<g:link action="show" id="1" title="Suivant"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'next.png')}" alt="${meta(name:'app.name')}" width="12px" height="13px"/></g:link>
		        </li>
                        <li class="navbar-right">
			<g:link action="show" id="1" title="Précédent"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'previous.png')}" alt="${meta(name:'app.name')}" width="12px" height="13px"/></g:link>
		        </li>
		</g:if> 
                            </ul>
                        </div>
  </g:if>