<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<g:set var="mailEtape11" value="${MailTemplate.findByCode("MAIL_ETAPE11")}"/>
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_thirteenthstep" novalidate="novalidate">
  <fieldset>
    <div class="v-heading">Décision Comex</div>
<g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
    <div class="row-fluid">
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.decision.label" default="Décision :" /></label>
        </div>
        <g:if test="${(labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==8)}">
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="avisFavorable" name="decisionEtape7Bp" id="decisionEtape7Bp1" <g:if test="${labelisationProjetInstance.decisionEtape7Bp=='avisFavorable' || labelisationProjetInstance.decisionEtape7Bp==null || labelisationProjetInstance?.decisionEtape7Bp=="" || labelisationProjetInstance?.decisionEtape7Bp=="null"}">checked</g:if>   />
            Avis favorable
          </label>
          <label class="radio inline">
            <input type="radio" value="rejete"  name="decisionEtape7Bp" id="decisionEtape7Bp2" <g:if test="${labelisationProjetInstance.decisionEtape7Bp=='rejete'}">checked</g:if>   />
            Projet rejeté
          </label>
        </div> 
        </g:if>
      <g:else>
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="avisFavorable" name="decisionEtape7Bp" disabled="disabled" id="decisionEtape7Bp1" <g:if test="${labelisationProjetInstance.decisionEtape7Bp=='avisFavorable' || labelisationProjetInstance.decisionEtape7Bp==null || labelisationProjetInstance?.decisionEtape7Bp=="" || labelisationProjetInstance?.decisionEtape7Bp=="null"}">checked</g:if>   />
            Avis favorable
          </label>
          <label class="radio inline">
            <input type="radio" value="rejete"  name="decisionEtape7Bp" disabled="disabled" id="decisionEtape7Bp2" <g:if test="${labelisationProjetInstance.decisionEtape7Bp=='rejete'}">checked</g:if>   />
            Projet rejeté
          </label>
        </div>
      </g:else>
        
      </div>
      <div id="projetRejeteDecisionFinale">
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.raisonNonConformite.label" default="Raisons :" /></label>
          </div>
          <div class="span10">
            <g:if test="${(labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==8)}">
            <textarea cols="1" rows="6" class="span12" id="raisonNonConformiteEtape9" name="raisonNonConformiteEtape9" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonNonConformiteEtape9}</textarea>
          </g:if>
      <g:else>
            <textarea cols="1" rows="6" class="span12" readonly id="raisonNonConformiteEtape9" name="raisonNonConformiteEtape9" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonNonConformiteEtape9}</textarea>
            </g:else>
            
          </div>
        </div>
      </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Date réelle COMEX :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <div class="dateTimeAudition input-append date span11">
            <g:if test="${(labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==8)}">
              <input data-format="dd/MM/yyyy hh:mm" type="text" class="span9" name="dateReeleffCommex" id="dateReeleffCommex" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateReeleffCommex)}" readonly="readonly" />
              </g:if>
      <g:else>
              <input data-format="dd/MM/yyyy hh:mm" readonly type="text" class="span9" name="dateReeleffCommex" id="dateReeleffCommex" value="${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateReeleffCommex)}" readonly="readonly" />
      </g:else>
              <span class="add-on">
                <i class="splashy-calendar_day"></i>
              </span>
            </div>
        </div>
        
      </div>
      <g:if test="${(labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==8)}">
      <g:actionSubmit action="saveEtape7Bp" class="btn btn-danger" value="Soumettre" />
      </g:if>
    </div>
  </fieldset>
</g:form>