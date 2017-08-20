<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<g:set var="mailEtape8Porteur" value="${MailTemplate.findByCode("mailEtape8Porteur")}"/>
<g:set var="mailEtape8Bp" value="${MailTemplate.findByCode("mailEtape8Bp")}"/>
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_administration" novalidate="novalidate" >
  <fieldset>
    <div class="v-heading">Partie administration</div>
    <div class="row-fluid">
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.decision.label" default="Compétence externe :" /></label>
        </div>
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="true" id="administration1" name="administration" <g:if test="${labelisationProjetInstance.administration==true || labelisationProjetInstance.administration==null || labelisationProjetInstance?.administration=="" || labelisationProjetInstance?.administration=="null"}">checked</g:if>  />
            Oui
          </label>
          <label class="radio inline">
            <input type="radio" value="false" id="administration2" name="administration" <g:if test="${labelisationProjetInstance.administration==false}">checked</g:if>  />
            Non 
          </label>
        </div>
      </div>
      <g:actionSubmit action="saveEtapeAdministration" class="btn btn-danger" value="Enregistrer" />
    </div>
  </fieldset>
</g:form>