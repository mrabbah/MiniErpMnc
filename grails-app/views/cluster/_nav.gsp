<div class="page-toolbar clearfix">
  <div class="btn-group pull-left">
    <g:link controller="cluster" action="index" class="${params.action == null || params.action == 'index' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i>Liste</g:link>
    <g:link action="create" class="${params.action == 'create' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i> Ajouter</g:link>
    <g:link action="edit" id="${params.id}" class="${params.action == 'edit' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-pencil"></i> Modifier</g:link>
    <g:render template="/_common/modals/deleteTextLink"/>
  </div>
</div>