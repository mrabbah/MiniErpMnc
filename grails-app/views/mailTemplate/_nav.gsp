<div class="page-toolbar clearfix">
  <div class="btn-group pull-left">
    <g:if test="${session.droits.LISTE_PROFIL != null}">
    <g:link controller="mailTemplate" action="index" class="${params.action == null || params.action == 'index' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i>Liste</g:link>
    </g:if>
    <g:if test="${session.droits.AJOUTER_PROFIL != null}">
    <g:link action="create" class="${params.action == 'create' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i> Ajouter</g:link>
    </g:if>
    <g:if test="${params.action=="show"}">
    <g:link action="edit" id="${params.id}" class="${params.action == 'edit' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-pencil"></i> Modifier</g:link>
    </g:if>
  </div>
</div>