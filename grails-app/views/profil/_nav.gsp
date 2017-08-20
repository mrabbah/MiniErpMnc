<div class="page-toolbar clearfix">
  <div class="btn-group pull-left">
    <g:if test="${session.droits.LISTE_PROFIL != null}">
    <g:link controller="profil" action="index" class="${params.action == null || params.action == 'index' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i>Liste</g:link>
    </g:if>
    <g:if test="${session.droits.AJOUTER_PROFIL != null}">
    <g:link action="create" class="${params.action == 'create' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i> Ajouter</g:link>
    </g:if>
    <g:if test="${session.droits.MODIFIER_PROFIL != null}">
    <g:if test="${params.action=="edit"}">
    <g:link action="edit" id="${params.id}" class="${params.action == 'edit' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-pencil"></i> Modifier</g:link>
    </g:if>
    </g:if>
<!--    <g:if test="${session.droits.SUPPRIMER_PROFIL != null}">
    <g:if test="${params.action=="show" || params.action=="edit"}">
      <g:render template="/_common/modals/deleteTextLink"/>
    </g:if>
    </g:if>-->
  </div>
</div>