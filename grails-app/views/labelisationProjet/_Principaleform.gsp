<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>



                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'interlocuteur', 'error')} required">
                        <td width="250"><label for="interlocuteur" class="control-label"><g:message code="labelisationProjet.interlocuteur.label" default="Interlocuteur" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><g:textField class="form-control" name="interlocuteur" required="" value="${labelisationProjetInstance?.interlocuteur}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'interlocuteur', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'fonction', 'error')} required">
                        <td width="250"><label for="fonction" class="control-label"><g:message code="labelisationProjet.fonction.label" default="Fonction" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><g:textField class="form-control" name="fonction" required="" value="${labelisationProjetInstance?.fonction}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'fonction', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'nomProjet', 'error')} required">
                        <td width="250"><label for="nomProjet" class="control-label"><g:message code="labelisationProjet.nomProjet.label" default="Nom Projet" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><g:textField class="form-control" name="nomProjet" required="" value="${labelisationProjetInstance?.nomProjet}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'nomProjet', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'nomCompletProjet', 'error')} ">
                        <td width="250"><label for="nomCompletProjet" class="control-label"><g:message code="labelisationProjet.nomCompletProjet.label" default="Nom Complet Projet" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="nomCompletProjet" value="${labelisationProjetInstance?.nomCompletProjet}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'nomCompletProjet', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'website', 'error')} ">
                        <td width="250"><label for="website" class="control-label"><g:message code="labelisationProjet.website.label" default="Website" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="website" value="${labelisationProjetInstance?.website}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'website', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'aap', 'error')} ">
                        <td width="250"><label for="aap" class="control-label"><g:message code="labelisationProjet.aap.label" default="Aap" /></label></td>
			<div>
                        <td><g:field class="form-control" name="aap" type="number" value="${labelisationProjetInstance.aap}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'aap', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'budget', 'error')} ">
                        <td width="250"><label for="budget" class="control-label"><g:message code="labelisationProjet.budget.label" default="Budget" /></label></td>
			<div>
                        <td><g:field class="form-control" name="budget" type="number" value="${labelisationProjetInstance.budget}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'budget', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'duree', 'error')} ">
                        <td width="250"><label for="duree" class="control-label"><g:message code="labelisationProjet.duree.label" default="Duree" /></label></td>
			<div>
                        <td><g:field class="form-control" name="duree" type="number" value="${labelisationProjetInstance.duree}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'duree', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'dateDebut', 'error')} ">
                        <td width="250"><label for="dateDebut" class="control-label"><g:message code="labelisationProjet.dateDebut.label" default="Date Debut" /></label></td>
			<div>
                        <td><bs:datePicker name="dateDebut" precision="day"  value="${labelisationProjetInstance?.dateDebut}" default="none" noSelection="['': '']" /></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'dateDebut', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'dateFin', 'error')} ">
                        <td width="250"><label for="dateFin" class="control-label"><g:message code="labelisationProjet.dateFin.label" default="Date Fin" /></label></td>
			<div>
                        <td><bs:datePicker name="dateFin" precision="day"  value="${labelisationProjetInstance?.dateFin}" default="none" noSelection="['': '']" /></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'dateFin', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'resumeFrancais', 'error')} ">
                        <td width="250"><label for="resumeFrancais" class="control-label"><g:message code="labelisationProjet.resumeFrancais.label" default="Resume Francais" /></label></td>
			<div>
                        <td><g:textArea class="form-control" name="resumeFrancais" cols="40" rows="5" maxlength="65535" value="${labelisationProjetInstance?.resumeFrancais}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'resumeFrancais', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'resumeAnglais', 'error')} ">
                        <td width="250"><label for="resumeAnglais" class="control-label"><g:message code="labelisationProjet.resumeAnglais.label" default="Resume Anglais" /></label></td>
			<div>
                        <td><g:textArea class="form-control" name="resumeAnglais" cols="40" rows="5" maxlength="65535" value="${labelisationProjetInstance?.resumeAnglais}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'resumeAnglais', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'lienAap', 'error')} ">
                        <td width="250"><label for="lienAap" class="control-label"><g:message code="labelisationProjet.lienAap.label" default="Lien Aap" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="lienAap" value="${labelisationProjetInstance?.lienAap}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'lienAap', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'motifRefusReception', 'error')} ">
                        <td width="250"><label for="motifRefusReception" class="control-label"><g:message code="labelisationProjet.motifRefusReception.label" default="Motif Refus Reception" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="motifRefusReception" value="${labelisationProjetInstance?.motifRefusReception}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'motifRefusReception', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'preselection', 'error')} ">
                        <td width="250"><label for="preselection" class="control-label"><g:message code="labelisationProjet.preselection.label" default="Preselection" /></label></td>
			<div>
                        <td><g:select class="form-control" name="preselection" from="${labelisationProjetInstance.constraints.preselection.inList}" value="${labelisationProjetInstance?.preselection}" valueMessagePrefix="labelisationProjet.preselection" noSelection="['': '']"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'preselection', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'motifRejetPreselection', 'error')} ">
                        <td width="250"><label for="motifRejetPreselection" class="control-label"><g:message code="labelisationProjet.motifRejetPreselection.label" default="Motif Rejet Preselection" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="motifRejetPreselection" value="${labelisationProjetInstance?.motifRejetPreselection}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'motifRejetPreselection', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'avisSynthese', 'error')} ">
                        <td width="250"><label for="avisSynthese" class="control-label"><g:message code="labelisationProjet.avisSynthese.label" default="Avis Synthese" /></label></td>
			<div>
                        <td><g:select class="form-control" name="avisSynthese" from="${labelisationProjetInstance.constraints.avisSynthese.inList}" value="${labelisationProjetInstance?.avisSynthese}" valueMessagePrefix="labelisationProjet.avisSynthese" noSelection="['': '']"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'avisSynthese', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'motifAvisSynthese', 'error')} ">
                        <td width="250"><label for="motifAvisSynthese" class="control-label"><g:message code="labelisationProjet.motifAvisSynthese.label" default="Motif Avis Synthese" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="motifAvisSynthese" value="${labelisationProjetInstance?.motifAvisSynthese}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'motifAvisSynthese', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'opinionComiteThematique', 'error')} ">
                        <td width="250"><label for="opinionComiteThematique" class="control-label"><g:message code="labelisationProjet.opinionComiteThematique.label" default="Opinion Comite Thematique" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="opinionComiteThematique" value="${labelisationProjetInstance?.opinionComiteThematique}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'opinionComiteThematique', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'decisionComex', 'error')} ">
                        <td width="250"><label for="decisionComex" class="control-label"><g:message code="labelisationProjet.decisionComex.label" default="Decision Comex" /></label></td>
			<div>
                        <td><g:select class="form-control" name="decisionComex" from="${labelisationProjetInstance.constraints.decisionComex.inList}" value="${labelisationProjetInstance?.decisionComex}" valueMessagePrefix="labelisationProjet.decisionComex" noSelection="['': '']"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'decisionComex', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'comformeAuxCritere', 'error')} ">
                        <td width="250"><label for="comformeAuxCritere" class="control-label"><g:message code="labelisationProjet.comformeAuxCritere.label" default="Comforme Aux Critere" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="comformeAuxCritere" value="${labelisationProjetInstance?.comformeAuxCritere}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'comformeAuxCritere', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'raisonNonConformite', 'error')} ">
                        <td width="250"><label for="raisonNonConformite" class="control-label"><g:message code="labelisationProjet.raisonNonConformite.label" default="Raison Non Conformite" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="raisonNonConformite" value="${labelisationProjetInstance?.raisonNonConformite}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'raisonNonConformite', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'accepterReglesConfidentialite', 'error')} ">
                        <td width="250"><label for="accepterReglesConfidentialite" class="control-label"><g:message code="labelisationProjet.accepterReglesConfidentialite.label" default="Accepter Regles Confidentialite" /></label></td>
			<div>
                        <td><bs:checkBox name="accepterReglesConfidentialite" value="${labelisationProjetInstance?.accepterReglesConfidentialite}" /></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'accepterReglesConfidentialite', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'clusters', 'error')} ">
                        <td width="250"><label for="clusters" class="control-label"><g:message code="labelisationProjet.clusters.label" default="Clusters" /></label></td>
			<div>
                        <td><g:select class="form-control" name="clusters" from="${com.rabbahsoft.mnc.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${labelisationProjetInstance?.clusters*.id}" class="many-to-many"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'clusters', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'comitesThematiques', 'error')} ">
                        <td width="250"><label for="comitesThematiques" class="control-label"><g:message code="labelisationProjet.comitesThematiques.label" default="Comites Thematiques" /></label></td>
			<div>
                        <td><g:select class="form-control" name="comitesThematiques" from="${com.rabbahsoft.mnc.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${labelisationProjetInstance?.comitesThematiques*.id}" class="many-to-many"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'comitesThematiques', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'membresComiteValides', 'error')} ">
                        <td width="250"><label for="membresComiteValides" class="control-label"><g:message code="labelisationProjet.membresComiteValides.label" default="Membres Comite Valides" /></label></td>
			<div>
                        <td><g:select class="form-control" name="membresComiteValides" from="${com.rabbahsoft.mnc.User.list()}" multiple="multiple" optionKey="id" size="5" value="${labelisationProjetInstance?.membresComiteValides*.id}" class="many-to-many"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'membresComiteValides', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'motsCles', 'error')} ">
                        <td width="250"><label for="motsCles" class="control-label"><g:message code="labelisationProjet.motsCles.label" default="Mots Cles" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="motsCles" value="${labelisationProjetInstance?.motsCles}"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'motsCles', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'rapporteurs', 'error')} ">
                        <td width="250"><label for="rapporteurs" class="control-label"><g:message code="labelisationProjet.rapporteurs.label" default="Rapporteurs" /></label></td>
			<div>
                        <td><g:select class="form-control" name="rapporteurs" from="${com.rabbahsoft.mnc.User.list()}" multiple="multiple" optionKey="id" size="5" value="${labelisationProjetInstance?.rapporteurs*.id}" class="many-to-many"/></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'rapporteurs', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: labelisationProjetInstance, field: 'recevable', 'error')} ">
                        <td width="250"><label for="recevable" class="control-label"><g:message code="labelisationProjet.recevable.label" default="Recevable" /></label></td>
			<div>
                        <td><bs:checkBox name="recevable" value="${labelisationProjetInstance?.recevable}" /></td>
			<span class="help-inline">${hasErrors(bean: labelisationProjetInstance, field: 'recevable', 'error')}</span>			
                        </div>
			</div>
                        
                        
                        
                        </tr>
                        </table>


<!--Create page--> 
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
  <style>
.toto{
width:200px;
}
</style>
  <body>
       
  <g:set var="curentstep" value="${etape + 2}" />
  <g:if test="${flash.message}">
    <div class="alert alert-success">
      <a class="close" data-dismiss="alert">×</a>
      <strong>${flash.message}</strong>
    </div>
  </g:if>
  <div id="messageerreur"></div>
  <div class="row-fluid">
    <div class="span12">
      <h3 class="heading">Labélisation du projet</h3>
    </div>
      
    <div class="tabbable tabs-left">
      <ul class="nav nav-tabs">
         <g:each var="i" in="${ (1..<etape+2)}">
        <li class="${ etape == i-1 ? 'active' : '' }"><a href="#tab_l${i}" data-toggle="tab">Etape ${i}</a></li>
        </g:each>
      </ul>
      <div class="tab-content">
        <g:each var="i" in="${ (1..<etape+2) }">
         <div class="${ etape == i-1 ? 'tab-pane active' : 'tab-pane' }" id="tab_l${i}">
          <g:render template="form${i}"/>
        </div>
        </g:each>
      </div>
    </div>
  </div>
  <script>
          
</script>
</body>

</html>

                                                  

