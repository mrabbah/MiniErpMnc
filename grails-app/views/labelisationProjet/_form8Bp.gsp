<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<g:set var="mailEtape11" value="${MailTemplate.findByCode("MAIL_ETAPE11")}"/>
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_thirteenthstep" novalidate="novalidate">
  <fieldset>
    <div class="v-heading">Post label</div>

    <div class="row-fluid">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Dossier finnacement :</dt>
          <dd></dd>
          
          
          <g:if test="${labelisationProjetInstance.getTotalAttachments('dossierfinnacement')!=0}">
            <table class="table table-striped table-bordered table-condensed">
              <tr>
                <th>Icon</th>
                <th>Nom du fichier</th>
                <th>Taille</th>
                <th>Supprimer</th>
              </tr>
              <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('dossierfinnacement')) }">
                <tr id="${labelisationProjetInstance.getAttachments('dossierfinnacement')[i].id}">
                  <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('dossierfinnacement')[i]}"/></td> 
                <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('dossierfinnacement')[i]}"/></td>
                <td>${labelisationProjetInstance.getAttachments('dossierfinnacement')[i].niceLength}</td>
                <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('dossierfinnacement')[i].id},${labelisationProjetInstance.id}); return false;"><i class="icon-trash"></i></a></td>
                </tr>
              </g:each>
            </table>
          </g:if>
          
          
      </div>
      <g:actionSubmit action="saveEtape13Bp" class="btn btn-danger" value="Enregistrer" />
    </div>
  </fieldset>
</g:form>