<%@ page import="com.rabbahsoft.mnc.Formation" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" />  
    <meta name="layout" content="main"/>
  </head>

  <body>
  
  <g:set var="curentstep" value="${etape}" />
  <g:if test="${flash.message}">
    <div class="alert alert-success">
      <a class="close" data-dismiss="alert">×</a>
      <strong>${flash.message}</strong>
    </div>
  </g:if>
  <div id="messageerreur"></div>
  <div class="row-fluid">
    <div class="span12">
      <h3 class="heading">Formation</h3>
    </div>
    <div class="tabbable tabbable-bordered">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab_br1" data-toggle="tab">Fiche technique</a></li>
        <g:if test="${formationInstance.id!=null}">
        <li><a href="#tab_br2" data-toggle="tab">Fichiers joints</a></li>
         <g:if test="${session.droits.AFFECTERCOMITETHEMATIQUE_FORMATION != null}">
        <li><a href="#tab_br3" data-toggle="tab">Comité thématique</a></li>
         </g:if>
        </g:if>
        <g:if test="${formationInstance.id!=null}">
        <li><a href="#tab_br4" data-toggle="tab">Grille d'analyse</a></li>
        </g:if>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab_br1">
          <g:render template="form1"/>
        </div>
        <g:if test="${formationInstance.id!=null}">
        <div class="tab-pane" id="tab_br2">
          <g:render template="form2"/>
        </div>
         <g:if test="${session.droits.AFFECTERCOMITETHEMATIQUE_FORMATION != null}">
        <div class="tab-pane" id="tab_br3">
          <g:render template="form3"/>
        </div>
         </g:if>
        </g:if>
        <g:if test="${formationInstance.id!=null}">
        <div class="tab-pane" id="tab_br4">
           <g:render template="form4"/>
        </div>
        </g:if>
      </div>
    </div>
  </body>

</html>
