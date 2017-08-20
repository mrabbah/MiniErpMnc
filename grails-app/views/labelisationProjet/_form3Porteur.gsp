<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<script>
  function deletefile(idfile,id,val1){
  $.post(val1+"/LabelisationProjet/deletefile",
  {
  id:id,
  idfile:idfile
  },
  function(data){ 
  if(data==="true"){
  var selector="#"+idfile;
  $(selector).animate({ backgroundColor: "#FFFF00" }, "fast").animate({ opacity: "hide" }, "slow");
  $.sticky("Le fichier a été supprimé.", {autoclose: 5000, position: "top-right", type: "st-error"});
  location.reload();
  }
  }
  );

  }
</script>
<g:set var="context11" value="${request.contextPath}" />
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_3Porteur" novalidate="novalidate" enctype="multipart/form-data" >
  <div class="v-heading" style="background-color:#4c9689">Pitch CT</div>
  <div class="row-fluid">
    <div class="control-group span12">
      <dl class="dl-horizontal">
        <dt>Décision CT :</dt>
        <dd>${labelisationProjetInstance.decisionEtape2Bp}</dd>
    </div>

    <g:if test="${labelisationProjetInstance.decisionEtape2Bp=="rejete"}">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Raisons du rejet :</dt>
          <dd>${labelisationProjetInstance?.raisonRejetEtape2Bp}</dd>
      </div>
    </g:if>

    <g:if test="${labelisationProjetInstance.decisionEtape2Bp=="reaudition"}">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Date ré-audition :</dt>
          <dd>${labelisationProjetInstance?.dateReauditionEtape2Bp}</dd>
      </div>
    </g:if>

    <g:if test="${labelisationProjetInstance.decisionEtape2Bp=="redirection"}">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Structure d'accompagnement :</dt>
          <dd>${labelisationProjetInstance?.structureAccompagnement}</dd>
      </div>
    </g:if>


    <g:if test="${labelisationProjetInstance.decisionEtape2Bp=="preselection"}">
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Fiche Projet :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span10">
          <g:if test="${labelisationProjetInstance.getTotalAttachments('presentationdetaillee')!=0}">
            <table class="table table-striped table-bordered table-condensed">
              <tr>
                <th>Icon</th>
                <th>Nom du fichier</th>
                <th>Taille</th>
                <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
                <th>Supprimer</th>
                </g:if>
              </tr>
              <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('presentationdetaillee')) }">
                <tr id="${labelisationProjetInstance.getAttachments('presentationdetaillee')[i].id}">
                  <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('presentationdetaillee')[i]}"/></td> 
                <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('presentationdetaillee')[i]}"/></td>
                <td>${labelisationProjetInstance.getAttachments('presentationdetaillee')[i].niceLength}</td>
                <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
                <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('presentationdetaillee')[i].id},${labelisationProjetInstance.id},'${context11}'); return false;"><i class="icon-trash"></i></a></td>
                </g:if>
                </tr>
              </g:each>
            </table>
          </g:if>
          <g:else>
            <div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden">
              <div class="input-append">
                <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Uploader</span><span class="fileupload-exists">changer</span><input type="file" id="presentationdetaillee" name="presentationdetaillee"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
              </div>
            </div>
          </g:else>
        </div>
      </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Dossier de labellisation :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span10">
          <g:if test="${labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0}">
            <table class="table table-striped table-bordered table-condensed">
              <tr>
                <th>Icon</th>
                <th>Nom du fichier</th>
                <th>Taille</th>
                <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
                <th>Supprimer</th>
                </g:if>
              </tr>
              <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('ficheTechnique')) }">
                <tr id="${labelisationProjetInstance.getAttachments('ficheTechnique')[i].id}">
                  <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('ficheTechnique')[i]}"/></td> 
                <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('ficheTechnique')[i]}"/></td>
                <td>${labelisationProjetInstance.getAttachments('ficheTechnique')[i].niceLength}</td>
                <g:if test="${labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3}">
                <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('ficheTechnique')[i].id},${labelisationProjetInstance.id},'${context11}'); return false;"><i class="icon-trash"></i></a></td>
                </g:if>
                </tr>
              </g:each>
            </table>
          </g:if>
          <g:else>
            <div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden">
              <div class="input-append">
                <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Uploader</span><span class="fileupload-exists">changer</span><input type="file" id="ficheTechnique" name="ficheTechnique"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
              </div>
            </div>
          </g:else>
        </div>
      </div>
    </g:if>
    <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3)}">
    <g:actionSubmit action="saveEtape3Porteur" class="btn btn-danger" value="Soumettre" />
    </g:if>
  </div>
</g:form>