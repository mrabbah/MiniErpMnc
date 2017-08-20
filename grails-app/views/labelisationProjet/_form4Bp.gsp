<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<g:set var="mailEtape8Porteur" value="${MailTemplate.findByCode("mailEtape8Porteur")}"/>
<g:set var="mailEtape8Bp" value="${MailTemplate.findByCode("mailEtape8Bp")}"/>
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_eighthstep" novalidate="novalidate" >
  <fieldset>
    <div class="v-heading">Appel à compétences</div>
    <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
    <div class="row-fluid">
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.decision.label" default="Compétence externe :" /></label>
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==5}">
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="true" <g:if test="${labelisationProjetInstance.recevable==true}">checked</g:if> id="" name="competenceexternesollicite" />
            Sollicitée
          </label>
          <label class="radio inline">
            <input type="radio" value="false" <g:if test="${labelisationProjetInstance.recevable==false}">checked</g:if> id="" name="competenceexternesollicite" />
            Non sollicitée
          </label>
        </div>
         </g:if>
            <g:else>
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="true" disabled="disabled" <g:if test="${labelisationProjetInstance.recevable==true}">checked</g:if> id="" name="competenceexternesollicite" />
            Sollicitée
          </label>
          <label class="radio inline">
            <input type="radio" value="false" disabled="disabled" <g:if test="${labelisationProjetInstance.recevable==false}">checked</g:if> id="" name="competenceexternesollicite" />
            Non sollicitée
          </label>
        </div>
         </g:else>
      </div>
      <div id="compétenceexternesollicite">
      <div class="control-group span12">
        <div class="span2">
          
          <label><g:message code="labelisationProjet.comitesThematiques.label" default="Compétences externes(emails séparés par ;) :" /></label>
       
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==5}">
        <div class="span10">
<!--          <g:select name="compétenceexterne"  id="compétenceexterne"  optionKey="id" value="${labelisationProjetInstance?.rapporteurs*.id}"  from="${com.rabbahsoft.securite.Utilisateur.list()}" multiple="multiple" data-placeholder="Ajoutez ..." class="chzn_b span12" />-->
        <g:textArea class="form-control" name="competenceexterne1" cols="40" rows="5" maxlength="65535" value="${labelisationProjetInstance?.competenceexterne1}"/>
        </div>
          </g:if>
            <g:else>
              <div class="span10">
        <g:textArea class="form-control" id="competenceexterne1" name="competenceexterne1" readonly cols="40" rows="5" maxlength="65535" value="${labelisationProjetInstance?.competenceexterne1}"/>
        </div>
               </g:else>
      </div>
        <div class="control-group span12">
        <div class="span10">
              <strong><label><g:message code="Il faudra informer le porteur par email ou par telephone" default="Il faudra informer le porteur par email ou par telephone " /></label></strong>
            </div>
      </div>
        </div>
      
    <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==5)}">
      <g:actionSubmit action="saveEtape4Bp" class="btn btn-danger" value="Soumettre" />
      </g:if>

    </div>
  </fieldset>
</g:form>