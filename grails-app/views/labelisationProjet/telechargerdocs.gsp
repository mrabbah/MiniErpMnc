<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
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
    <div class="v-heading">Telechargement Docs</div>
    <div class="container-fluid">
      <div class="row">
      <div class=" span12">
        
        <div class="span4 well">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Presentation :" /></label>
        </div>
        <g:if test="${session.presentation!=null}">
        <div class="span4 well ">
          <label><a href="${session.presentation}" id="presentation">Telecharger la presentation</a></label>
        </div>
          </g:if>
      </div>
        </div>
    <div class="row">
      <div class=" span12">
        
        <div class="span4 well">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Rapport CT :" /></label>
        </div>
        <g:if test="${session.rapportCT!=null}">
        <div class="span4 well ">
          <label><a href="${session.rapportCT}" id="rapportCT">Telecharger le rapportCT</a></label>
        </div>
          </g:if>
      </div>
        </div>
    <div class="row">
      <div class=" span12">
        
        <div class="span4 well">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Presentation Detaille:" /></label>
        </div>
        <g:if test="${session.presentationdetaillee!=null}">
        <div class="span4 well ">
          <label><a href="${session.presentationdetaillee}" id="presentationdetaillee">Telecharger la presentation detailler</a></label>
        </div>
          </g:if>
      </div>
        </div>
    <div class="row">
      <div class=" span12">
        
        <div class="span4 well">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Fiche Technique :" /></label>
        </div>
        <g:if test="${session.ficheTechnique!=null}">
        <div class="span4 well ">
          <label><a href="${session.ficheTechnique}" id="ficheTechnique">Telecharger la fiche technique</a></label>
        </div>
            </g:if>
      </div>
        </div>
    <div class="row">
      <div class=" span12">
        
        <div class="span4 well">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Grille d'analyse :" /></label>
        </div>
        <g:if test="${session.grilleAnalyse!=null}">
        <div class="span4 well ">
          <label><a href="${session.grilleAnalyse}" id="grilleAnalyse">Telecharger la grille analyse</a></label>
        </div>
           </g:if>
      </div>
        </div>
      <div class="row">
      <div class=" span12">
        
        <div class="span4 well">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="lettre de confidentialite :" /></label>
        </div>
        <g:if test="${session.lettreConfidentialite!=null}">
        <div class="span4 well ">
          <label><a href="${session.lettreConfidentialite}" id="lettreConfidentialite">Telecharger la lettre de confidentialite</a></label>
        </div>
           </g:if>
      </div>
        </div>
</div>
    <div style="color:red;" accesskey="">
<g:link action="synthese" id="${labelisationProjetInstance.id}"><input type="button" value="Revenir vers synthese de projet" style="color:red;"/></g:link>
</div> 
</body>

</html>