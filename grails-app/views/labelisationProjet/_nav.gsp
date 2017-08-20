<div class="page-toolbar clearfix">
  <div class="btn-group pull-left">
<!--    <g:link controller="comiteThematique" action="index" class="${params.action == null || params.action == 'index' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-file"></i>Recherche Projet</g:link>-->
  
    <g:if test="${params.controller=="labelisationProjet" && (params.action=="list_projet" || params.action=="list_projet_1")}">
    <g:link action="recherche_projet"  class="${params.action == 'recherche_projet' ? "btn btn-danger btn-small toolbar-icon" : "btn btn-small toolbar-icon"}"><i class="icon-search"></i> Recherche Projet</g:link>
    </g:if>
<!--    <g:render template="/_common/modals/deleteTextLink"/>-->
  </div>
</div>