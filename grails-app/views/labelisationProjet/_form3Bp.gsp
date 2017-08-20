<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.Document" %>
<g:set var="ficheTechniqueInstance" value="${Document.findByCode("ficheTechnique")}" />
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_seventhstep" novalidate="novalidate" enctype="multipart/form-data">
  <fieldset>
    <div class="row-fluid">
      <div class="v-heading">Présentation détaillée & Fiche technique</div>
      <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Fiche Projet :" /></label>
        </div>
        <div class="span10">
          <g:if test="${labelisationProjetInstance.getTotalAttachments('presentationdetaillee')!=0}">
            <table class="table table-striped table-bordered table-condensed">
              <tr>
                <th></th>
                <th>Nom du fichier</th>
                <th>Taille</th>
              </tr>
              <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('presentationdetaillee')) }">
                <tr id="${labelisationProjetInstance.getAttachments('presentationdetaillee')[i].id}">
                  <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('presentationdetaillee')[i]}"/></td> 
                <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('presentationdetaillee')[i]}"/></td>
                <td>${labelisationProjetInstance.getAttachments('presentationdetaillee')[i].niceLength}</td>
                </tr>
              </g:each>
            </table>
          </g:if>
        </div>
      </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Dossier de labellisation :" /></label>
        </div>
        <div class="span10">
          <g:if test="${labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0}">
            <table class="table table-striped table-bordered table-condensed">
              <tr>
                <th></th>
                <th>Nom du fichier</th>
                <th>Taille</th>
              </tr>
              <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('ficheTechnique')) }">
                <tr id="${labelisationProjetInstance.getAttachments('ficheTechnique')[i].id}">
                <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('ficheTechnique')[i]}"/></td> 
                <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('ficheTechnique')[i]}"/></td>
                <td>${labelisationProjetInstance.getAttachments('ficheTechnique')[i].niceLength}</td>
                </tr>
              </g:each>
            </table>
          </g:if>

        </div>
      </div>
         <div class="control-group span12">
          
           <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Confirmations évaluateurs :" /></label>
          </div>
             <div class="span4">
            <g:select name="rapporteurs"  id="rapporteurs" from="${labelisationProjetInstance?.rapporteursconfirmes}" optionKey="id" value="${labelisationProjetInstance?.evaluateurs*.id}" multiple="multiple"  class="chzn_b span12"/>
          </div>
             </g:if>
            <g:else>
              <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Confirmations évaluateurs :" /></label>
          </div>
             <div class="span4">
            <g:select name="rapporteurs"  id="rapporteurs" disabled="disabled" from="${labelisationProjetInstance?.rapporteursconfirmes}" optionKey="id" value="${labelisationProjetInstance?.evaluateurs*.id}" multiple="multiple"  class="chzn_b span12"/>
          </div>
            </g:else>
        </div>
           <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Evaluateurs externes :" /></label>
          </div>
          <div class="span4">
            <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
            <div class="input-append span9" >
              <input class="span12" type="text" id="autre" name="autre" value="${labelisationProjetInstance?.autre}" >
            </div>
            </g:if>
            <g:else>
            <div class="input-append span9" >
              <input class="span12" type="text" id="autre" name="autre" readonly value="${labelisationProjetInstance?.autre}" >
            </div>
            </g:else>
          </div>
        </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Commentaire :" /></label>
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
        <div class="span10">
     <g:textArea class="form-control" name="commentaireftfd" cols="40" rows="5" maxlength="65535" value="${labelisationProjetInstance?.commentaireftfd}"/>
        </div>
          </g:if>
            <g:else>
          <div class="span10">
     <g:textArea class="form-control" name="commentaireftfd" cols="40" rows="5" maxlength="65535" readonly value="${labelisationProjetInstance?.commentaireftfd}"/>
        </div>
         </g:else> 
      </div>
<g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==4)}">
      <g:actionSubmit action="saveEtape3Bp" class="btn btn-danger" value="Accuse de réception" />
</g:if>
    </div>
  </fieldset>
</g:form>