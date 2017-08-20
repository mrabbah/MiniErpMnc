<a href="#DeleteModal" role="button" class="btn btn-small toolbar-icon" data-toggle="modal" title="${message(code: 'default.button.delete.label', default: 'Delete')}">
	<i class="icon-remove"></i> Supprimer
</a>
<g:render template="/_common/modals/deleteDialog" model="[item: item]"/>
