<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<script type="application/javascript">
  var recevable=${labelisationProjetInstance.recevable==true ? true :false}
</script>
<g:set var="regleConfidentialiteTemplate" value="${MailTemplate.findByCode("mailReglesConfidentialite")}"/>
<g:set var="regleConfidentialiteTemplatePorteurEvaluateurs" value="${MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")}"/>
<g:set var="VerificationAssignement" value="${MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")}"/>

<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_secondtstep" novalidate="novalidate">
  <g:hiddenField name="id" value="${labelisationProjetInstance?.id}" />
  <g:hiddenField name="version" value="${labelisationProjetInstance?.version}" />
  <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
  <fieldset>
    <div class="row-fluid">
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.decision.label" default="Recevable:" /></label>
        </div>
        <g:hiddenField name="datesoumission" id="datesoumission" value="${labelisationProjetInstance.dateSoumissionProjet}" />
         <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="true" id="recevable" name="recevable" <g:if test="${labelisationProjetInstance.recevable==true}">checked</g:if>  />
            Oui
          </label>
          <label class="radio inline">
            <input type="radio" value="false" id="recevable" name="recevable" <g:if test="${labelisationProjetInstance.recevable==false}">checked</g:if>  />
            Non
          </label>
        </div>
        </g:if>
          <g:else>
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="true" id="recevable" name="recevable" disabled="disabled" <g:if test="${labelisationProjetInstance.recevable==true}">checked</g:if> />
            Oui
          </label>
          <label class="radio inline">
            <input type="radio" value="false" id="recevable" name="recevable" disabled="disabled" <g:if test="${labelisationProjetInstance.recevable==false}">checked</g:if> />
            Non
          </label>
        </div>
        </g:else>
      </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.motifRefusReception.label" default="Raisons :" /><span style="color:red">* :</span></label>
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
        <div class="span10">
          <textarea cols="1" rows="6" name="raisonRecevabilite" id="raisonRecevabilite" class="span12" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonRecevabilite}</textarea>
        </div>
        </g:if>
          <g:else>
         <div class="span10">
          <textarea cols="1" rows="6" name="raisonRecevabilite" id="raisonRecevabilite" class="span12" readonly style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonRecevabilite}</textarea>
        </div>
        </g:else>
        
      </div>
      <div id="siOui">
<!--        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Clusters :" /></label>
          </div>
          <div class="span10">
            <g:select name="clusters" id="clusters" from="${com.rabbahsoft.mnc.Cluster.list()}" optionKey="id" value="${labelisationProjetInstance?.clusters*.id}"  multiple="multiple" data-placeholder="Ajoutez..." class="chzn_b span12" />
          </div>
        </div>-->
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Comites thematiques :" /><span style="color:red">* :</span></label>
          </div>
          
          <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
          <div class="span10">
            <g:select name="comitesThematiques" id="comitesThematiques" from="${com.rabbahsoft.securite.ComiteThematique.list()}" optionKey="id" value="${labelisationProjetInstance?.comitesThematiques*.id}" multiple="multiple" data-placeholder="Ajoutez ..." class="chzn_b span12" />
          </div>
          </g:if>
          <g:else>
           <div class="span10">
            <g:select name="comitesThematiques" id="comitesThematiques"  optionKey="id" from="${com.rabbahsoft.securite.ComiteThematique.list()}" value="${labelisationProjetInstance?.comitesThematiques*.id}"  class="chzn_b span12" disabled="disabled" />
          </div>
          </g:else>
        </div>
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.motifRefusReception.label" default="Evaluateurs :" /></label>
          </div>
         
          <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
           <div class="span4" id="test">
           <select id="evaluateurs" multiple="multiple" name="evaluateurs">
           </select>
          </div>
             <div class="span3">
            <label><g:message code="labelisationProjet.autre.label" default="Autres(emails separés par ;):" /></label>
          </div>
            <div class="span3">
            <input type="text" class="span10" id="autre" name="autre" value="${labelisationProjetInstance?.autre}" autocomplete="off"> 
          </div>
          </g:if>
          <g:else>
            <div class="span4">
            <g:select name="evaluateurs"  id="evaluateurs" from="${labelisationProjetInstance?.evaluateurs}" optionKey="id" value="${labelisationProjetInstance?.evaluateurs*.id}" multiple="multiple" data-placeholder="Ajoutez ..." class="chzn_b span12" disabled="true"/>
          </div>
           <div class="span3">
            <label><g:message code="labelisationProjet.autre.label" default="Autre mails des evaluateurs:" /></label>
          </div>
            <div class="span3">
            <input type="text" class="span10" id="autre" name="autre" value="${labelisationProjetInstance.autre}" disabled> 
          </div>
          </g:else>
        </div>
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.motifRefusReception.label" default="Règles de gestion des éventuels conflits:" /></label>
          </div>
          <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
          <div class="span10">
            <textarea cols="1" rows="6" name="reglesGestion" id="reglesGestion" class="span12" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.reglesGestion}</textarea>
          </div>
          </g:if>
          <g:else>
          <div class="span10">
            <textarea cols="1" rows="6" name="reglesGestion" id="reglesGestion" class="span12" readonly style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.reglesGestion}</textarea>
          </div>
          </g:else>
        </div>
<!--      <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Rapporteurs désignés :" /></label>
          </div>
          <div class="span10">
            <g:select name="rapporteurs"  id="rapporteurs"  optionKey="id" value="${labelisationProjetInstance?.rapporteurs*.id}"  from="${com.rabbahsoft.securite.Utilisateur.list()}" multiple="multiple" data-placeholder="Ajoutez ..." class="chzn_b span12" />
          </div>
        </div>-->
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Date de l'audition :" /><span style="color:red">* :</span></label>
          </div>
          <div class="span4">
            <div class="dateTimeAudition input-append date span11">
              <g:if test="${labelisationProjetInstance?.dateAuditionEtape1Bp!=null}">
              <input data-format="dd/MM/yyyy hh:mm:ss" type="text" class="span9" name="dateAuditionEtape1Bp" id="dateAuditionEtape1Bp" value="${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateAuditionEtape1Bp)}"  disabled/>
              </g:if>
              <g:else>
                 <input data-format="dd/MM/yyyy hh:mm:ss" type="text" class="span9" name="dateAuditionEtape1Bp" name="dateAuditionEtape1Bp" value=""  />
<!--                 <input data-format="dd/MM/yyyy hh:mm:ss" type="text" class="span9" name="dateAuditionEtape1Bp" name="dateAuditionEtape1Bp" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:new Date())}" readonly="readonly" />-->
              <span class="add-on">
                <i class="splashy-calendar_day"></i>
              </span>  
              </g:else>
              
            </div>
          </div>
          <div class="span2">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Lieu de l'audition :" /><span style="color:red">* :</span></label>
          </div>
          <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
          <div class="span4">
            <input type="text" class="span10" id="lieuAuditionEtape1Bp" name="lieuAuditionEtape1Bp" value="${labelisationProjetInstance?.lieuAuditionEtape1Bp}" autocomplete="off"> 
          </div>
          </g:if>
              <g:else>
          <div class="span4">
            <input type="text" class="span10" id="lieuAuditionEtape1Bp" name="lieuAuditionEtape1Bp" value="${labelisationProjetInstance?.lieuAuditionEtape1Bp}" autocomplete="off" readonly="readonly"> 
          </div>
          </g:else>
        </div>
<!--        <div class="control-group">
          <div class="span2">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Règles de confidentialité :" /></label>
          </div>
          <div class="span10">
            <textarea name="reglesConfidentialite" id="reglesConfidentialite" class="tinycme" cols="30" rows="8" style="visibility: hidden;">${labelisationProjetInstance?.reglesConfidentialite==null ? regleConfidentialiteTemplate?.template : labelisationProjetInstance?.reglesConfidentialite}</textarea>
          </div>
        </div>-->
      </div>
      
      
<!--      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Le mail qui va être envoyé au porteur pour le notifier de la recevabilité de son projet :" /></label>
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
        <div class="span10">
          <textarea name="notificationrecevabilite" id="notificationrecevabilite" class="tinycme" cols="30" rows="8" style="visibility: hidden;">${labelisationProjetInstance?.notificationrecevabilite==null ? regleConfidentialiteTemplatePorteurEvaluateurs?.template : labelisationProjetInstance?.notificationrecevabilite}</textarea>
        </div>
        </g:if>
              <g:else>
        <div class="span10">
          <textarea name="notificationrecevabilite" id="notificationrecevabilite" class="tinycme" cols="30" rows="8" readonly="readonly" style="visibility: hidden;">${labelisationProjetInstance?.notificationrecevabilite==null ? regleConfidentialiteTemplatePorteurEvaluateurs?.template : labelisationProjetInstance?.notificationrecevabilite}</textarea>
        </div>
        </g:else>
      </div>-->
      
      <!--      ajouter recement-->
      <div id="oui1">
      <!--      ajouter recement-->
      
      
<!--      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Le mail qui va être envoyé aux évaluateurs concernant l'assignement et la vérification des informations :" /></label>
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2}">
        <div class="span10">
          <textarea name="affirmationCT" id="affirmationCT" class="tinycme" cols="30" rows="8" style="visibility: hidden;">${labelisationProjetInstance?.affirmationCT==null ? VerificationAssignement?.template : labelisationProjetInstance?.affirmationCT}</textarea>
        </div>
          </g:if>
              <g:else>
          <div class="span10">
          <textarea name="affirmationCT" id="affirmationCT" class="tinycme" cols="30" rows="8" readonly="readonly" style="visibility: hidden;">${labelisationProjetInstance?.affirmationCT==null ? VerificationAssignement?.template : labelisationProjetInstance?.affirmationCT}</textarea>
        </div>
          </g:else>
      </div>-->
      
<!--      ajouter recement-->
      </div>
      <!--      fin ajouter recement-->
      <g:if test="${(labelisationProjetInstance.etapePorteur==1 && labelisationProjetInstance.etapeBp==2)}">
      <g:actionSubmit action="saveEtape1Bp" class="btn btn-danger" value="Accepter" />
      </g:if>
    </div>
  </fieldset>
</g:form>