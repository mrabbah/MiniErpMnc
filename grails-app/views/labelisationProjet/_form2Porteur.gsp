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
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_recevabilitestep" enctype="multipart/form-data">
  <fieldset>
    <div class="v-heading" style="background-color:#4c9689">Recevabilité</div>
    <div class="row-fluid">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Projet recevable :</dt>
          <dd>${labelisationProjetInstance.recevable==true ? "Oui" : "Non"}</dd>
          <dt>Raisons :</dt>
          <dd>${labelisationProjetInstance.raisonRecevabilite}.</dd>
      </div>
      <g:if test="${labelisationProjetInstance.recevable==true}">
        <div class="control-group span12">
          <dl class="dl-horizontal">
            <dt>Date d'audition :</dt>
            <g:if test="${labelisationProjetInstance?.dateReauditionEtape2Bp!=null}">
             <dd>${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateReauditionEtape2Bp)}</dd>
              </g:if>
            <g:else>
            <g:if test="${labelisationProjetInstance?.dateAuditionEtape1Bp!=null}">
            <dd>${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateAuditionEtape1Bp)}</dd>
            </g:if>
             </g:else>
            <dt>Lieu de l'audition :</dt>
            <dd>${labelisationProjetInstance.lieuAuditionEtape1Bp}.</dd>
        </div>
<!--        <div class="control-group span12">
          <dl class="dl-horizontal">
            <dt>Règles de confidentialité Projet :</dt>
            <dd>${labelisationProjetInstance.reglesGestion}</dd>
        </div>-->
        <div class="control-group span12">
          <dl class="dl-horizontal">
            <dt>CT(s) désigné(s) :</dt>
            <dd> <g:each in="${labelisationProjetInstance.comitesThematiques}" status="i" var="ct">
              <span class="label label-info"> ${ct}</span>
            </g:each></dd>
        </div>
        <div class="control-group span12">
          <dl class="dl-horizontal">
            <dt>Membres CT(evaluateurs) :</dt>
            <dd> <g:each in="${labelisationProjetInstance.evaluateurs}" status="i" var="ci">
              <span class="label label-info"> ${ci}</span>
            </g:each></dd>
            <div class="span10">
<!--            <g:select name="rapporteurs"  id="rapporteurs" from="${labelisationProjetInstance.rapporteurs}" optionKey="id" value="${labelisationProjetInstance?.rapporteurs*.id}" multiple="multiple" data-placeholder="Ajoutez ..." class="chzn_b span12" />-->
            <dd> <g:each in="${labelisationProjetInstance.rapporteurs}" status="i" var="rap">
              <span class="label label-info"> ${rap}</span>
            </g:each></dd>
          </div>
        </div>
<div class="control-group span12">
          <dl class="dl-horizontal">
            <dt><label><g:message code="labelisationProjet.comitesThematiques.label" default="Autre rapporteurs :" /></label></dt>
            <dd> 
              <span class="label label-info">  <input class="span12" type="text" id="autre" name="autre" value="${labelisationProjetInstance?.autre}" readonly></span>
            </dd>
            <div class="span10">
            <dd> <g:each in="${labelisationProjetInstance.rapporteurs}" status="i" var="rap">
              <span class="label label-info"> ${rap}</span>
            </g:each></dd>
          </div>
        </div>
        <div class="control-group">

          <div class="span2" style="width: 20%;">
          </div>
        </div>
        <div class="control-group">
          <div class="span2" style="width: 20%;">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Business Model Canevas :" /><span style="color:red">* :</span></label>
          </div>
          <div class="span9">
            <g:if test="${labelisationProjetInstance.getTotalAttachments('presentation')!=0}">
              <table class="table table-striped table-bordered table-condensed">
                <tr>
                  <th>Icon</th>
                  <th>Nom du fichier</th>
                  <th>Taille</th>
                   <g:if test="${((labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2)||(labelisationProjetInstance.etatProjet=='encours pour reaudition'))}">
                  <th>Supprimer</th>
                  </g:if>
                </tr>
                <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('presentation')) }">
                  <tr id="${labelisationProjetInstance.getAttachments('presentation')[i].id}">
                    <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('presentation')[i]}"/></td> 
                  <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('presentation')[i]}"/></td>
                  <td>${labelisationProjetInstance.getAttachments('presentation')[i].niceLength}</td>
                  <g:if test="${((labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2)||(labelisationProjetInstance.etatProjet=='encours pour reaudition'))}">
                  <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('presentation')[i].id},${labelisationProjetInstance.id},'${context11}'); return false;"><i class="icon-trash"></i></a></td>
                  </g:if>
                  </tr>
                </g:each>
              </table>
            </g:if>
            <g:else>
              <div data-provides="fileupload" class="fileupload fileupload-new span12"><input type="hidden" value="" name="presentation" id="presentation"><input type="hidden" name="presentation" id="presentation" >
                <div class="input-append span5" >
                 <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Uploader</span><span class="fileupload-exists">changer</span><input type="file" name="presentation" id="presentation"></span>
                 <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2}">
                 <a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
                 </g:if>
                </div>
                <div class="span1" >
                
                </div>
                <div class="span6" style="text-align: justify;text-justify: inter-word;">
                <span>(format:pdf,size=<20Mo)</span>
                </div>
              </div>
              <div>
              <label><g:message code="Cette présentation ne sera envoyée qu’au bureau permanent" default="Cette présentation ne sera envoyée qu’au bureau permanent " /></label>
            </div>
            </g:else>
          </div>
        </div>
<g:if test="${((labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2)||(labelisationProjetInstance.etatProjet=='encours pour reaudition'))}">
        <g:actionSubmit id="accepter" action="saveEtape2Porteur" name="accepter" class="btn btn-danger" value="Envoyer" />
    </g:if>
        </div>
    </g:if>
  </fieldset>
</g:form> 