<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<g:set var="mailEtape10" value="${MailTemplate.findByCode("MAIL_ETAPE10")}"/>
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_tenthstep" novalidate="novalidate">
  <fieldset>
    <div class="v-heading">Réunion VGAC </div>
    <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
    <div class="row-fluid">
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.decision.label" default="Décision :" /></label>
        </div>
        
        <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==7)}">
        <div class="span9">
          <label class="radio inline">
            <input id="decisionEtape6Bp" type="radio" value="avisFavorable" name="decisionEtape6Bp" <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="avisFavorable" || labelisationProjetInstance?.decisionEtape6Bp=="" || labelisationProjetInstance?.decisionEtape6Bp=="null" || labelisationProjetInstance?.decisionEtape6Bp==null}">checked</g:if>  />
            Avis favorable
          </label>
           
          <label class="radio inline">
            <input id="decisionEtape6Bp" type="radio" value="rejete" name="decisionEtape6Bp" <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="rejete"}">checked</g:if>  />
            Projet rejeté
          </label>
<!--          <label class="radio inline">
            <input id="decisionEtape6Bp" type="radio" value="nouvelleVersion" <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="nouvelleVersion"}">checked</g:if> id="" name="decisionEtape6Bp" />
            Demande nouvelle version
          </label>-->
        </div>
        </g:if>
      <g:else>
          <div class="span9">
          <label class="radio inline">
            <input id="decisionEtape6Bp" type="radio" value="avisFavorable" disabled="disabled" name="decisionEtape6Bp" <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="avisFavorable" || labelisationProjetInstance?.decisionEtape6Bp=="" || labelisationProjetInstance?.decisionEtape6Bp=="null" || labelisationProjetInstance?.decisionEtape6Bp==null}">checked</g:if>  />
            Avis favorable
          </label>
           
          <label class="radio inline">
            <input id="decisionEtape6Bp" type="radio" value="rejete" disabled="disabled" name="decisionEtape6Bp" <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="rejete"}">checked</g:if>  />
            Projet rejeté
          </label>
        </div>
      </g:else>
      </div>   
      <div id="avisFavorablediv">
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Date Validation :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <div class="dateTimeAudition input-append date span11">
            <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==7)}">
            <input data-format="dd/MM/yyyy hh:mm" type="text" class="span9" name="dateValidation" id="dateValidation" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateValidation)}"  />
<!--         <input  type="text"  name="dateValidation" id="dateValidation" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateValidation)}"  placeholder="dd/mm/yyyy"/>-->
            </g:if>
      <g:else>
              <input type="text" readonly class="span9" name="dateValidation" id="dateValidation" value="${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateValidation)}" readonly="readonly" />
      </g:else>
              <span class="add-on">
                <i class="splashy-calendar_day"></i>
              </span>
            </div>
        </div>
        
      </div>
          <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateEnvoiDecisionPorteur.label" default="Date rendez_vous devant COMEX :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <div class="dateTimeAudition input-append date span11">
            <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==7)}">
             <input data-format="dd/MM/yyyy hh:mm:ss" type="text" class="span9" name="dateAuditionEtape6Bp" id="dateAuditionEtape6Bp" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateAuditionEtape6Bp)}" />
<!--              <input  type="text" name="dateAuditionEtape6Bp" id="dateAuditionEtape6Bp" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateAuditionEtape6Bp)}"  placeholder="dd/mm/yyyy"/>-->
               </g:if>
      <g:else>
         <input  type="text" readonly class="span9" name="dateAuditionEtape6Bp" id="dateAuditionEtape6Bp" value="${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateAuditionEtape6Bp)}" readonly="readonly" />
        </g:else>  
              <span class="add-on">
                <i class="splashy-calendar_day"></i>
              </span>
            </div>
        </div>
        <div class="span2">
          <label><g:message code="labelisationProjet.datePrevuAuditionComex.label" default="Lieu audition :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==7)}">
          <input type="text" class="span10" id="lieuAuditionEtape6Bp" name="lieuAuditionEtape6Bp" value="${labelisationProjetInstance?.lieuAuditionEtape6Bp}">
        </g:if>
      <g:else>
          <input type="text" class="span10" id="lieuAuditionEtape6Bp" readonly name="lieuAuditionEtape6Bp" value="${labelisationProjetInstance?.lieuAuditionEtape6Bp}">
      </g:else>
          </div>
      </div>
        
        
        
        
      </div>
      <div id="projetRejete">
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.raisonNonConformite.label" default="Raisons :" /></label>
        </div>
        <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==7)}">
        <div class="span10">
          <textarea cols="1" rows="6" class="span12" id="raisonRejetEtape6Bp" name="raisonRejetEtape6Bp" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonRejetEtape6Bp}</textarea>
        </div>
          </g:if>
      <g:else>
         <div class="span10">
          <textarea cols="1" rows="6" class="span12" id="raisonRejetEtape6Bp" readonly name="raisonRejetEtape6Bp" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonRejetEtape6Bp}</textarea>
        </div>
         </g:else> 
      </div>
      </div>
<g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==7)}">
      <g:actionSubmit action="saveEtape6Bp" class="btn btn-danger" value="Soumettre" />
      </g:if>
    </div>
  </fieldset>
</g:form>